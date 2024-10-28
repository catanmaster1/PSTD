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




struct ARSceneView: View {
    
    @State var isVisible = true
    
    @State private var newPosition = SIMD3<Float>(0, 0, 0)
    
    @State var model = ModelEntity(
        mesh: .generateSphere(radius: 0.1),
        materials: [SimpleMaterial(color: .white, isMetallic: true)])
    
    var body: some View {
        
        
        RealityView { content in
            
            model.components.set(InputTargetComponent())
            model.components.set(CollisionComponent(shapes: [.generateSphere(radius: 0.1)]))
            
            if isVisible{
                content.add(model)
            }
            
            let cameraEntity = PerspectiveCamera()
            cameraEntity.transform.translation = SIMD3<Float>(20, 20, 20) // Adjust this value as needed
            content.add(cameraEntity)
            }
            
            
            
                .onTapGesture {
                    // Update to a new random position
                    newPosition = SIMD3<Float>(0.1,0,0)
                    
                    // Apply new position
                    model.transform.translation = newPosition
                }
            
        
        
    }
    
}
struct ContentView: View {
    var body: some View {
        ARSceneView()
            .edgesIgnoringSafeArea(.all)
    }
}
