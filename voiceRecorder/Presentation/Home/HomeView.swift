//
//  HomeView.swift
//  voiceRecorder
//
//  Created by tony on 7/8/24.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var pathModel: PathModel
    @StateObject private var homeViewModel = HomeViewModel()
    
    var body: some View {
        ZStack {
            TabView(selection: $homeViewModel.selectedTab) {
                TodoListView()
                    .tabItem {
                        Image(
                            homeViewModel.selectedTab == .todoList ? "todoIcon_selected" : "todoIcon"
                        )
                    }.tag(Tab.todoList)
            }
            
            SeperatorLineView()
            
        }
    }
}

private struct SeperatorLineView: View {
    fileprivate var body: some View {
        VStack {
            Spacer()
            
            Rectangle()
                .fill(
                    LinearGradient(
                      gradient: Gradient(colors: [Color.white, Color.gray.opacity(0.1)]),
                      startPoint: .top,
                      endPoint: .bottom
                    )
                )
                .frame(height: 10)
                .padding(.bottom, 60)
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
      HomeView()
  }
}
