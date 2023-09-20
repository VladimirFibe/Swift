import Combine

enum NewsEvent {
    case reload([Article])
}

enum NewsAction {
    case fetch
    case search(String)
}

final class NewsStore: Store<NewsEvent, NewsAction> {


    override func handleActions(_ action: NewsAction) {
        switch action {
        case .fetch: statefulCall(fetch)
        case .search(let text):
            statefulCall { [weak self] in
                try await self?.search(text)
            }
        }

    }

    private func search(_ text: String) async throws {
//        let response: ArticleResponse = try await RESTClient.shared.request(.search, parameters: ["q": text, "from": "2023-08-19", "sortBy": "publishedAt"])
//        let articleModels = response.articles.map { ArticleModel(with: $0)}
//        sendEvent(.reload(articleModels))
    }
    private func fetch() async throws {
//        let response: ArticleResponse = try await RESTClient.shared.request(.search, parameters: ["domains": "wsj.com"])
//        let articleModels = response.articles.map { ArticleModel(with: $0)}
//        sendEvent(.reload(articleModels))
    }
}
// ?q=tesla&from=2023-08-19&sortBy=publishedAt
