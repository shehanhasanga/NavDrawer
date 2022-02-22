//
//  SlideMenu.swift
//  NavDrawer
//
//  Created by shehan karunarathna on 2022-02-21.
//

import SwiftUI

struct SlideMenu: View {
    @Binding var showMenu:Bool
    
    @ViewBuilder
    func TabButton(title:String, image:String) -> some View{
        Button{
            
        }label: {
            HStack(spacing:10){
                Image(systemName: image)
                    .font(.system(size: 22))
                Text(title)
            }
            .foregroundColor(.black)
            .frame(maxWidth:.infinity, alignment: .leading)
        }
    }
    var body: some View {
        VStack(alignment:.leading, spacing: 0){
            VStack(alignment:.leading, spacing: 12){
                Image(systemName: "person")
                    .font(.system(size: 60))
                Text("shehan")
                    .font(.title2.bold())
                Text("@karuna")
                    .font(.callout)
                HStack(spacing:12){
                    Button{
                        
                    }label: {
                        Label {
                            Text("followers")
                        } icon: {
                            Text("200")
                                .fontWeight(.bold)
                        }

                    }
                    Button{
                        
                    }label: {
                        Label {
                            Text("Following")
                        } icon: {
                            Text("1.2M")
                                .fontWeight(.bold)
                        }

                    }
                }
                .foregroundColor(.black)
            }
            .padding(.horizontal)
            .padding(.leading)
            .padding(.bottom)
            ScrollView(.vertical, showsIndicators: false){
                VStack{
                    
                    VStack(alignment:.leading, spacing: 45){
                        TabButton(title: "Profile", image: "person")
                        TabButton(title: "Lists", image: "book")
                        TabButton(title: "Messages", image: "message")
                        TabButton(title: "Notifications", image: "bell")
                        TabButton(title: "Liked", image: "heart")
                       
                    }
                    .padding()
                    .padding(.leading)
                    .padding(.top, 35)
                    
                    Divider()
                    TabButton(title: "Twiter Ads", image: "book")
                        .padding()
                        .padding(.leading)
                    Divider()
                    VStack(alignment:.leading, spacing: 12){
                        Button("Terms and Privacy"){
                            
                        }
                        Button("Help Center"){
                            
                        }
                    }
                    .padding()
                    .padding(.leading)
                    .frame(maxWidth:.infinity, alignment: .leading)
                    .foregroundColor(.black)
                }
            }
            VStack{
                Divider()
                HStack{
                    Button{
                        
                    }label: {
                        Image(systemName: "book")
                            .font(.system(size: 22))
                    }
                    Spacer()
                    Button{
                        
                    }label: {
                        Image(systemName: "bell")
                            .font(.system(size: 22))
                    }
                }
                .padding(.horizontal)
                .padding(.top)
            }
        }
        .frame(maxWidth:.infinity, alignment: .leading)
        .frame(width: getBounds().width - 90)
        .frame(maxHeight:.infinity)
        .frame(maxWidth:.infinity, alignment: .leading)
       
        .background(
            Color.gray.opacity(0.2)
                .ignoresSafeArea()
        )
       
        
    }
}

struct SlideMenu_Previews: PreviewProvider {
    static var previews: some View {
       ContentView()
    }
}

extension View{
    func getBounds() -> CGRect{
        return UIScreen.main.bounds
    }
}
