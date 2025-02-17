//
//  PositionSelectionView.swift
//  Preflop Pal Dev
//
//  Created by Ryan Luo on 2/13/25.
//

import SwiftUI

struct PositionSelectionView: View {
    @Binding var selectedPosition: String?
    let positions: [String]
    
    var body: some View {
        GeometryReader { geometry in
            DropDownView(
                title: "Your Position",
                prompt: "Select Position",
                options: positions,
                selection: $selectedPosition
            )
            .frame(height: geometry.size.height * 25) // 70% of screen height
        }
    }
}

struct DropDownView: View {
    let title: String
    let prompt: String
    let options: [String]
    @Binding var selection: String?
    @State private var isExpanded = false
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .center) {
                // Title
                Text(title)
                    .font(.system(size: geometry.size.width * 0.04))
                    .foregroundStyle(Colors.tintColorDark)
                    .opacity(0.8)
                
                // Main dropdown button
                VStack {
                    HStack {
                        Text((selection?.isEmpty ?? true) ? prompt : selection!)
                            .font(.system(size: geometry.size.width * 0.04))
                            .foregroundColor(selection?.isEmpty ?? true ? .gray : Colors.tintColorDark)
                        
                        Spacer()
                        
                        Image(systemName: "chevron.down")
                            .font(.system(size: geometry.size.width * 0.04))
                            .foregroundStyle(.gray)
                            .rotationEffect(.degrees(isExpanded ? -180 : 0))
                    }
                    .frame(height: geometry.size.height * 0.15)
                    .padding(.horizontal, geometry.size.width * 0.04)
                    .onTapGesture {
                        withAnimation(.snappy) {
                            isExpanded.toggle()
                        }
                    }
                    
                    if isExpanded {
                        ScrollView {
                            VStack {
                                ForEach(options, id: \.self) { option in
                                    HStack {
                                        Text(option)
                                            .font(.system(size: geometry.size.width * 0.04))
                                            .foregroundStyle(selection == option ? Colors.tintColorPrimary : .gray)
                                        
                                        Spacer()
                                        
                                        if selection == option {
                                            Image(systemName: "checkmark")
                                                .font(.system(size: geometry.size.width * 0.04))
                                        }
                                    }
                                    .frame(height: geometry.size.height * 0.15)
                                    .padding(.horizontal, geometry.size.width * 0.04)
                                    .onTapGesture {
                                        withAnimation(.snappy) {
                                            selection = option
                                            isExpanded.toggle()
                                        }
                                    }
                                }
                            }
                        }
                        .frame(maxHeight: geometry.size.height * 0.6)
                        .transition(.move(edge: .bottom))
                    }
                }
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: geometry.size.width * 0.03))
                .shadow(radius: geometry.size.width * 0.01)
                .frame(width: geometry.size.width * 0.8)
            }
            .frame(maxWidth: .infinity)
        }
    }
}

// Preview Provider
//struct PositionSelectionView_Previews: PreviewProvider {
//    static var previews: some View {
//        PositionSelectionView()
//            .padding()
//            .background(Colors.tintColorLight)
//    }
//}
