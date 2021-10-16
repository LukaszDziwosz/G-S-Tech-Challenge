//
//  RoundButtonView.swift
//  TechChallenge
//
//  Created by Lukasz Dziwosz on 16/10/2021.
//

import SwiftUI

struct RoundButtonView: View {
    var color: Color
    var title: String
    
    var body: some View {
        Text(title)
            .font(.title2)
            .fontWeight(.bold)
            .padding(.horizontal ,16)
            .padding(.vertical , 8)
            .background(color)
            .foregroundColor(.white)
            .cornerRadius(25)
    }
}

struct RoundButtonView_Previews: PreviewProvider {
    static var previews: some View {
        RoundButtonView(color: .black, title: "all")
    }
}
