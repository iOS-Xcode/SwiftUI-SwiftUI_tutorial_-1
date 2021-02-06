//
//  MyTextView.swift
//  SwiftUI_tutorial_#1
//
//  Created by Seokhyun Kim on 2020-10-08.
//

import SwiftUI

struct MyTextView: View {
    //데이터를 연동시킨다.
    @Binding
    var isActivated: Bool
    
    //생성자 Bool에 대한 기본값 constant
    init(isActivated: Binding<Bool> = .constant(false)) {
        _isActivated = isActivated
    }
    
    @State private var index: Int = 0
    //배경색 배열 준비
    private let backgroundColors = [
        Color.red,
        Color.yellow,
        Color.blue,
        Color.green,
        Color.orange
    ]
    var body: some View {
        VStack {
            Spacer() //윗쪽
            Text("배경아이템 인텍스 \(self.index)")
                .font(.system(size: 30))
                .fontWeight(.bold)
                //infinity : 무한대로.
                //frame을 넣어 붉은 색을 채움.
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 100)
            Text("활성화 상태: \(String(isActivated))")
                .font(.system(size: 30))
                .fontWeight(.bold)
                .foregroundColor(self.isActivated ? Color.yellow : Color.gray)
                .background(Color.black)
            Spacer() //아래쪽
        }.background(backgroundColors[index])
        //아래의 safeArea 채움,
        .edgesIgnoringSafeArea(.all)
        .onTapGesture {
            print("배경아이템이 클릭 되었다.")
            if self.index == self.backgroundColors.count - 1 {
                self.index = 0
            } else {
                self.index += 1

            }
        }
    }
}

struct MyTextView_Previews: PreviewProvider {
    static var previews: some View {
        MyTextView()
    }
}
