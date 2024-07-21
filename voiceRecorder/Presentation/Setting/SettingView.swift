//
//  SettingView.swift
//  voiceRecorder
//
//  Created by tony on 7/21/24.
//

import SwiftUI

struct SettingView: View {
    @EnvironmentObject private var homeViewModel: HomeViewModel

    var body: some View {
        
        VStack {
            
            TitleView()
            
            Spacer().frame(height: 20)
            
            pathTabView()
            
            Spacer()
        }
                            
    }
}

#Preview {
    SettingView()
    
}

private struct TitleView: View {
    @EnvironmentObject var homeViewModel: HomeViewModel
    
    var body: some View {
        
        VStack(spacing: 40) {
            HStack {
                Text("설정")
                    .font(.system(size: 30))
                    .padding(.top, 5)
                    .padding(.leading, 20)
                Spacer()
            }
            
            HStack(spacing: 50) {
                VStack {
                    Text("To do")
                    Text("0")
                }

                VStack {
                    Text("메모")
                    Text("0")
                }
                
                VStack {
                    Text("음성메모")
                    Text("0")
                }
            }
        }
    }
}

private struct pathTabView: View {
    @EnvironmentObject private var homeViewModel: HomeViewModel
    
    var body: some View {
        Rectangle()
            .fill(.customGray0)
            .frame(height: 1)
        
        VStack(spacing: 10) {
            
            Button {
                homeViewModel.changeSelectedTab(.todoList)
            } label: {
                HStack {
                    Text("To do List")
                        .foregroundStyle(.customBlack)
                    Spacer()
                    Image("arrowRight")
                    
                }
            }.padding(.all, 20)
            
            Button {
                homeViewModel.changeSelectedTab(.memo)
            } label: {
                HStack {
                    Text("메모장")
                        .foregroundStyle(.customBlack)
                    Spacer()
                    Image("arrowRight")
                }
            }.padding(.all, 20)
            
            Button {
                homeViewModel.changeSelectedTab(.timer)
            } label: {
                
                HStack {
                    Text("타이머")
                        .foregroundStyle(.customBlack)
                    Spacer()
                    Image("arrowRight")
                }
            }.padding(.all, 20)

        }
        Rectangle()
            .fill(.customGray0)
            .frame(height: 1)
    }
    
}
