//
//  MainView.swift
//  Preflop Pal Dev
//
//  Created by Ryan Luo on 2/11/25.
//

import SwiftUI

enum Tab {
    case history, home, learn
}

struct MainView: View {
    
    let logout: () -> Void
    
    @State var selectedTab: Tab = .home
    
    var body: some View {
        VStack(spacing: 0) {
            view
                .frame(maxHeight: .infinity)
            tabBar
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .preferredColorScheme(.light)
    }
    
    var view: some View {
        Group {
            switch selectedTab {
            case .history:
                HandHistoryView(vm: HandHistoryViewModel())
            case .home:
                HomeView(vm: HomeViewModel(logout: logout))
            case .learn:
                LearnView()
            }
        }
    }
    
    var tabBar: some View {
        HStack(spacing: 20) {
            TabButton(tab: .history, selectedTab: $selectedTab, title: "History", image: "clock.arrow.circlepath")
            TabButton(tab: .home, selectedTab: $selectedTab, title: "Home", image: "house.fill")
            TabButton(tab: .learn, selectedTab: $selectedTab, title: "Learn", image: "doc.questionmark.fill")
        }
        .frame(maxWidth: .infinity)
        .frame(height: 60)
        .background(Colors.tintColorDark)
        .foregroundStyle(.white)
    }
}

struct TabButton: View {
    let tab: Tab
    @Binding var selectedTab: Tab
    let title: String
    let image: String
    
    var body: some View {
        VStack {
            Image(systemName: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 20, height: 20)
            Text(title)
                .font(.roboto(size: 13, weight: tab == selectedTab ? .bold : .regular))
        }
        .frame(width: 100)
        .onTapGesture {
            selectedTab = tab
        }
    }
}

#Preview {
    MainView(
        logout: {
            print("logout")
        }
    )
}
