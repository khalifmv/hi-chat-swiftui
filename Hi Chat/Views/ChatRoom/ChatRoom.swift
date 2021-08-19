//
//  ChatRoom.swift
//  Hi Chat
//
//  Created by akhmad khalif on 13/08/21.
//

import SwiftUI

struct ChatRoom: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State var typingMessage: String = ""
    
    init() {
        UITableView.appearance().separatorStyle = .none
        UITableView.appearance().tableFooterView = UIView()
    }
    
    let count = 1...10
    
    var body: some View {
        
//        VStack{
//            List(){
//                ForEach((1...20), id: \.self) { color in
//                    ContentMessageView(contentMessage: "haloo", isCurrentUser: true)
//                }
//            }
//
//            HStack {
//                TextField("Message...", text: $typingMessage)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                    .frame(minHeight: CGFloat(30))
//
//                Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
//                    Text("Send")
//                }
//            }.frame(minHeight: CGFloat(50)).padding()
//        }
        ChatView()
        .navigationBarTitle("")
        .navigationBarTitleDisplayMode(.inline)
        //                    .toolbar { // <2>
        //                        ToolbarItem(placement: .principal) { // <3>
        //                            VStack(alignment: .leading) {
        //                                Text("Title").font(.headline)
        //                                Text("Subtitle").font(.subheadline)
        //                            }
        //                        }
        //                    }
        .navigationBarItems(
            leading:
                HStack{
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        HStack{
                            Image(systemName: "chevron.backward").imageScale(.large)
                        }
                    }
                    Image("dummy_pp")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .clipShape(Circle())
                    VStack(alignment: .leading) {
                        Text("Akhmad Khalif").font(.headline)
                        Text("Online").font(.subheadline)
                    }
                },
            trailing:
                Button(action: {
                    print("User icon pressed...")
                }) {
                    HStack{
                        Image(systemName: "phone").imageScale(.large)
                        Image(systemName: "video").imageScale(.large)
                    }
                }
        )
        
        .navigationBarBackButtonHidden(true)
    }
}

struct ChatRoom_Previews: PreviewProvider {
    static var previews: some View {
        ChatRoom()
    }
}
