//
//  RoundViews.swift
//  Bullseye
//
//  Created by Mozart Sousa on 29/12/21.
//

import SwiftUI

struct RoundViewsStroked: View {
    let systemName : String
    
    var body: some View {
        Image(systemName: systemName)
            .frame(width: 56, height: 56)
            .cornerRadius(100)
            .font(.title)
            .foregroundColor(Color("TextColor"))
            .overlay(
                RoundedRectangle(cornerRadius: 100)
                    .strokeBorder( Color("ButtonStrokeColor") ,lineWidth: 2)
            )
    }//end body
    
}//end RoundViewsStroked

struct RoundViewsFilled: View {
    let systemName : String
    
    var body: some View {
        Image(systemName: systemName)
            .frame(width: 56, height: 56)
            .background(Color("ButtonFilledBackgroundColor"))
            .cornerRadius(100)
            .foregroundColor(Color("ButtonFilledTextColor"))
            .font(.title)
            
    }//end body
    
}//end RoundViewsStroked

struct PreviewView : View{
    var body: some View{
        VStack {
            HStack {
                RoundViewsStroked(systemName: "arrow.counterclockwise")
                Spacer()
                RoundViewsStroked(systemName: "list.dash")
            }
            .padding(.leading, 30)
            .padding(.trailing, 30)
            .padding(.top, 30)
            Spacer()
        }.ignoresSafeArea()
    }
}//end PreviewView

struct RoundViews_Previews: PreviewProvider {
    static var previews: some View {
        PreviewView()
        PreviewView()
            .preferredColorScheme(.dark)
        
    }
}//end RoundViews_Previews
