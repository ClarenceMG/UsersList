//
//  UsersListInteractor.swift
//  UsersList
//
//  Created by Clarence Montenegro on 10/09/2022.
//

class UsersListInteractor: UsersListInteractorInput {
    
    lazy var apiService = APIService()

    weak var output: UsersListInteractorOutput!
    
    func retrieveUsers() {
        apiService.retrieveUsers() { [self] users in
            if let users = users {
                self.output.didRetrieveUsers(users: users)
            } else {
                self.output.didFailRetrievingUsers(title: MainList.Common.error, message: "Hubo un problema obteniendo la lista de usuarios")
            }
        }
    }
}
