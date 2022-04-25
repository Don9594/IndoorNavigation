//
//  DisplayBox.swift
//  Vision
//
//  Created by Don wijesinghe on 4/24/22.
//

import SwiftUI

struct DisplayBox: View {
    var body: some View {
        
            GeometryReader{ geo in
                Rectangle().frame(width: geo.size.width, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).cornerRadius(15.0).foregroundColor(Color.black.opacity(0.1))
            }.frame(height:100)
            
        }
    
    
}

struct DisplayBox_Previews: PreviewProvider {
    static var previews: some View {
        DisplayBox()
    }
}
