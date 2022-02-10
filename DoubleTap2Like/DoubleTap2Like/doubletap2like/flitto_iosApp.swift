//
//  flitto_iosApp.swift
//  flitto_ios
//
//  Created by minkpang on 2022/01/24.
//

import SwiftUI

@main
struct flitto_iosApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
