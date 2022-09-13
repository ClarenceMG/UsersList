//
//  UserDetailInteractor.swift
//  UsersList
//
//  Created by Clarence Montenegro on 11/09/2022.
//

class UserDetailInteractor: UserDetailInteractorInput {
    
    lazy var apiService: APIServiceProvider = APIService()

    weak var output: UserDetailInteractorOutput!
    
    func retrievePosts(id: Int) {
        apiService.retrievePosts(id: id) { [self] posts in
            if let posts = posts {
                self.output.didRetrievePosts(posts: posts)
            } else {
                self.output.didFailRetrievingPosts(title: MainList.Common.error, message: "Hubo un problema obteniendo la lista de posts")
            }
        }
    }
}
