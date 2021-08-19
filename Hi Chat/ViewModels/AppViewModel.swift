//
//  AppViewModel.swift
//  Hi Chat
//
//  Created by akhmad khalif on 13/08/21.
//

import Foundation
import FirebaseAuth


class AppViewModel: ObservableObject{
    let auth = Auth.auth()
    
    @Published var signedIn = false
    
    var isSignedIn : Bool {
        return auth.currentUser != nil
    }
    
    func signIn(email: String, password: String) {
        auth.signIn(withEmail: email, password: password,
                    completion: {[weak self] result, error in
                        guard result != nil, error == nil else {
                            return
                        }
                        DispatchQueue.main.async {
                            self?.signedIn = true
                        }
                    })
    }
    
    func signUp(email: String, password: String) {
        auth.createUser(withEmail: email, password: password, completion: { [weak self] result, error in
            guard result != nil, error == nil else {
                return
            }
            DispatchQueue.main.async {
                self?.signedIn = true
            }
        })
    }
    
    func signOut() {
        try? auth.signOut()
        
        self.signedIn = false
    }
}
