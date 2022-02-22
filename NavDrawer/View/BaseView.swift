//
//  BaseView.swift
//  NavDrawer
//
//  Created by shehan karunarathna on 2022-02-21.
//

import SwiftUI

struct BaseView: View {
    @State var showMenu:Bool = false
    @State var offset:CGFloat = 0
    @State var lastStoredOffset : CGFloat = 0
    @GestureState var gestureOffset = 0
    init(){
        UITabBar.appearance().isHidden = true
    }
    @State var currrentSelection = "house"
    
    @ViewBuilder
    func TabButton(image:String) -> some View{
        Button{
            withAnimation {
                currrentSelection = image
            }
        }label: {
            Image(systemName: image)
                .font(.system(size: 22))
                .foregroundColor(image == currrentSelection ? .black : .gray)
            
        }
        .frame(maxWidth:.infinity)
        
    }
    var body: some View {
        let slidebarWidth:Double = getBounds().width - 90
        NavigationView{
            HStack{
                SlideMenu(showMenu: $showMenu)
                VStack{
                    TabView(selection: $currrentSelection){
                        HomeView(showMenu: $showMenu)
                            .navigationBarTitleDisplayMode(.inline)
                            .navigationBarHidden(true)
                            .tag("house")
                        Text("Search")
                            .navigationBarTitleDisplayMode(.inline)
                            .navigationBarHidden(true)
                            .tag("magnifyingglass")
                        Text("Messages")
                            .navigationBarTitleDisplayMode(.inline)
                            .navigationBarHidden(true)
                            .tag("message")
                        Text("Notifications")
                            .navigationBarTitleDisplayMode(.inline)
                            .navigationBarHidden(true)
                            .tag("bell")
                    }
                    VStack(spacing:0){
                        Divider()
                        HStack(spacing:0){
                            
                            TabButton(image: "house")
                            TabButton(image: "magnifyingglass")
                            TabButton(image: "bell")
                            TabButton(image: "message")
                        }
                        .padding(.top, 15)
                    }
                   
                }
                .frame(width: getBounds().width)
                .overlay(
                   
                    Rectangle()
                        .fill(
                           
                            Color.black
                                
                                .opacity(Double((offset / slidebarWidth) / 5))
                                
                        )
                        .ignoresSafeArea(.container, edges: .vertical)
                        .onTapGesture {
                            withAnimation {
                                showMenu.toggle()
                            }
                        }
                    
                )
            }
            .frame(width: slidebarWidth + getBounds().width)
            .offset(x: -slidebarWidth / 2 )
            .offset(x:offset )
            .gesture(
                DragGesture()
                    .updating($gestureOffset, body: { value, out, _ in
                        out = Int(value.translation.width)
                    })
                    .onEnded(onEnd(value:))
            )
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
        }
        .animation(.easeInOut, value: offset == 0)
        .onChange(of: showMenu) { newValue in
            if showMenu && offset == 0{
                offset = slidebarWidth
                lastStoredOffset = offset
            }
            
            if !showMenu && offset == slidebarWidth{
                offset = 0
                lastStoredOffset = 0
            }
        }
        .onChange(of: gestureOffset) { newValue in
            onnChange()
        }
    }
    
    func onnChange(){
        let slidebarWidth = getBounds().width - 90
      
    }
    
    func onEnd(value: DragGesture.Value) {
        let slidebarWidth = getBounds().width - 90
        lastStoredOffset  = offset
    }
      
}

struct BaseView_Previews: PreviewProvider {
    static var previews: some View {
        BaseView()
    }
}
