//
//  HomeView.swift
//  NavDrawer
//
//  Created by shehan karunarathna on 2022-02-21.
//

import SwiftUI

struct HomeView: View {
    @Binding var showMenu:Bool
    var body: some View {
        Button{
            withAnimation {
                showMenu.toggle()
            }
        }label: {
            Text("show menu")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
       ContentView()
    }
}
