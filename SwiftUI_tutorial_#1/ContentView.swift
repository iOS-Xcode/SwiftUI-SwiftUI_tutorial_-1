//
//  ContentView.swift
//  SwiftUI_tutorial_#1
//
//  Created by Seokhyun Kim on 2020-10-08.
//

import SwiftUI

struct ContentView: View {
    // @State 값을 변화를 감지하여 뷰를 새로 부름.body를 새로 그림. 위에서 아래로.
    @State private var isActivated: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    //위의 @State isActivated 를 MyvStatckView init으로 값을 넘김 이때 Binding 에서 값을 받음.
                    MyVStackView(isActivated: $isActivated)
                    MyVStackView(isActivated: $isActivated)
                    MyVStackView(isActivated: $isActivated)

                    
                } //HStack
                .padding(isActivated ? 50.0 : 10.0)
                .background(isActivated ? Color.yellow : Color.black)
                //탭 재스쳐 추가
                .onTapGesture {
                    print("HStack is clicked")
                    //애니메이션과 함께
                    withAnimation{ self.isActivated.toggle()
                        //toggle은 상태값을 반대로 변환
                    }
                }
                //네이게이션 버튼(링크)
                NavigationLink(
                    destination: MyTextView(isActivated: $isActivated)) {
                    Text("네이게이션")
                        .fontWeight(.heavy)
                        .font(.system(size: 40))
                        .padding()
                        .background(Color.orange)
                        .foregroundColor(Color.white)
                        .cornerRadius(30)
                    
                } .padding(.top, 50)
            }
            
        } // Navigation View
        
    }
}
//struct MyVStackView: View {
//    var body: some View {
//        VStack {
//            Text("1!")
//                .fontWeight(.semibold)
//                .font(.system(size: 50))
//                .padding()
//            Text("2!")
//                .fontWeight(.semibold)
//                .font(.system(size: 50))
//            Text("3!")
//                .fontWeight(.semibold)
//                .font(.system(size: 50))
//        } //VStack
//        .background(Color.red)
//    }
//}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
