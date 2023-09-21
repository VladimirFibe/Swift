import Foundation

struct Article {
    let source: Source
    let author: String
    let title: String
    let description: String
    let url: String
    let urlToImage: String
    let publishedAt: String
    let content: String
    struct Source: Decodable {
        let id: String
        let name: String
    }
}

#if DEBUG
extension Article {
    static var simpleData: [Article] = [
        .init(source: .init(id: "0", name: "Lifehacker.com"),
              author: "Pranay Parab",
              title: "The Best New Keyboard Features in iOS 17",
              description: "Your iPhone’s keyboard just got a lot better, thanks to a handful of updates that just shipped with iOS 17. Apple claims it improved many aspects of the keyboard that tend to be frustrating to use, such as autocorrect (thank goodness) including the ability to…",
              url: "https://lifehacker.com/the-best-new-keyboard-features-in-ios-17-1850852783",
              urlToImage: "https://i.kinja-img.com/gawker-media/image/upload/c_fill,f_auto,fl_progressive,g_center,h_675,pg_1,q_80,w_1200/be05c4d875fc4a9e34dbb18236fe1bce.jpg",
              publishedAt: "2023-09-19T17:30:00Z",
              content: "Your iPhones keyboard just got a lot better, thanks to a handful of updates that just shipped with iOS 17. Apple claims it improved many aspects of the keyboard that tend to be frustrating to use, su… [+2868 chars]"
             ),
            .init(source: .init(id: "1", name: "Lifehacker.com"),
                  author: "Joshua Hawkins",
                  title: "The Newest M2 MacBook Pro Is $200 Off Right Now",
                  description: "This year, Apple upgraded the MacBook Pro with the M2 Pro chip, replacing the already impressive M1 Pro chip, making one of Apple’s best MacBooks even better. And if you’ve been eyeing one of the 14-inch M2 MacBook Pros, right now you can get one for $200 off…",
                  url: "https://lifehacker.com/the-newest-m2-macbook-pro-is-200-off-right-now-1850853811",
                  urlToImage: "https://i.kinja-img.com/gawker-media/image/upload/c_fill,f_auto,fl_progressive,g_center,h_675,pg_1,q_80,w_1200/0432b86f277781296a8cb311e0d4cba1.png",
                  publishedAt: "2023-09-19T21:30:00Z",
                  content: "This year, Apple upgraded the MacBook Pro with the M2 Pro chip, replacing the already impressive M1 Pro chip, making one of Apples best MacBooks even better. And if youve been eyeing one of the 14-in… [+921 chars]"
            ),
            .init(source: .init(id: "3", name: "Engadget"),
                  author: "Cherlynn Low",
                  title: "iPhone 15 Pro Max review: Apple makes a strong case for its biggest phone",
                  description: "“Let’s charge the iPhone 15 Pro Max before going to bed,” I thought wearily after a long day at Apple Park. Even though the device, which I had just unboxed a few hours earlier, was still showing at least 80 percent left of juice, I wanted to make sure it did…",
                  url: "https://www.engadget.com/iphone-15-pro-max-review-apple-makes-a-strong-case-for-its-biggest-phone-130018980.html",
                  urlToImage: "https://s.yimg.com/uu/api/res/1.2/T2RRlmoScx42DtFMucvUVg--~B/Zmk9ZmlsbDtoPTYzMDtweW9mZj0wO3c9MTIwMDthcHBpZD15dGFjaHlvbg--/https://media-mbst-pub-ue1.s3.amazonaws.com/creatr-uploaded-images/2023-09/ed27c860-5694-11ee-bbdd-14a6318d5801.cf.jpg",
                  publishedAt: "2023-09-19T13:00:18Z",
                  content: "Lets charge the iPhone 15 Pro Max before going to bed, I thought wearily after a long day at Apple Park. Even though the device, which I had just unboxed a few hours earlier, was still showing at lea… [+17448 chars]"
            ),
            .init(source: .init(id: "4", name: "Engadget"),
                  author: "Sarah Fielding",
                  title: "Apple's 12.9-inch iPad Pro drops to $999",
                  description: "The 12.9-inch Apple iPad Pro's cost has finally dropped into the triple digits. The 128GB sixth-generation model is at an all-time low price of $999 (hey, $1 under $1,000 still counts) from $1,099 — a nine percent discount. The deal is only available in Space…",
                  url: "https://www.engadget.com/apples-129-inch-ipad-pro-drops-to-999-143633282.html",
                  urlToImage: "https://s.yimg.com/ny/api/res/1.2/5_3xv.qQ8DMXS2v2gyngTw--/YXBwaWQ9aGlnaGxhbmRlcjt3PTEyMDA7aD04MDA-/https://s.yimg.com/os/creatr-uploaded-images/2022-11/bf495040-59e1-11ed-a74d-0924f57e9b11",
                  publishedAt: "2023-09-19T14:36:33Z",
                  content: "The 12.9-inch Apple iPad Pro's cost has finally dropped into the triple digits. The 128GB sixth-generation model is at an all-time low price of $999 (hey, $1 under $1,000 still counts) from $1,099 a … [+1115 chars]"
            ),
            .init(source: .init(id: "6", name: "MacRumors"),
                  author: "Tim Hardwick",
                  title: "iPhone 15: Apple Shares Rationale Behind Camera Features and Limitations",
                  description: "Apple's new iPhone 15 series includes several new camera features, but not all of them will be visible to casual photographers, and Apple says it is relying on third-party developers to make these extra controls accessible to enthusiasts and filmmakers.",
                  url: "https://www.macrumors.com/2023/09/19/iphone-15-camera-features-limitations/",
                  urlToImage: "https://images.macrumors.com/t/fE5bcTOP5ymqO6mizljgEB7pvy4=/2500x/article-new/2023/09/iPhone-15-Blue-Three-Quarters-Perspective-Camera-Closeup-Feature.jpg",
                  publishedAt: "2023-09-19T08:15:35Z",
                  content: "Apple's new iPhone 15 series includes several new camera features, but not all of them will be visible to casual photographers, and Apple says it is relying on third-party developers to make these ex… [+4624 chars]"
            ),
            .init(source: .init(id: "7", name: "MacRumors"),
                  author: "Juli Clover",
                  title: "Apple Starts Selling Refurbished 2023 M2 Ultra Mac Pro at a Discount",
                  description: "Apple today added the M2 Ultra Mac Pro models to its online store for refurbished products in the United States, offering the newest version of the desktop machine at a discounted price for the first time since its launch.\n\n\n\n\n\nA refurbished version of the ba…",
                  url: "https://www.macrumors.com/2023/09/19/refurbished-m2-ultra-mac-pro/",
                  urlToImage: "https://images.macrumors.com/t/ITOAT4_fmUUvZfl3LF4pvocPTws=/2500x/article-new/2023/01/Mac-Pro-Feature-Red.jpg",
                  publishedAt: "2023-09-19T17:16:56Z",
                  content: "Apple today added the M2 Ultra Mac Pro models to its online store for refurbished products in the United States, offering the newest version of the desktop machine at a discounted price for the first… [+1257 chars]"
            ),
            .init(source: .init(id: "8", name: "MacRumors"),
                  author: "Joe Rossignol",
                  title: "iPhone 15 Models Feature New Setting to Strictly Prevent Charging Beyond 80%",
                  description: "All of the iPhone 15 and iPhone 15 Pro models feature a new battery health setting that prevents the devices from charging beyond 80% at all times when enabled, as confirmed by The Verge's Allison Johnson during a Q&A session today.",
                  url: "https://www.macrumors.com/2023/09/19/iphone-15-80-percent-battery-limit-option/",
                  urlToImage: "https://images.macrumors.com/t/SuHt0iQuSjaO-ExOZzJieONGf_I=/2500x/article-new/2023/09/iPhone-15-Pro-Lineup-Feature.jpg",
                  publishedAt: "2023-09-19T21:04:13Z",
                  content: "All of the iPhone 15 and iPhone 15 Pro models feature a new battery health setting that prevents the devices from charging beyond 80% at all times when enabled, as confirmed by The Verge's Allison Jo… [+919 chars]"
            ),
            .init(source: .init(id: "9", name: "MacRumors"),
                  author: "Juli Clover",
                  title: "Satechi Debuts New MagSafe-Compatible Wallet Stand for iPhone 15",
                  description: "Satechi today announced the launch of a new Magnetic Wallet Stand that is designed as an accessory to be used with the new iPhone 15 models that are releasing this Friday.",
                  url: "https://www.macrumors.com/2023/09/19/satechi-magsafe-wallet-stand/",
                  urlToImage: "https://images.macrumors.com/t/iPTplc3PznCiuVwofPrABZYQEZU=/2000x/article-new/2023/09/satechi-wallet-stand.jpg",
                  publishedAt: "2023-09-19T21:21:18Z",
                  content: "Satechi today announced the launch of a new Magnetic Wallet Stand that is designed as an accessory to be used with the new iPhone 15 models that are releasing this Friday.\r\nThe Magnetic Wallet Stand … [+1138 chars]"
            )
    ]
}
#endif
