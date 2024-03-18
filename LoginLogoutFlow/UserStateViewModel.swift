//
//  UseStateViewModel.swift
//  LoginLogoutFlow
//
//  Created by Gaspar Dolcemascolo on 16/03/2024.
//

import Foundation

enum UserStateError: Error {
    case signInError, signOutError
}

@MainActor
class UserStateViewModel: ObservableObject {
    @Published var isLogued: Bool {
        didSet {
            UserDefaults.standard.set(isLogued, forKey: "isLogued")
        }
    }
    @Published var isBusy = false
    
    init() {
        print("ViewModel ")
        self.isLogued = UserDefaults.standard.bool(forKey: "isLogued")
    }
    
    func signIn(email: String, password: String) async -> Result<Bool, UserStateError> {
        self.isBusy = true
        do {
            try await Task.sleep(nanoseconds: 1_000_000_000)
            self.isLogued = true
            self.isBusy = false
            return .success(true)
        } catch {
            self.isBusy = false
            return .failure(.signInError)
        }
    }
    
    func signOut() async -> Result<Bool, UserStateError> {
        self.isBusy = true
        do {
            try await Task.sleep(nanoseconds: 1_000_000_000)
            self.isLogued = false
            self.isBusy = false
            return .success(true)
        } catch {
            self.isBusy = false
            return .failure(.signOutError)
        }
    }
}
