//
//  MainView.swift
//  Vision
//
//  Created by Don wijesinghe on 4/23/22.
//

import SwiftUI

struct MainView: View {
    @AppStorage("shouldShowOnboarding") var  shouldShowOnboarding = true
    var body: some View {
        
        NavigationView{
            VStack {
                HStack{
                    Button(action: {
                            shouldShowOnboarding.toggle()}, label: {
                                Image(systemName: "questionmark.circle").scaleEffect(2.0, anchor: .leading).foregroundColor(.black)
                            })
                    Spacer()
                    
                    
                    NavigationLink(
                        destination: SettingsView(),
                        label: {Image(systemName: "gearshape").scaleEffect(2, anchor: .trailing).foregroundColor(.black)
                        })
                    
                }.padding()
                VStack{
                    Text("Main").font(Font.custom("Avenir Heavy",size:50))
                    Spacer()
                    Text("Tap Screen to give voice command").lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                    VoiceIcon()
                    Text("'Go to ECSS2.306'")
                        .fontWeight(.ultraLight)
                    Text("'Go to the nearest restroom'")
                        .fontWeight(.ultraLight)
                    Text("'Call 911'")
                        .fontWeight(.ultraLight)
                    Text("'Settings..'")
                        .fontWeight(.ultraLight)
                    Spacer()
                }.gesture(DragGesture(minimumDistance: 10, coordinateSpace: .local)
                            .onEnded({ value in
                                if value.translation.width < 0 {
                                    // left
                                    go(param: 0)
                                }
                                
                                if value.translation.width > 0 {
                                    // right
                                    go(param: 1)
                                    
                                }
                                if value.translation.height < 0 {
                                    // up
                                    go(param: 2)
                                }
                                
                                if value.translation.height > 0 {
                                    // down
                                    go(param: 3)
                                }
                            }))
                NavigationLink("Click for Navigation", destination: NavMapView(place: IdentifiablePlace(lat: 32.986310, long: -96.750730)))
                
            }.navigationBarTitle("").navigationBarHidden(true)
            
        }.fullScreenCover(isPresented: $shouldShowOnboarding, content: { OnboardingView(shouldShowOnboarding: $shouldShowOnboarding)})
    }
    func go(param:Int) {
        
        if let window = UIApplication.shared.windows.first {
            if param==0{
                //left swipe
                window.rootViewController = UIHostingController(rootView: SettingsView())
            }
            else if param==1{
                //right swipe
                window.rootViewController = UIHostingController(rootView: SettingsView())
            }
            else if param==2{
                // top swipe
                window.rootViewController = UIHostingController(rootView: SettingsView())
            }
            else if param==3{
                //down swipe
                window.rootViewController = UIHostingController(rootView: SettingsView())
            }
            else{
                //do nothing
            }
            
            window.makeKeyAndVisible()
        }
    }
}


struct OnboardingView: View{
    @Binding var shouldShowOnboarding: Bool
    var body: some View{
        VStack {
            VStack{
                Text("HELP").font(Font.custom("Avenir Heavy",size:50))
                Spacer()
                Text("Click Screen")
                Text("or")
                Text("say 'VISION'").padding()
                Spacer()
                VoiceIcon()
                Text("Swipe Commands").padding()
                
                HStack(alignment: .bottom){
                    VStack{
                        Image(systemName: "chevron.left")
                        Text("Left")
                        Text("Favorite 1")
                    }
                    VStack{
                        Image(systemName: "chevron.up")
                        Text("Up")
                        Text("Main Menu")
                    }
                    VStack{
                        Image(systemName: "chevron.down")
                        Text("Down")
                        Text("Navigation")
                    }
                    VStack{
                        Image(systemName: "chevron.right")
                        Text("Right")
                        Text("Favorite 2")
                    }
                }.padding()
                
                
                Spacer()
            }.gesture(DragGesture(minimumDistance: 10, coordinateSpace: .local)
                        .onEnded({ value in
                            if value.translation.width < 0 {
                                // left
                                go(param: 0)
                            }
                            
                            if value.translation.width > 0 {
                                // right
                                go(param: 1)
                                
                            }
                            if value.translation.height < 0 {
                                // up
                                go(param: 2)
                            }
                            
                            if value.translation.height > 0 {
                                // down
                                go(param: 3)
                            }
                        }))
            Button {
                shouldShowOnboarding.toggle()
            } label: {
                Text("Get Started")
            }
            
            
        }
    }
    
    func go(param:Int) {
        
        if let window = UIApplication.shared.windows.first {
            if param==0{
                //left swipe
                window.rootViewController = UIHostingController(rootView: MainView())
            }
            else if param==1{
                //right swipe
                window.rootViewController = UIHostingController(rootView: MainView())
            }
            else if param==2{
                // top swipe
                window.rootViewController = UIHostingController(rootView: MainView())
            }
            else if param==3{
                //down swipe
                window.rootViewController = UIHostingController(rootView: MainView())
            }
            else{
                //do nothing
            }
            
            window.makeKeyAndVisible()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
