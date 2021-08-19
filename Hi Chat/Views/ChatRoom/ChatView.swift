//
//  ChatView.swift
//  Hi Chat
//
//  Created by akhmad khalif on 19/08/21.
//

import SwiftUI

struct Stack<Content: View>: View {
    var axis: Axis.Set
    var content: Content
    
    init(_ axis: Axis.Set = .vertical, @ViewBuilder builder: ()->Content) {
        self.axis = axis
        self.content = builder()
    }
    
    var body: some View {
        switch axis {
        case .horizontal:
            HStack {
                content
            }
        case .vertical:
            VStack {
                content
            }
        default:
            VStack {
                content
            }
        }
    }
}

struct ReversedScrollView<Content: View>: View {
    var axis: Axis.Set
    var leadingSpace: CGFloat
    var content: Content
    
    init(_ axis: Axis.Set = .horizontal, leadingSpace: CGFloat = 10, @ViewBuilder builder: ()->Content) {
        self.axis = axis
        self.leadingSpace = leadingSpace
        self.content = builder()
    }
    
    func minWidth(in proxy: GeometryProxy, for axis: Axis.Set) -> CGFloat? {
        axis.contains(.horizontal) ? proxy.size.width : nil
    }
    
    func minHeight(in proxy: GeometryProxy, for axis: Axis.Set) -> CGFloat? {
        axis.contains(.vertical) ? proxy.size.height : nil
    }
    
    var body: some View {
        GeometryReader { proxy in
            ScrollView(axis) {
                Stack(axis) {
                    Spacer(minLength: leadingSpace)
                    content
                }
                .frame(
                    minWidth: minWidth(in: proxy, for: axis),
                    minHeight: minHeight(in: proxy, for: axis)
                )
            }
        }
    }
}

struct ChatView: View {
    @State private var messages: [Message] = []
    @State private var text: String = ""
    @State private var targetMessage: Message?
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                ScrollViewReader { scrollView in
                    ReversedScrollView(.vertical) {
                        ForEach(messages) { message in
                            MessageView(message: message)
                                .transition(.move(edge: .bottom))
                        }
                    }
                    .padding(.horizontal)
                    .padding(.bottom)
                    .background(Color.gray.opacity(0.3))
                    
                    .onChange(of: targetMessage) { message in
                        if let message = message {
                            targetMessage = nil
                            withAnimation(.default) {
                                scrollView.scrollTo(message.id)
                            }
                        }
                    }
                    
                    HStack {
                        TextField("Message", text: $text)
                            .frame(height: 44)
                            .disableAutocorrection(true)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        Button(action: {
                            send()
                        }) {
                            Text("Send")
                        }
                    }
                    .padding(.horizontal)
                }
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
    }
    
    func send() {
        let message = Message(id: UUID(), text: self.text, userId: "1", type: .random)
        self.messages.append(message)
        self.text = ""
        self.targetMessage = message
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}

extension Date {
    static var formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm"
        return formatter
    }()
}

// MARK: - Data
enum RecieptType: Int, Codable, Equatable {
    case sent
    case received
}

struct Message: Codable, Hashable, Identifiable {
    var id: UUID
    var text: String
    var userId: String
    var type: RecieptType
    var date: Date = Date()
}

extension RecieptType {
    var backgroundColor: Color {
        switch self {
        case .sent:
            return .green
        case .received:
            return Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
        }
    }
    
    var textColor: Color {
        switch self {
        case .sent:
            return .white
        case .received:
            return .black
        }
    }
    
    static var random: RecieptType {
        let random = Int.random(in: 0...1)
        return RecieptType(rawValue: random) ?? .sent
    }
}

// MARK: - MessageView
struct MessageView: View {
    var message: Message
    @State private var animationAmount: CGFloat = 1
    
    var body: some View {
        HStack {
            if message.type == .sent {
                Spacer(minLength: 16)
            }
            
            VStack(alignment: .trailing, spacing: 0) {
                Text(message.text)
                    .padding(8)
                Text("\(message.date, formatter: Date.formatter)")
                    .font(.system(size: 13))
                    .padding(6)
            }
            .background(message.type.backgroundColor)
            .foregroundColor(message.type.textColor)
            .cornerRadius(8)
            
            if message.type == .received {
                Spacer(minLength: 16)
            }
        }
        .animation(.easeOut)
        .opacity(Double(2 - animationAmount))
        .frame(maxWidth: .infinity)
        .id(message.id)
    }
}

