import Foundation

class ThirdScreenViewModel: ObservableObject {
    @Published var users: [User] = []
    @Published var currentPage: Int = 1
    @Published var isLoading: Bool = false
    
    func fetchUsers() {
        guard !isLoading else { return }
        isLoading = true
        
        let urlString = "https://reqres.in/api/users?page=\(currentPage)"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode(UserResponse.self, from: data) {
                    DispatchQueue.main.async {
                        self.users.append(contentsOf: decodedResponse.data)
                        self.currentPage += 1
                        self.isLoading = false
                    }
                }
            }
        }.resume()
    }
    
    func refreshUsers() {
        currentPage = 1
        users.removeAll()
        fetchUsers()
    }
}
