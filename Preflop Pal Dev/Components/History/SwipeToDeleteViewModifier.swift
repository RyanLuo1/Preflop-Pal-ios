//
//  SwipeToDeleteViewModifier.swift
//  Preflop Pal Dev
//
//  Created by Ryan Luo on 2/14/25.
//

import SwiftUI

struct SwipeToDeleteModifier: ViewModifier {
    @Binding var isDeleted: Bool
    @State private var offset: CGFloat = 0

    func body(content: Content) -> some View {
        ZStack {
            // Background delete indicator
            Color.red
                .cornerRadius(10)
                .overlay(
                    Image(systemName: "trash")
                        .foregroundColor(.white)
                        .font(.title)
                        .offset(x: -40),
                    alignment: .trailing
                )

            // Foreground content with swipe gesture
            content
                .offset(x: offset)
                .gesture(
                    DragGesture(minimumDistance: 5, coordinateSpace: .global)
                        .onChanged { value in
                            if value.translation.width < 0 { // Allow left swipe only
                                offset = value.translation.width
                            }
                        }
                        .onEnded { value in
                            if value.translation.width < -100 { // Threshold for deletion
                                withAnimation(.easeOut) {
                                    offset = -500 // Move off-screen
                                    isDeleted = true
                                }
                            } else {
                                withAnimation(.spring()) {
                                    offset = 0 // Reset position if not deleted
                                }
                            }
                        }
                )
        }
        .padding(.horizontal)
        .opacity(isDeleted ? 0 : 1)
        .onChange(of: isDeleted) { newValue in
            if !newValue {
                offset = 0
            }
        }
    }
}

extension View {
    func swipeToDelete(isDeleted: Binding<Bool>) -> some View {
        self.modifier(SwipeToDeleteModifier(isDeleted: isDeleted))
    }
}
