//
//  Chat.swift
//  Hi Chat
//
//  Created by akhmad khalif on 13/08/21.
//

import SwiftUI

class Item {
    var id: Int = 1
    var name: String = "Someone"
    var subChat: String = "Haloo gaes halo halo galo"
    var fotoProfil: Image {
        Image("dummy_pp")
    }
}

struct Chat: View {
    var dummy = [
        Item(),
        Item(),
        Item(),
        Item(),
        Item(),
        Item(),
        Item(),
        Item()
    ]
    
    var body: some View {
        GeometryReader{g in
            VStack{
                HStack{
                    Text("Hi Chat")
                }
                ScrollView{
                    ZStack{
                        HStack{
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.black)
                            TextField("Cari", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                                .foregroundColor(.black)
                            Spacer()
                        }
                        .padding(.horizontal)
                        .padding(.vertical, 10)
                        .clipShape(Capsule())
                        .background(RoundedRectangle(
                            cornerRadius: 200,
                            style: .continuous
                        )
                        .fill(Color.gray.opacity(0.3)))
                    }
                    .padding(.horizontal)
                    HStack{
                        Text("Activity")
                            .padding(.top)
                            .padding(.leading)
                        Spacer()
                    }
                    ScrollView(.horizontal) {
                        HStack(spacing: 15) {
                            Image(systemName: "plus.square.fill.on.square.fill")
                                .foregroundColor(.blue)
                                .frame(width: 70, height: 70)
                                .background(Color.gray.opacity(0.2))
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.blue, lineWidth: 4))
                            ForEach(0..<10) {_ in
                                Image("dummy_pp")
                                    .resizable()
                                    .frame(width: 70, height: 70)
                                    .clipShape(Circle())
                                    .overlay(Circle().stroke(Color.blue, lineWidth: 4))
                            }
                            
                        }
                        .padding(.leading)
                        .padding(.top, 4)
                        .padding(.bottom, 20)
                    }
                    
                    HStack{
                        Text("Pesan")
                            .padding(.leading)
                        Spacer()
                    }
                    
                    List{
                        
    //                    Section(content: {
    //                        ForEach(dummy, id: \.id) {
    //                            dummy in
    //                            NavigationLink(
    //                                destination: ChatRoom(),
    //                                label: {
    //                                    ChatCell(dummy: dummy)
    //                                })
    //
    //                        }
    //                    })
                        ForEach(dummy, id: \.id) {
                            dummy in
                            NavigationLink(
                                destination: ChatRoom(),
                                label: {
                                    ChatCell(dummy: dummy)
                                })
                                
                        }
                    }
                    
                    .frame(width: g.size.width - 5, height: g.size.height - 50, alignment: .center)
                }
            }
        }
        .navigationTitle("Hi Chat")
        
        .navigationBarItems(trailing:
                                Button(action: {
                                    print("User icon pressed...")
                                }) {
                                    HStack{
                                        Image(systemName: "square.and.pencil").imageScale(.large)
                                        Text("Chat baru")
                                    }
                                }
        )
    }
}

struct ChatCell: View {
    var dummy: Item
    var body: some View {
        HStack{
            dummy.fotoProfil
                .resizable()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.red, lineWidth: 0))
            VStack(alignment: .leading){
                Text("\(dummy.name)")
                Text("\(dummy.subChat)")
                    .font(.system(size: 12, weight: .light))
            }

        }
    }
}

struct Chat_Previews: PreviewProvider {
    static var previews: some View {
        Chat()
    }
}
