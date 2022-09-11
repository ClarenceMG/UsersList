//
//  UsersListInteractor.swift
//  UsersList
//
//  Created by Clarence Montenegro on 10/09/2022.
//

import RealmSwift

class UsersListInteractor: UsersListInteractorInput {
    
    lazy var apiService = APIService()
    
    lazy var localRealm: Realm = {
        return try! Realm()
    }()
    
    weak var output: UsersListInteractorOutput!
    
    func retrieveUsers() {
        
        let users = localRealm.objects(UserInformation.self)

        if users.count > 0 {
            self.output.didRetrieveUsers(users: getUsers(users: users))
            return
        }

        
        apiService.retrieveUsers() { [self] users in
            if let users = users {
                saveUsers(userInfo: users)
                self.output.didRetrieveUsers(users: users)
            } else {
                self.output.didFailRetrievingUsers(title: MainList.Common.error, message: "Hubo un problema obteniendo la lista de usuarios")
            }
        }
    }
    
    private func saveUsers(userInfo: UserInfo) {
        
        for user in userInfo {
            let userInformation = UserInformation()

            userInformation.id = user.id
            userInformation.name = user.name
            userInformation.phone = user.phone
            userInformation.email = user.email
            
            try! localRealm.write {
                localRealm.add(userInformation)
            }
        }
    }
    
    private func getUsers(users: Results<UserInformation>) -> [UserInfoElement] {
        
        var usersList: [UserInfoElement] = []
        
        for user in users {
            usersList.append(UserInfoElement(id: user.id, name: user.name ?? "", phone: user.phone ?? "", email: user.email ?? ""))
        }
        
        return usersList
    }
}
