import Combine
import Foundation

class API {
    private static let baseUrl = URL(string: "http://jerrybhill.com/roadie/Service1.svc/")!

    private let urlSession = URLSession.shared

    private func callAPI<B: Encodable, R: Decodable>(methodName: String, body: B) -> AnyPublisher<R, Error> {
        return self.callAPI(methodName: methodName, body: body, serviceType: .responsiveData)
    }

    private func callAPI<B: Encodable, R: Decodable>(methodName: String, body: B, serviceType: URLRequest.NetworkServiceType) -> AnyPublisher<R, Error> {
        let urlToCall = URL(string: methodName, relativeTo: Self.baseUrl)!

        // We can't have 
        let encoder = JSONEncoder()
        // We assert that encode must not fail because we shouldn't be getting unencodable bodies.
        let encodedBody = try! encoder.encode(body) // swiftlint:disable:this force_try

        var request = URLRequest(url: urlToCall)
        request.httpBody = encodedBody
        request.networkServiceType = serviceType

        let resultPublisher = URLSession.shared.dataTaskPublisher(for: urlToCall)
            .map { $0.data }
            .decode(type: R.self, decoder: JSONDecoder())

        return resultPublisher.eraseToAnyPublisher()
    }
}
