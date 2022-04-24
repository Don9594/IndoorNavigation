//
//  MotherView.swift
//  Vision
//
//  Created by Don wijesinghe on 4/23/22.
//

import SwiftUI

struct CoverViewTemp: View {
        
        var body: some View {
            VStack {
                VStack{
                    Text("VISION")
                    Button(action: {
                        
                    }, label: {
                        /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
                    })
                    Text("Move Safely Inside the Building")
                
                }
                
            }
        }
   
    func goHome(input:Bool) {
        if input==true{
            if let window = UIApplication.shared.windows.first {
                window.rootViewController = UIHostingController(rootView: OnboardingView())
                window.makeKeyAndVisible()
            }
        }
        else{
            if let window = UIApplication.shared.windows.first {
                window.rootViewController = UIHostingController(rootView: MainView())
                window.makeKeyAndVisible()
            }
        }
        
    }
}

struct MotherView_Previews: PreviewProvider {
    static var previews: some View {
        CoverViewTemp()
    }
}
