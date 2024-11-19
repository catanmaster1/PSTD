//
//  PSTDApp.swift
//  PSTD
//
//  Created by Edward Flint on 11/13/24.
//


//
//  PSTDApp.swift
//  PSTD
//
//  Created by Edward Flint on 10/24/24.
//

import SwiftUI

@main

struct PSTDApp: App {

    @State private var appModel = AppModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(appModel)
        }

        ImmersiveSpace(id: appModel.immersiveSpaceID) {
            ImmersiveView()
                .environment(appModel)
                .onAppear {
                    appModel.immersiveSpaceState = .open
                }
                .onDisappear {
                    appModel.immersiveSpaceState = .closed
                }
        }
        .immersionStyle(selection: .constant(.mixed), in: .mixed)
     }
}
