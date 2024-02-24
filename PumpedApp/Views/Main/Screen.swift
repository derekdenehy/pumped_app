//
//  Feed.swift
//  PumpedApp
//
//  Created by Derek Denehy on 2/23/24.
//

import SwiftUI

struct Screen: View {
    var body: some View {
        ZStack{
            Rectangle()
                .padding(.top)
            Color.black
                .ignoresSafeArea()
            Image("cbumpre")
                .resizable()
                .cornerRadius(20.0)
                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fit/*@END_MENU_TOKEN@*/)
               
            
            }
        }
    }


#Preview {
    Screen()
}
