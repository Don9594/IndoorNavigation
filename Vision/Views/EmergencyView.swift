//
//  EmergencyView.swift
//  Vision
//
//  Created by Don wijesinghe on 4/25/22.
//

import SwiftUI

struct EmergencyView: View {
    @State private var timeRemaining = 100
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var body: some View {
        VStack{
            HStack{
                Image(systemName: "play.circle").resizable().padding().scaledToFill().frame(width: 100, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Image(systemName: "textformat.abc.dottedunderline").resizable().padding().scaledToFill().frame(width: 100, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }
            Text("Are you okay?...").padding()
            Text("Emergency protocol active on standby").foregroundColor(.red).padding()
            Text("Sound Alarm...").padding().foregroundColor(.red)
            Text("Calling 911...").padding().foregroundColor(.red)
            //timer here
            
            Text("Speak to ensure your safety!").font(Font.custom("Avenir",size:25)).multilineTextAlignment(.center).padding()
            Spacer()
            ZStack{
                DisplayBox()
                Text("Did you fall? Is everything okay?").font(Font.custom("Avenir",size:20)).foregroundColor(.orange)
            }
        }
    }
}

struct EmergencyView_Previews: PreviewProvider {
    static var previews: some View {
        EmergencyView()
    }
}
