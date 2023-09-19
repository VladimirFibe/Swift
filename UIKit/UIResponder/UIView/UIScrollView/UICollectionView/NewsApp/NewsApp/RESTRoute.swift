import Foundation

enum RESTRoute: String {
    case top = "https://newsapi.org/v2/top-headlines"
    case search = "https://newsapi.org/v2/everything"
}

struct APIKey {
  static let key = "9e72db7ad0a84a2597eefbb6690a48ac"
}
