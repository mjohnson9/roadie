import Combine

extension API {
    private struct Login: Encodable {
        var email: String
        var password: String
    }

    func login(email: String, password: String) -> AnyPublisher<Member, Error> {
        let loginToSend = Self.Login(email: email, password: password)
        return self.callAPI("Login", body: loginToSend)
    }
}
