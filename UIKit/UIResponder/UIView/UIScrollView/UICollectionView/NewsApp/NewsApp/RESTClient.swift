import UIKit

final class RESTClient {
    static let shared = RESTClient()
    private init() {}

    func request<Response: Decodable>(_ route: RESTRoute, parameters: [String: String]) async throws -> Response {
        var items: [URLQueryItem] = []
        for (name, value) in parameters { items.append(URLQueryItem(name: name, value: value))}
        items.append(URLQueryItem(name: "apiKey", value: APIKey.key))
        guard var components = URLComponents(string: route.rawValue)
        else { throw RESTError.invalidURL }
        components.queryItems = items
        guard let url = components.url else { throw RESTError.invalidURL }
        let (data, response) = try await URLSession.shared.data(from: url)
        guard (response as? HTTPURLResponse)?.statusCode == 200
        else { throw RESTError.serverError }
        guard let result = try? JSONDecoder().decode(Response.self, from: data)
        else { throw RESTError.invalidData }
        return result
    }
}
