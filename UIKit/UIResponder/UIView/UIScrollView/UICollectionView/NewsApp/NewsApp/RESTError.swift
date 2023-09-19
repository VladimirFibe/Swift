import Foundation

enum RESTError: Error, LocalizedError {
    case invalidURL
    case serverError
    case invalidData
    case unkown(Error)

    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid url"
        case .serverError:
            return "There was an error with the server. Please try again later"
        case .invalidData:
            return "The data is invalid. Please try again later"
        case .unkown(let error):
            return error.localizedDescription
        }
    }
}
