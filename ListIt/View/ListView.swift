//
//  ListView.swift
//  ListIt
//
//  Created by Francisco Roque on 2/2/22.
//

import SwiftUI

struct ListView: View {
    @State var model: [DataModel] = []

    var body: some View {
        VStack{
            HStack{
                Text("Name")
                    .multilineTextAlignment(.leading)
                    .padding()
                    .frame(width: 100)
                Text("Item")
                    .padding()
                    .frame(width:100)
                Text("Category")
                    .multilineTextAlignment(.trailing)
                    .padding()
                    .frame(width: 110.0)
            }
            List(self.model){(model) in
                HStack{
                    Text(model.userName)
                        .multilineTextAlignment(.leading)
                        .padding()
                        .frame(width: 100)
                    Text(model.itemName)
                        .multilineTextAlignment(.leading)
                        .padding()
                        .frame(width: 110)
                    Text(model.category)
                        .multilineTextAlignment(.leading)
                        .padding()
                        .frame(width: 100)
                }
            }
        }.onAppear(perform: {
            self.model = ViewModel().getUser()
        })
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
