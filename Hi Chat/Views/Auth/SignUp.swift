//
//  SignUp.swift
//  Hi Chat
//
//  Created by akhmad khalif on 13/08/21.
//

import SwiftUI

struct SignUp: View {
    @State var email : String = ""
    @State var password : String = ""
    
    @EnvironmentObject var viewModel: AppViewModel
    var body: some View {
        VStack{
            VStack{
                TextField("Email anda", text: $email)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(10)
                SecureField("Password", text: $password)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(10)
                
                Button(action: {
                    guard !email.isEmpty, !password.isEmpty else {
                        return
                    }
                    viewModel.signUp(email: email, password: password)
                }, label: {
                    Text("Daftar")
                        .frame(width: 200, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                })
                .padding()
            }
            .padding()
            
            Spacer()
        }
        .navigationTitle("Buat akun baru")
        
    }
}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
    }
}
