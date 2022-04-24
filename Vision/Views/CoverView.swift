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
                
                Text("VISION").padding()
                Spacer()
                Button(action: {
                    showSecondView = true
                    goHome()
                }, label: {
                    VStack{
                        Image(systemName: "bell")
                        Text("Main Menu")
                    }
                    
                })
                
                Text("Move Safely Into the Building ").padding()
                Text("OR").padding()
                Text("Click 'Main Menu")
                Spacer()
            }
        }
        .onAppear() {
            Timer.scheduledTimer(withTimeInterval: 5, repeats: false) { (_) in
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
