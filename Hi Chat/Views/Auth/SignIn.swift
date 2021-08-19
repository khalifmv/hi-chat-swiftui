//
//  SignIn.swift
//  Hi Chat
//
//  Created by akhmad khalif on 13/08/21.
//

import SwiftUI

struct SignIn: View {
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
                    viewModel.signIn(email: email, password: password)
                }, label: {
                    Text("Masuk")
                        .frame(width: 200, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                })
                .padding()
                
                NavigationLink("Daftar akun", destination: SignUp())
                    .padding()
            }
            .padding()
            
            Spacer()
        }
        .navigationTitle("Masuk")
        
    }
}


struct SignIn_Previews: PreviewProvider {
    static var previews: some View {
        SignIn()
    }
}
