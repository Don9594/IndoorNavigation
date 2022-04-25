//
//  VoiceIcon.swift
//  Vision
//
//  Created by Don wijesinghe on 4/24/22.
//

import SwiftUI

struct VoiceIcon: View {
    var body: some View {
        Image(systemName: "mic.circle").resizable().padding().scaledToFill().frame(width: 200, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).foregroundColor(.green.opacity(0.8))    }
}

struct VoiceIcon_Previews: PreviewProvider {
    static var previews: some View {
        VoiceIcon()
    }
}
