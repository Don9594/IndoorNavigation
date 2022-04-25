//
//  CoverView.swift
//  Vision
//
//  Created by Don wijesinghe on 4/24/22.
//

import SwiftUI
import UIKit
struct CoverView: View {
    
    @State var showSecondView = false
    var body: some View {
        Group {
            VStack{
                
                Text("VISION").font(Font.custom("Avenir Heavy",size:60)).padding()
                Spacer()
                Button(action: {
                    showSecondView = true
                    goHome()
                }, label: {
                    AidIcon().scaleEffect(1.5)
                })
                
                Spacer()
                ZStack{
                    DisplayBox()
                    VStack(spacing:0) {
                        Text("Move safely into the building ")
                        Text("OR")
                        HStack {
                            Text("click").padding()
                            AidIcon().frame(width: 45, height: 45, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).scaleEffect(0.5).foregroundColor(.green.opacity(0.5))
                        }
                    }
                    
                }.padding()
                Spacer()
            
            }
        }
        .onAppear() {
            Timer.scheduledTimer(withTimeInterval: 10, repeats: false) { (_) in
                withAnimation {
                    self.showSecondView = true
                    goHome()
                }
            }
        }
    }
    
    func goHome() {
        if let window = UIApplication.shared.windows.first {
            window.rootViewController = UIHostingController(rootView: MainView())
            window.makeKeyAndVisible()
        }
    }
}

struct CoverView_Previews: PreviewProvider {
    static var previews: some View {
        CoverView()
    }
}
