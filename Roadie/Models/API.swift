import Combine
import Foundation

class API {
    private static let baseUrl = URL(string: "http://jerrybhill.com/roadie/Service1.svc/")!

    private let urlSession = URLSession.shared

    func callAPI<B: Encodable, R: Decodable>(_ methodName: String, body: B?) -> AnyPublisher<R, Error> {
        return self.callAPI(methodName: methodName, body: body, serviceType: .responsiveData)
    }

    private func callAPI<B: Encodable, R: Decodable>(methodName: String, body: B?, serviceType: URLRequest.NetworkServiceType) -> AnyPublisher<R, Error> {
        let urlToCall = URL(string: methodName, relativeTo: Self.baseUrl)!

        var request = URLRequest(url: urlToCall)
        request.networkServiceType = serviceType

        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        if let body = body { // if b isn't nil
            // We can't have
            let encoder = JSONEncoder()
            // We assert that encode must not fail because we shouldn't be getting unencodable bodies.
            let encodedBody = try! encoder.encode(body) // swiftlint:disable:this force_try
            // Assign our encoded body
            request.httpBody = encodedBody
        }

        let resultPublisher = URLSession.shared.dataTaskPublisher(for: urlToCall)
            .map { $0.data }
            .decode(type: R.self, decoder: JSONDecoder())

        return resultPublisher.eraseToAnyPublisher()
    }
}
