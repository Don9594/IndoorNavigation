//
//  Navigation.swift
//  Vision
//
//  Created by Don wijesinghe on 4/25/22.
//

import SwiftUI
import MapKit

struct IdentifiablePlace: Identifiable {
    let id: UUID
    let location: CLLocationCoordinate2D
    init(id: UUID = UUID(), lat: Double, long: Double) {
        self.id = id
        self.location = CLLocationCoordinate2D(
            latitude: lat,
            longitude: long)
    }
}

struct NavMapView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 32.986310,longitude: -96.750730),
        latitudinalMeters: 100,
        longitudinalMeters: 100
    )
    let place: IdentifiablePlace
    
    
    var body: some View {
        VStack {
            Map(coordinateRegion: $region,
                annotationItems: [place])
            { place in
                MapPin(coordinate: place.location,
                       tint: Color.purple)
            }
            ZStack {
                DisplayBox()
                Text("Swipe Here for Main Menu")
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
        }.navigationBarTitle("Route").navigationBarTitleDisplayMode(.inline)
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



struct Navigation_Previews: PreviewProvider {
    static var previews: some View {
        NavMapView(place: IdentifiablePlace(lat: 32.986310, long: -96.750730))
    }
}
