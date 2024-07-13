//
//  TodoListView.swift
//  voiceRecorder
//
//  Created by tony on 7/8/24.
//

import SwiftUI

struct TodoListView: View {
    @EnvironmentObject private var pathModel: PathModel
    
    var body: some View {
        ZStack {
            
            VStack {
                
                
                TitleView()
                    .padding(.top, 20)
                AnnouncementView()
            }
            WriteTodoBtnView()
                .padding(.trailing, 20)
                .padding(.bottom, 50)
        }
        
    }
}

#Preview {
    TodoListView()
}

private struct TitleView: View {
    fileprivate var body: some View {
        
        HStack {
            Text("To do list를 \n추가해 보세요.")
            Spacer()
        }
        .font(.system(size: 30,weight: .bold))
        .padding(.leading, 20)
    }
}

private struct AnnouncementView: View {
    fileprivate var body: some View {
        VStack(spacing: 15) {

            Spacer()
            
            Image("pencil")
                .renderingMode(.template)
            Text("\"매일 아침 5시 운동하자!\"")
            Text("\"내일 8시 수강 신청하자!\"")
            Text("\"1시 반 점심약속 리마인드 해보자!\"")
            
            Spacer()
        }
        .font(.system(size: 16))
        .foregroundColor(.customGray2)
    }
}

private struct WriteTodoBtnView: View {
    @EnvironmentObject private var pathModel: PathModel
    
    fileprivate var body: some View {
        VStack {
            Spacer()
            
            HStack {
                Spacer()
                Button(
                    action: {
                        pathModel.paths.append(.todoView)
                    }, label: {
                        Image("writeBtn")
                    }
                )
            }
        }
    }
}
