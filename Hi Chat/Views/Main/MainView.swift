//
//  MainView.swift
//  Hi Chat
//
//  Created by akhmad khalif on 13/08/21.
//

import SwiftUI

var tabItems = ["Chat", "Calls", "Profil"]

struct MainView: View {
    var body: some View{
        NavigationView{
            MainSubView()
        }
        
    }
}

struct MainSubView: View {
    @EnvironmentObject var viewModel: AppViewModel
    @State var selected = "Chat"
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    @State var centerX : CGFloat = 0
    var body: some View {
        VStack(spacing: 0){
            TabView(selection: $selected) {
                Chat()
                    .navigationBarHidden(selected == tabItems[0])
                    .tag(tabItems[0])
                ScrollView{
                    ForEach(1...35, id: \.self){ i in
                        NavigationLink("Coba", destination: Text("tes"))
                    }
                }
                .navigationBarHidden(selected == tabItems[1])
                .tag(tabItems[1])
                
                ProfileView()
                    .tag(tabItems[2])
                
            }
            //            GeometryReader{_ in
            //                ZStack{
            //                    Chat()
            //                        .tag(tabItems[0])
            //                        .opacity(selected == "Chat" ? 1 : 0)
            //                    ProfileView()
            //                        .navigationBarHidden(selected == "Status")
            //                        .tag(tabItems[1])
            //                        .opacity(selected == "Status" ? 1 : 0)
            //                    ScrollView{
            //                        ForEach(1...35, id: \.self){ i in
            //                            NavigationLink("Coba", destination: Text("tes"))
            //                        }
            //                    }
            //                    .navigationBarHidden(selected == "Profil")
            //                        .opacity(selected == "Profil" ? 1 : 0)
            //                        .tag(tabItems[2])
            //                }
            //            }
            
            HStack(spacing: 0){
                ForEach(tabItems, id: \.self) { value in
                    GeometryReader{
                        reader in
                        TabBarButton(selected: $selected, value: value, centerX: $centerX, rect: reader.frame(in: .global))
                            .onAppear(perform: {
                                if value == tabItems.first {
                                    centerX = 60
                                }
                            })
                    }
                    .frame(width: 70, height: 50)
                    
                    if value != tabItems.last{Spacer(minLength: 0)}
                }
            }
            .padding(.horizontal, 25)
            .padding(.top)
            .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom == 0 ? 15 : UIApplication.shared.windows.first?.safeAreaInsets.bottom)
            .background(Color.white.clipShape(AnimatedShape(centerX: centerX)))
            .shadow(color: Color.black.opacity(0.2), radius: 25, x:0, y: -1)
            .padding(.top, -15)
            .ignoresSafeArea(.all, edges: .horizontal)
        }
        .onAppear(perform: {
            selected = "Chat"
        })
        .ignoresSafeArea(.all, edges: .bottom)
    }
}

struct TabBarButton : View {
    @Binding var selected: String
    var value: String
    @Binding var centerX: CGFloat
    var rect: CGRect
    
    var body: some View{
        Button(action: {
            withAnimation(.spring()){
                selected = value
                centerX = rect.midX
            }
        }, label: {
            VStack{
                Image("dummy_pp")
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 26, height: 26)
                    .foregroundColor(selected == value ? Color(.blue) : .gray)
                
                Text(value)
                    .font(.caption)
                    .foregroundColor(.black)
                    .opacity(selected == value ? 1 : 0)
            }
            
            .padding(.top)
            .frame(width: 70, height: 50)
            .offset(y: selected == value ? -15 : 0)
        })
    }
}

struct AnimatedShape: Shape {
    var centerX : CGFloat
    
    var animatableData: CGFloat{
        get{return centerX;}
        set{centerX = newValue;}
    }
    
    func path(in rect: CGRect) -> Path {
        return Path {path in
            path.move(to: CGPoint(x: 0, y: 10))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            
            path.addLine(to: CGPoint(x: rect.width, y: 10))
            
            path.move(to: CGPoint(x: centerX - 35, y: 10))
            path.addQuadCurve(to: CGPoint(x: centerX + 35, y: 10), control: CGPoint(x: centerX, y: -20))
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
