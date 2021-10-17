//
//  FloatingView.swift
//  TechChallenge
//
//  Created by Lukasz Dziwosz on 17/10/2021.
//

import SwiftUI

struct FloatingView: View {
    var body: some View {
        HStack {
            VStack{
                Spacer()
                Text("Total spent:")
                    .secondary()
            }
            .padding()
            
            Spacer()
            
            VStack(alignment: .trailing) {
                Text("food")
                    .font(.headline)
                    .foregroundColor(.black)
                Spacer()
                
                Text("$200.00")
                    .fontWeight(.bold)
                    .secondary()
                
            }
            .padding()
        }
        .frame( height: 80)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.accentColor, lineWidth: 2)
            )
    }
}

struct FloatingView_Previews: PreviewProvider {
    static var previews: some View {
        FloatingView()
    }
}
