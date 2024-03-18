//
//  LoginLogoutFlowApp.swift
//  LoginLogoutFlow
//
//  Created by Gaspar Dolcemascolo on 16/03/2024.
//

import SwiftUI

@main
struct LoginLogoutFlowApp: App {
    @StateObject var userStateViewModel = UserStateViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ApplicationSwitcher()
            }
            .navigationViewStyle(.stack)
            .environmentObject(userStateViewModel)
        }
    }
}

struct ApplicationSwitcher: View {
    @EnvironmentObject var vm: UserStateViewModel
    var body: some View {
        if (vm.isLogued) {
            HomeView()
        } else {
            LoginView()
        }
        
    }
}
