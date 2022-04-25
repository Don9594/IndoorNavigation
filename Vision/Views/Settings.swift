//
//  Settings.swift
//  Vision
//
//  Created by Don wijesinghe on 4/24/22.
//

import SwiftUI

struct Settings: View {
    @State var languagePicker = 0
    @State var visualPicker = 0
    @State var routePicker = 0
    @State var emergencyPicker = 0
    @State var nicknamePicker = 0
    @State var gotomainPicker = 0
    @State var manualPicker = 0
    
    let languages = ["English","Chinese","Korean"]
    let visual = ["On","Off"]
    let routes = ["Safest","Fastest","Shortest"]
    let emergency = [911,119]
    let nickname = ["vision"]
    let gotomain = ["Swipe Up"]
    let manual = ["Press long"]
    
    var body: some View {
        
        VStack {
            Text("Settings").font(Font.custom("Avenir Heavy",size:50)).padding()
            Text("Tell me your preference").font(Font.custom("Avenir",size:20)).padding()
            VoiceIcon()
            VStack(alignment: .leading) {
            HStack {
                Picker("Language",selection:$languagePicker){
                    ForEach(0..<languages.count){
                        Text(self.languages[$0])
                    }
                }.pickerStyle(MenuPickerStyle())
                Text(self.languages[languagePicker])
            }
            HStack {
                Picker("Visual Mode",selection:$visualPicker){
                    ForEach(0..<visual.count){
                        Text(self.visual[$0])
                    }
                }.pickerStyle(MenuPickerStyle())
                Text(self.visual[visualPicker])
            }
            HStack {
                Picker("Emergency Call",selection:$emergencyPicker){
                    ForEach(0..<emergency.count){
                        Text(String(self.emergency[$0]))
                    }
                }.pickerStyle(MenuPickerStyle())
                Text(String(self.emergency[emergencyPicker]))
            }
            HStack {
                Picker("Route",selection:$routePicker){
                    ForEach(0..<routes.count){
                        Text(self.routes[$0])
                    }
                }.pickerStyle(MenuPickerStyle())
                Text(self.routes[routePicker])
            }
            HStack {
                Picker("Nickname",selection:$nicknamePicker){
                    ForEach(0..<nickname.count){
                        Text(self.nickname[$0])
                    }
                }.pickerStyle(MenuPickerStyle())
                Text(self.nickname[nicknamePicker])
            }
            HStack {
                Picker("Go to main",selection:$gotomainPicker){
                    ForEach(0..<gotomain.count){
                        Text(self.gotomain[$0])
                    }
                }.pickerStyle(MenuPickerStyle())
                Text(self.gotomain[gotomainPicker])
            }
            HStack {
                Picker("Manual",selection:$manualPicker){
                    ForEach(0..<manual.count){
                        Text(self.manual[$0])
                    }
                }.pickerStyle(MenuPickerStyle())
                Text(self.manual[manualPicker])
            }
            }
            Spacer()
        }
        
    }
    
}


struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
