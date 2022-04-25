//
//  AidIcon.swift
//  Vision
//
//  Created by Don wijesinghe on 4/24/22.
//

import SwiftUI

struct AidIcon: View {
    var body: some View {
        Image(systemName: "figure.walk.circle").resizable().frame(width: 90, height: 90, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).foregroundColor(.green.opacity(0.5))
    }
}

struct AidIcon_Previews: PreviewProvider {
    static var previews: some View {
        AidIcon()
    }
}
