
/*
* ContentView.swift
* PSTD
* Created by Edward Flint on 10/24/24.
*/

import SwiftUI
import RealityKit
import RealityKitContent
import ARKit
struct ContentView: View {
    @State private var newPosition = SIMD3<Float>(0, 0, 0)
    @State var model = ModelEntity( // Creates the sphere
        mesh: .generateSphere(radius: 0.1),
        materials: [SimpleMaterial(color: .white, isMetallic: true)])
    var body: some View {
        RealityView { content in // Sets the user's interactions with the sphere
            model.components.set(InputTargetComponent())
            model.components.set(CollisionComponent(shapes: [.generateSphere(radius: 0.1)]))
            content.add(model) // adds the sphere
        }
                .onTapGesture { /* Sets x and y variables to random numbers in a range
                    compatible with the vision pro */
                    let xrand = (Float(Int.random(in: -10...10)))/50
                    let yrand = (Float(Int.random(in: -5...5)))/50
                    newPosition = SIMD3<Float>(xrand, yrand, 0)
                    model.transform.translation = newPosition
                }
    }
    
}






