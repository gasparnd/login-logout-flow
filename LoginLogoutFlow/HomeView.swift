//
//  HomeView.swift
//  LoginLogoutFlow
//
//  Created by Gaspar Dolcemascolo on 16/03/2024.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var vm: UserStateViewModel
    var body: some View {
        
        if(vm.isBusy){
            ProgressView()
        }else{
            Text("Home Screen")
                .navigationTitle("Home")
                .toolbar {
                    
                    Button {
                        Task{
                            await vm.signOut()
                        }
                    } label: {
                        Image(systemName:  "rectangle.portrait.and.arrow.right")
                    }
                    
                }
        }
    }
}

#Preview {
    HomeView()
}
