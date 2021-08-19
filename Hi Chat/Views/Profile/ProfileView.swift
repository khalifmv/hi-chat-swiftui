//
//  ProfileView.swift
//  Hi Chat
//
//  Created by akhmad khalif on 13/08/21.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var viewModel: AppViewModel
    var body: some View {
        VStack{
            Text("You are signed in")
            
            Button(action: {
                viewModel.signOut()
            }, label: {
                Text("Keluar")
                    .frame(width: 200, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            })
            .padding()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
