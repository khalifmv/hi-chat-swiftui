//
//  MessageView.swift
//  Hi Chat
//
//  Created by akhmad khalif on 19/08/21.
//

import SwiftUI

struct MessageView: View {
    var current: Bool
    var body: some View {
        HStack(alignment: .bottom, spacing: 15) {
            Spacer()
            ContentMessageView(contentMessage: "Hi, I am your friend", isCurrentUser: false)
                }
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView()
    }
}
