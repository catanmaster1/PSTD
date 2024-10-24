//
//  ContentView.swift
//  PSTD
//
//  Created by Edward Flint on 10/24/24.
//

import SwiftUI
import RealityKit
import RealityKitContent
import ARKit

struct ContentView: View {

    var body: some View {
        VStack {
            //Model3D(named: "Scene", bundle: realityKitContentBundle)
               // .padding(.bottom, 50)

            Text("Welcome to Lawn Mower. Go to each corner of your lawn, and pinch your finger at each corner")

            //ToggleImmersiveSpaceButton()
        }
        .padding()
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
        .environment(AppModel())
}
