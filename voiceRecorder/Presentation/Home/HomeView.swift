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
    private let todoIcon = "todoIcon"
    private let memoIcon = "memoIcon"
    var body: some View {
        ZStack {
            TabView(selection: $homeViewModel.selectedTab) {
                TodoListView()
                    .tabItem {
                        Image(
                            homeViewModel.selectedTab == .todoList ? "todoIcon_selected" : todoIcon
                        )
                    }.tag(Tab.todoList)
                
                MemoListView()
                  .tabItem {
                    Image(
                      homeViewModel.selectedTab == .memo
                      ? "memoIcon_selected"
                      : memoIcon
                    )
                  }
                  .tag(Tab.memo)
                
                TimerView()
                    .tabItem {
                        Image(
                            homeViewModel.selectedTab == .timer ? "timerIcon_selected" : "timerIcon"
                        )
                    }
                    .tag(Tab.timer)
                
                SettingView()
                  .tabItem {
                    Image(
                      homeViewModel.selectedTab == .setting
                      ? "settingIcon_selected"
                      : "settingIcon"
                    )
                  }.tag(Tab.setting)
                
            }
            .environmentObject(homeViewModel)
            
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
