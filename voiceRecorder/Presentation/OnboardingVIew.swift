//
//  OnboardingVIew.swift
//  voiceRecorder
//
//  Created by tony on 7/3/24.
//

import SwiftUI

struct OnboardingView: View {
    @StateObject private var onboardingViewModel = OnboardingViewModel()
    @StateObject private var pathModel = PathModel()
    @StateObject private var todoListViewModel = TodoListViewModel()
    @StateObject private var memoListViewModel = MemoListViewModel()

    var body: some View {
        NavigationStack(path: $pathModel.paths) {
            OnboardingContentView(onboardingViewModel: onboardingViewModel)
                .navigationDestination(for: PathType.self) { pathType in
                    switch pathType {
                    case .homeView:
                        HomeView()
                            .navigationBarBackButtonHidden()
                            .environmentObject(todoListViewModel)
                            .environmentObject(memoListViewModel)
                    case .todoView:
                        TodoView()
                            .navigationBarBackButtonHidden()
                            .environmentObject(todoListViewModel)                        
                    case let .memoView(isCreateMode, memo):
                      MemoView(
                        memoViewModel: isCreateMode
                        ? .init(memo: .init(title: "", content: "", date: .now))
                        : .init(memo: memo ?? .init(title: "", content: "", date: .now)),
                        isCreateMode: isCreateMode
                      )
                        .navigationBarBackButtonHidden()
                        .environmentObject(memoListViewModel)
                    }
                }
        }.environmentObject(pathModel)
    }
}

#Preview {
    OnboardingView()
}

private struct OnboardingContentView: View {
    @ObservedObject private var onboardingViewModel: OnboardingViewModel
    
    fileprivate init(onboardingViewModel: OnboardingViewModel) {
        self.onboardingViewModel = onboardingViewModel
    }
    
    fileprivate var body: some View {
        VStack {
            OnboardingCellListView(onboardingViewModel: onboardingViewModel)
            Spacer()
            StartBtnView()
        }.edgesIgnoringSafeArea(.top)
    }
    
}

private struct OnboardingCellListView: View {
    @ObservedObject private var onboardingViewModel: OnboardingViewModel
    @State private var selectedIndex: Int
    
    fileprivate init(onboardingViewModel: OnboardingViewModel,
                     selectedIndex: Int = 0
    ) {
        self.onboardingViewModel = onboardingViewModel
        self.selectedIndex = selectedIndex
    }

    fileprivate var body: some View {
        TabView(selection: $selectedIndex) {
          ForEach(Array(onboardingViewModel.onboardingContents.enumerated()), id: \.element) { index, onboardingContent in
            OnboardingCellView(onboardingContent: onboardingContent)
              .tag(index)
          }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 1.5)
        .background(
          selectedIndex % 2 == 0
          ? Color.customSky
          : Color.customBackgroundGreen
        )
        .clipped()
    }
}

// MARK: - 온보딩 셀 뷰
private struct OnboardingCellView: View {
  private var onboardingContent: OnboardingContent
  
  fileprivate init(onboardingContent: OnboardingContent) {
    self.onboardingContent = onboardingContent
  }
  
  fileprivate var body: some View {
    VStack {
      Image(onboardingContent.imageFileName)
        .resizable()
        .scaledToFit()
      
      HStack {
        Spacer()
        
        VStack {
          Spacer()
            .frame(height: 46)
          
          Text(onboardingContent.title)
            .font(.system(size: 16, weight: .bold))
          
          Spacer()
            .frame(height: 5)
          
          Text(onboardingContent.subTitle)
            .font(.system(size: 16))
        }
        
        Spacer()
      }
      .background(Color.customWhite)
      .cornerRadius(0)
    }
    .shadow(radius: 10)
  }
}

// MARK: - 시작하기 버튼 뷰
private struct StartBtnView: View {
  @EnvironmentObject private var pathModel: PathModel
  
  fileprivate var body: some View {
    Button(
      action: { pathModel.paths.append(.homeView) },
      label: {
        HStack {
          Text("시작하기")
            .font(.system(size: 16, weight: .medium))
            .foregroundColor(.customGreen)
          
          Image("startHome")
            .renderingMode(.template)
            .foregroundColor(.customGreen)
        }
      }
    )
    .padding(.bottom, 50)
  }
}
