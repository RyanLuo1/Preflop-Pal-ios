//
//  HandHistoryView.swift
//  Preflop Pal Dev
//
//  Created by Ryan Luo on 2/13/25.
//

import SwiftUI

class HandHistoryViewModel: ObservableObject {
    
    init() {
        refresh()
    }
    
    @Published var handHistory: [HandRecord] = []
    
    func refresh() {
        FirebaseManager.shared.getHandHistory { [weak self] handHistory in
            self?.handHistory = handHistory
        }
    }
    
    func delete(id: String) {
        FirebaseManager.shared.deleteHandRecord(id) { success in
            if success {
                self.handHistory.removeAll(where: {$0.id == id})
            }
        }
    }
    
}

struct HandHistoryView: View {
    
    @StateObject var vm: HandHistoryViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            navigationBar
            ScrollView {
                VStack(spacing: 10) {
                    ForEach(vm.handHistory, id: \.id) { hand in
                        HandHistoryRow(hand: hand, delete: {
                            vm.delete(id: hand.id)
                        })
                    }
                    Spacer()
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 20)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Colors.tintColorLight)
    }
    
    var navigationBar: some View {
        ZStack() {
            Text("Hand History")
                .font(.roboto(size: 24, weight: .bold))
                .frame(maxWidth: .infinity)
        }
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity)
        .frame(height: 48)
        .foregroundStyle(.white)
        .background(Colors.tintColorPrimary)
    }
}

struct HandHistoryRow: View {
    let hand: HandRecord
    let delete: () -> Void
    
    @State var isExpanded: Bool = false
    
    @State private var wasDeleted: Bool = false
    @State private var deleteIsPresented: Bool = false
    
    var dateString: String {
        let date = Date(timeIntervalSince1970: TimeInterval(hand.timestamp/1000))
        let formatter = DateFormatter()
        formatter.dateFormat = "M/d h:mm a"
        formatter.amSymbol = "AM"
        formatter.pmSymbol = "PM"
        return formatter.string(from: date)
    }
    
    var body: some View {
        VStack {
            switch isExpanded {
            case true:
                expanded
            case false:
                preview
            }
        }
        //.animation(.smooth(duration: 0.3), value: isExpanded)
        .onTapGesture {
            isExpanded.toggle()
        }
        .swipeToDelete(isDeleted: $wasDeleted)
        .onChange(of: wasDeleted) { newValue in
            if newValue {
                deleteIsPresented.toggle()
            }
        }
        .alert("Are you sure you want to delete this hand history?", isPresented: $deleteIsPresented, actions: {
            Button {
                delete()
            } label: {
                Text("Delete")
            }
            Button {
                wasDeleted = false
            } label: {
                Text("Cancel")
            }
        })
    }
    
    var expanded: some View {
        VStack(spacing: 10) {
            HStack {
                Text(hand.card1)
                    .font(.roboto(size: 30, weight: .bold))
                Text(hand.card2)
                    .font(.roboto(size: 30, weight: .bold))
            }
            VStack(alignment: .leading, spacing: 8) {
                Text("Table Size: ")
                    .font(.roboto(size: 14, weight: .bold)) +
                Text("\(hand.tableSize)")
                    .font(.roboto(size: 14, weight: .regular))
                
                Text("Position: ")
                    .font(.roboto(size: 14, weight: .bold)) +
                Text("\(hand.position)")
                    .font(.roboto(size: 14, weight: .regular))
                
                Text("Previous Action: ")
                    .font(.roboto(size: 14, weight: .bold)) +
                Text("\(hand.previousAction)")
                    .font(.roboto(size: 14, weight: .regular))
                
                Text("Advice: ")
                    .font(.roboto(size: 14, weight: .bold))
                    .foregroundStyle(Colors.tintColorPrimary) +
                Text("\(hand.advice)")
                    .font(.roboto(size: 14, weight: .regular))
                    .foregroundStyle(Colors.tintColorPrimary)
                
                Text(dateString)
                    .font(.roboto(size: 13, weight: .regular))
                    .foregroundStyle(.black)
                    .opacity(0.25)
            }
            .frame(maxWidth: .infinity)
            .foregroundStyle(Colors.tintColorDark)
        }
        .padding(15)
        .frame(maxWidth: .infinity)
        .background(.white)
        .cornerRadius(10)
        .shadow(color: .black.opacity(0.25), radius: 2, y: 2)
    }
    
    var preview: some View {
        HStack {
            Text(hand.card1)
                .font(.roboto(size: 17, weight: .bold))
            Text(hand.card2)
                .font(.roboto(size: 17, weight: .bold))
            
            Spacer()
            
            Text(dateString)
                .font(.roboto(size: 13, weight: .regular))
                .opacity(0.25)
        }
        .padding(10)
        .frame(maxWidth: .infinity)
        .frame(height: 50)
        .background(.white)
        .cornerRadius(10)
        .shadow(color: .black.opacity(0.25), radius: 2, y: 2)
    }
}

#Preview {
    HandHistoryView(
        vm: HandHistoryViewModel()
    )
}
