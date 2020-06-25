//
//  MapViewTest.swift
//  SwiftUIPracticeApp
//
//  Created by Ryota on 2020/06/22.
//  Copyright © 2020 Ryota. All rights reserved.
//

import SwiftUI
import MapKit

struct MapViewTest: UIViewRepresentable {
    @State var randomLatitude : Double = 0.0
    @State var randomLongitude : Double = 0.0

    func getNumbers(_ number: Double, _ times: Double) -> Double {
        let number = Double.random(in: -90 ... 90)
        return number * times
    }
    
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }

    func updateUIView(_ view: MKMapView, context: Context) {
        //座標
        let coordinate = CLLocationCoordinate2D(
            latitude: getNumbers(randomLatitude, 1), longitude: getNumbers(randomLongitude, 2))
        //エリア
        let span = MKCoordinateSpan(latitudeDelta: 20.0, longitudeDelta: 20.0)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        view.setRegion(region, animated: true)
        //アノテーション（ピン）
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = "ここがあなたの"+"\n"+"ラッキープレイス！"
        view.addAnnotations([annotation])
    }
}

struct MapViewTest_Previews: PreviewProvider {
    static var previews: some View {
        MapViewTest()
    }
}
