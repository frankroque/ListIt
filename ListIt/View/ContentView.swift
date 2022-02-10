//
//  ContentView.swift
//  ListIt
//
//  Created by Francisco Roque on 2/2/22.
//

import SwiftUI

import SwiftUI

extension Color{
    static var myCustomColor = (Color(red: 100/255, green: 60/255 ,blue: 80/255))
}
struct ContentView: View {
    @EnvironmentObject var model: ViewModel
    @State var enterString = ""
    @State var arrayOfOptions = ["Add to List", "See List"]
    var body: some View {
            NavigationView{
                ZStack{
                    LinearGradient(colors: [Color.myCustomColor, Color.blue], startPoint: .topTrailing, endPoint: .bottomTrailing)
                        .edgesIgnoringSafeArea(.all)
                VStack{
                    NavigationLink(destination: AddToListView()){
                        selectButtonStyle(options: arrayOfOptions[0])
                    }.padding()
                    
                    NavigationLink(destination: ListView()){
                        selectButtonStyle(options: arrayOfOptions[1])
                    }.padding()
                }
            }
        }
    }
}

struct selectButtonStyle: View{
    @State var options: String
    var body: some View{
        Text(options)
            .foregroundColor(Color.white)
            .padding()
            .frame(width:300 ,height:50)
            .cornerRadius(5)
            .background(Color.myCustomColor)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
