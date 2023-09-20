import Foundation

struct Article: Decodable, Identifiable {
    var id: String {
        publishedAt
    }
    let title: String
    let author: String
    let description: String
    let urlToImage: String
    let url: String
    let publishedAt: String
    let content: String
    let source: Source
    struct Source: Decodable {
        let id: String
        let name: String
    }
}

struct ArticleResponse: Decodable {
    let articles: [Article]
}

extension [Article] {
    func indexOfNews(withId id: Article.ID) -> Self.Index {
        guard let index = firstIndex(where: { $0.id == id }) else {
            fatalError()
        }
        return index
    }
}
