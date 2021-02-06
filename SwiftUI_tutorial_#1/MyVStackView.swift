//
//  MyVStackView.swift
//  SwiftUI_tutorial_#1
//
//  Created by Seokhyun Kim on 2020-10-08.
//

import SwiftUI

struct MyVStackView: View {
    
    //데이터를 연동시킨다.
    @Binding
    var isActivated: Bool
    
    //생성자 Bool에 대한 기본값 constant
    init(isActivated: Binding<Bool> = .constant(false)) {
        _isActivated = isActivated
    }
    var body: some View {
        VStack {
            Text("1!")
                .fontWeight(.semibold)
                .font(.system(size: 50))
                .padding()
            Text("2!")
                .fontWeight(.semibold)
                .font(.system(size: 50))
            Text("3!")
                .fontWeight(.semibold)
                .font(.system(size: 50))
        } //VStack
        .background(self.isActivated ? Color.green : Color.red)
        .padding(self.isActivated ? 10 : 0)
    }
}

struct MyVStackView_Previews: PreviewProvider {
    static var previews: some View {
        MyVStackView()
    }
}
