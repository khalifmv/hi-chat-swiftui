//
//  ContentMessageView.swift
//  Hi Chat
//
//  Created by akhmad khalif on 19/08/21.
//

import SwiftUI

struct ContentMessageView: View {
    var contentMessage: String
    var isCurrentUser: Bool
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 15){
            if isCurrentUser {
                Spacer()
            }
            Text(contentMessage)
                .padding(10)
                .foregroundColor(isCurrentUser ? Color.white : Color.black)
                .background(isCurrentUser ? Color.blue : Color(UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1.0)))
                .cornerRadius(10)
            if !isCurrentUser {
                Spacer()
            }
        }
    }
}

struct ContentMessageView_Previews: PreviewProvider {
    static var previews: some View {
        ContentMessageView(contentMessage: "Hi, I am your friend", isCurrentUser: false)
    }
}
