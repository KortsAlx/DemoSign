//
//  DemoSignApp.swift
//  DemoSign
//
//  Created by Brandon Alexis Martinez Cortes on 28/09/22.
//

import SwiftUI

@main
struct DemoSignApp: App {
    @StateObject var authentication = Authentication()

    var body: some Scene {
        WindowGroup {
            if authentication.isValidated{
                RequestListView()
                    .environmentObject(authentication)
            }else{
                LoginView().environmentObject(authentication)
                
            }
            
            //RequestListView()
            //ContentView()
        }
    }
}
