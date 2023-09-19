import Foundation

struct Article: Decodable {
    let title: String?
    let author: String?
    let description: String?
    let urlToImage: String?
    let url: String?
}

struct ArticleResponse: Decodable {
    let articles: [Article]
}
