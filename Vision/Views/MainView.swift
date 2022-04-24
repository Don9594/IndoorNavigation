//
//  MainView.swift
//  Vision
//
//  Created by Don wijesinghe on 4/23/22.
//

import SwiftUI

struct MainView: View {
    @State var shouldShowOnboarding = true
    var body: some View {
        Text("Main View")
        NavigationView{
            
        }.fullScreenCover(isPresented: $shouldShowOnboarding, content: {
            OnboardingView(shouldShowOnboarding: $shouldShowOnboarding)
        })
    }
}


struct OnboardingView: View{
    @Binding var shouldShowOnboarding: Bool
    var body: some View{
        VStack {
            VStack{
                Spacer()
                Text("Click Screen")
                Text("or")
                Text("say 'VISION'").padding()
                Spacer()
                Image(systemName: "mic.circle").scaleEffect(3, anchor: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).padding()
                
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
            }.gesture(
                LongPressGesture(minimumDuration: 2).onEnded({ _ in
                    //call voice assistant
                })
            ).gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local)
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
