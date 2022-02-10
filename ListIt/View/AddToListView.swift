//
//  AddToListView.swift
//  ListIt
//
//  Created by Francisco Roque on 2/2/22.
//

import SwiftUI

struct AddToListView: View {
    @State var id: String = ""
    @State var category: String = ""
    @State var itemName: String = ""
    @State var userName: String = ""
    
    var body: some View {
        VStack{
            Text("Create Your List")
                .padding()
            TextField("Enter Category", text:$category)
                .padding()
                .border(Color.white)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("Enter Item Name", text:$itemName)
                .padding()
                .border(Color.white)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("Enter User Name", text:$userName)
                .padding()
                .border(Color.white)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button(action: {
                ViewModel().addUser(categoryValue: category.self, itemValue: itemName.self, nameValue: userName.self)
                category = ""
                itemName = ""
                userName = ""
            }, label: {
                    Text("Add Item")
                        .foregroundColor(Color.white)
                        .padding()
                        .frame(width: 200, height: 50)
                        .border(Color.black)
                        .background(Color.myCustomColor)
            })
        }
        
    }
}

struct AddToListView_Previews: PreviewProvider {
    static var previews: some View {
        AddToListView()
    }
}
