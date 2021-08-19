//
//  ContentView.swift
//  Hi Chat
//
//  Created by akhmad khalif on 13/08/21.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
        
        VStack{
            if viewModel.signedIn {
                MainView()
            } else {
                NavigationView{
                    SignIn()
                }
                
            }
        }
        .onAppear(perform: {
            viewModel.signedIn = viewModel.isSignedIn
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
