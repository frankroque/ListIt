//
//  ViewModel.swift
//  ListIt
//
//  Created by Francisco Roque on 2/2/22.
//

import Foundation
import SQLite

class ViewModel: ObservableObject{
    @Published var itemData = [DataModel]()
    private var db: Connection!
    private var users: Table!

    private var id: Expression<Int64>!
    private var category: Expression<String>!
    private var itemName: Expression<String>!
    private var userName: Expression<String>!

    init(){
        do{
            let path: String = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first ?? ""
            db = try Connection("\(path)/my_users.sqlite3")
            users = Table("users")
            
            id = Expression<Int64>("id")
            category = Expression<String>("category")
            itemName = Expression<String>("Item name")
            userName = Expression<String>("user name")
            
            if(!UserDefaults.standard.bool(forKey: "is_db_created")){
                try db.run(users.create {(t) in
                    t.column(id, primaryKey: true)
                    t.column(category)
                    t.column(itemName)
                    t.column(userName)
                })
                UserDefaults.standard.set(true, forKey: "is_db_created")
            }
        }catch{
            print(error.localizedDescription)
        }

    }
    
    public func addUser(categoryValue: String, itemValue: String ,nameValue: String){
        do{
            try db.run(users.insert(category <- categoryValue, itemName <- itemValue, userName <- nameValue))
        }catch{
            print(error.localizedDescription)
        }
    }
    
    public func getUser() -> [DataModel]{
        var userModels: [DataModel] = []
        
        users = users.order(id.desc)
        do{
            for user in try db.prepare(users){
                let userModel: DataModel = DataModel()
                
                userModel.id = user[id]
                userModel.userName = user[userName]
                userModel.itemName = user[itemName]
                userModel.category = user[category]
                
                userModels.append(userModel)
            }
        } catch{print(error.localizedDescription)}
        return userModels
    }
}
