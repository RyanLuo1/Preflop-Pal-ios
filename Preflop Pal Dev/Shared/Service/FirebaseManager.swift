//
//  HandRecordService.swift
//  Preflop Pal Dev
//
//  Created by Ryan Luo on 2/13/25.
//

import FirebaseAuth
import FirebaseDatabase

class FirebaseManager {
    private let auth: Auth = Auth.auth()
    private let database: DatabaseReference = Database.database().reference()
    
    static let shared = FirebaseManager()
    
    private init() {}
    
    func createUser(email: String, password: String, callback: @escaping (Bool, String?) -> Void) {
        auth.createUser(withEmail: email, password: password) { [weak self] authResult, error in
            guard let self = self else { return }
            if let error = error {
                callback(false, error.localizedDescription)
            } else {
                guard let user = authResult?.user else {
                    callback(false, "User creation failed.")
                    return
                }
                let userData = ["email": email, "uid": user.uid]
                self.database.child("users").child(user.uid).setValue(userData) { error, _ in
                    callback(error == nil, error?.localizedDescription)
                }
            }
        }
    }
    
    func signIn(email: String, password: String, callback: @escaping (Bool, String?) -> Void) {
        auth.signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                callback(false, "Incorrect email or password.")
            } else {
                callback(true, nil)
            }
        }
    }
    
    func signOut() {
        do {
            try auth.signOut()
        } catch {
            print("Error signing out: \(error.localizedDescription)")
        }
    }
    
    func isUserLoggedIn() -> Bool {
        return auth.currentUser != nil
    }
    
    func getCurrentUserId() -> String? {
        return auth.currentUser?.uid
    }
    
    func getHandHistory(callback: @escaping ([HandRecord]) -> Void) {
        guard let userId = auth.currentUser?.uid else { return }
        database.child("users").child(userId).child("handHistory")
            .queryOrdered(byChild: "timestamp")
            .observeSingleEvent(of: .value) { snapshot in
                var handRecords: [HandRecord] = []
                for child in snapshot.children {
                    if let childSnapshot = child as? DataSnapshot,
                       let handRecord = HandRecord(snapshot: childSnapshot) {
                        handRecords.append(handRecord)
                    }
                }
                callback(handRecords.reversed()) // Most recent first
            } withCancel: { error in
                callback([])
            }
    }
    
    func saveHandRecord(_ handRecord: HandRecord, callback: @escaping (Bool) -> Void) {
        var handRecord = handRecord
        guard let userId = auth.currentUser?.uid else { return }
        guard let handKey = database.child("users").child(userId).child("handHistory").childByAutoId().key else {
            print("ERROR")
            callback(false)
            return
        }
        
        handRecord.id = handKey // Ensure HandRecord has a mutable 'id' property
        
        database.child("users").child(userId).child("handHistory").child(handKey).setValue(handRecord.toDictionary) { error, _ in
            callback(error == nil)
        }
    }
    
    func deleteHandRecord(_ handId: String, callback: @escaping (Bool) -> Void) {
        guard let userId = auth.currentUser?.uid else { return }
        database.child("users").child(userId).child("handHistory").child(handId).removeValue { error, _ in
            callback(error == nil)
        }
    }
    
    func sendEmailVerification(callback: @escaping (Bool, String?) -> Void) {
        auth.currentUser?.sendEmailVerification(completion: { error in
            callback(error == nil, error?.localizedDescription)
        })
    }
    
    func isEmailVerified() -> Bool {
        return auth.currentUser?.isEmailVerified ?? false
    }
}

extension HandRecord {
    init?(snapshot: DataSnapshot) {
        guard let value = snapshot.value as? [String: Any] else { return nil }
        // Initialize HandRecord with dictionary values
        self.init(card1: value["card1"] as! String, card2: value["card2"] as! String, tableSize: value["tableSize"] as! String, position: value["position"] as! String, previousAction: value["previousAction"] as! String, advice: value["advice"] as! String, timestamp: value["timestamp"] as! Int)
    }
}
