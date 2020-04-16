// if the response from Login returns an array of zero length, the login failed

struct Member: Codable, Identifiable {
    var id: Int // swiftlint:disable:this identifier_name

    var firstName: String
    var lastName: String

    var email: String
    var password: String
}
