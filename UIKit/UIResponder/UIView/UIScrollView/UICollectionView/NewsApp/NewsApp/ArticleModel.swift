import Foundation

struct ArticleModel: Identifiable {
    var id = UUID().uuidString
    let author: String
    let title: String
    let description: String
    let urlToImage: String
    let url: String

    init(with article: Article) {
        author = article.author ?? ""
        title = article.title ?? ""
        description = article.description ?? ""
        urlToImage = article.urlToImage ?? ""
        url = article.url ?? ""
    }
    init(author: String, title: String, description: String, urlToImage: String, url: String) {
        self.author = author
        self.title = title
        self.description = description
        self.urlToImage = urlToImage
        self.url = url
    }
}

extension [ArticleModel] {
    func indexOfNews(withId id: ArticleModel.ID) -> Self.Index {
        guard let index = firstIndex(where: { $0.id == id }) else {
            fatalError()
        }
        return index
    }
}

extension ArticleModel {
    static let all: [ArticleModel] = [
        .init(author: "Patricia Kowsmann", title: "Société Générale Shares Sink After New CEO Lays Out Strategy", description: "Live coverage of what's moving stocks and other markets, including the Dow Jones Industrial Average, S&P 500 and Nasdaq Composite", urlToImage: "https://images.wsj.net/im-853525/social", url: "https://www.wsj.com/livecoverage/stock-market-today-dow-jones-09-18-2023"),
        .init(author: "Adrià Calatayud", title: "Lonza CEO Pierre-Alain Ruffieux to Leave", description: "", urlToImage: "https://images.wsj.net/im-779165/social", url: "https://www.wsj.com/business/c-suite/lonza-ceo-pierre-alain-ruffieux-to-leave-743dd66c"),
        .init(author: "wsj", title: "Should Your Spouse Be Your Best Friend?", description: "Many of us count our spouse as our best pal, but it’s also useful to have an outside confidant", urlToImage: "https://images.wsj.net/im-852443/social", url: "https://www.wsj.com/lifestyle/relationships/should-your-spouse-be-your-best-friend-473ce00a"),
        .init(author: "wsj", title: "Ties Between Biden and Merrick Garland Deteriorate From Distant to Frigid...", description: "Attorney general’s vaunted independence has put a pall on relations between the White House and Justice Department", urlToImage: "https://images.wsj.net/im-853134/social", url: "https://www.wsj.com/politics/policy/ties-between-joe-biden-and-merrick-garland-deteriorate-from-distant-to-frigid-e2b81f5d"),
        .init(author: "Emily Bobrow", title: "Sheila Johnson, the First Black Female Billionaire, Keeps Reinventing Herself", description: "The co-founder of Black Entertainment Television plunged into luxury hotels, sports teams and a film festival after her company was sold", urlToImage: "https://images.wsj.net/im-850065/social", url: "https://www.wsj.com/business/entrepreneurship/sheila-johnson-the-first-black-female-billionaire-keeps-reinventing-herself-23820814"),
        .init(author: "David Uberti", title: "Oil-and-Gas Drillers Are Ramping Up Again", description: "Live coverage of what is moving stocks and other markets, including the Dow Jones Industrial Average, S&P 500 and Nasdaq Composite", urlToImage: "https://images.wsj.net/im-853044/social", url: "https://www.wsj.com/livecoverage/stock-market-today-dow-jones-09-15-2023"),
        .init(author: "The Wall Street Journal", title: "For Years Saudi Arabia Waged War On Video Games. Now They Want To be A Center Of Them", description: "For years, this kingdom’s Islamic clerics waged a war on videogames, banning popular titles such as “Pokémon” for promoting blasphemy, violence and laziness. Now, Saudi Arabia is pouring $40 billion into a bid to become a world leader in a videogame industry …", urlToImage: "https://images.wsj.net/im-852028/social", url: "https://www.wsj.com/world/middle-east/saudi-arabia-once-banned-videogames-now-it-wants-to-export-them-ec61f7e1"),
        .init(author: "wsj", title: "Shoplifting Battle Getting Dangerous for Workers...", description: "Death of CVS store manager highlights worst risks to staff confronting surge in retail thefts", urlToImage: "https://images.wsj.net/im-851829/social", url: "https://www.wsj.com/business/retail/americas-battle-with-shoplifting-is-getting-dangerous-for-workers-911603a4"),
        .init(author: "wsj", title: "Montana Ranchers' New Side Hustle: Giving Tourists the 'YELLOWSTONE' Experience...", description: "Drought and property taxes are making ranch life tougher, but visitors will pay to live a few days like John Dutton", urlToImage: "https://images.wsj.net/im-851737/social", url: "https://www.wsj.com/us-news/montana-ranchers-new-side-hustle-giving-tourists-the-yellowstone-experience-6de3cb06"),
        .init(author: "wsj", title: "CAESARS Paid Ransom After Suffering Cyberattack...", description: "Caesars is second major casino operator hit by hackers in recent weeks", urlToImage: "https://images.wsj.net/im-851716/social", url: "https://www.wsj.com/business/hospitality/caesars-paid-ransom-after-suffering-cyberattack-7792c7f0"),
        .init(author: "wsj", title: "It Took 3 Plays for Experiment to Combust...", description: "On a night when the Jets showed how much potential they would have with the 39-year-old star, he went down with a feared Achilles injury that could cost him his season", urlToImage: "https://images.wsj.net/im-850377/social", url: "https://www.wsj.com/sports/football/aaron-rodgers-injury-achilles-jets-2c130f83"),
        .init(author: "wsj", title: "'Feedback' Is Now Too Harsh. The New Word Is Feedforward...", description: "More companies are ditching anxiety-inducing corporate lingo for what they see as gentler terms. Reviews become ‘connect’ sessions.", urlToImage: "https://images.wsj.net/im-792969/social", url: "https://www.wsj.com/lifestyle/careers/companies-worker-management-feedback-feedforward-hr-9758d6a7"),
        .init(author: "George Stahl", title: "Oracle Stock Slumps Premarket After Cloud Sales Growth Slows", description: "Live coverage of what's moving stocks and other markets, including the Dow Jones Industrial Average, S&P 500 and Nasdaq Composite", urlToImage: "https://images.wsj.net/im-849711/social", url: "https://www.wsj.com/livecoverage/stock-market-today-dow-jones-09-12-2023"),
        .init(author: "wsj", title: "Magic Number for Productivity: 85%...", description: "To do the best work of your life, take it down a notch", urlToImage: "https://images.wsj.net/im-843734/social", url: "https://www.wsj.com/lifestyle/workplace/try-hard-but-not-that-hard-85-is-the-magic-number-for-productivity-6b5aa875"),
        .init(author: "wsj", title: "The Numbers Behind Ugly Start to NFL Season...", description: "The Bengals’ Joe Burrow kicked off the season with the worst start of his career, and the rest of the NFL wasn’t much better on opening weekend", urlToImage: "https://images.wsj.net/im-849665/social", url: "https://www.wsj.com/sports/football/nfl-week-one-stats-joe-burrow-9af23dee"),
        .init(author: "wsj", title: "Tight Control Hampers Response to China Slowdown...", description: "While officials become more worried about growth, they can’t act without top leader’s approval", urlToImage: "https://images.wsj.net/im-849188/social", url: "https://www.wsj.com/world/china/xis-tight-control-hampers-stronger-response-to-chinas-slowdown-868ab454"),
        .init(author: "Jane Kamensky", title: "A History of Carrying Capacity", description: "In the medieval era, men and women both carried personal items in bags or purses. The arrival of clothing with pockets changed that—for men only.", urlToImage: "https://images.wsj.net/im-845161/social", url: "https://www.wsj.com/arts-culture/books/pockets-review-carrying-capacity-2245357a"),
        .init(author: "wsj", title: "Gilded Townhouse. Caribbean Islands. What Happened to Epstein's Empire?", description: "A look at where the late disgraced financier’s properties landed, and how much the scandal affected values", urlToImage: "https://images.wsj.net/im-849205/social", url: "https://www.wsj.com/real-estate/luxury-homes/jeffrey-epstein-homes-6b2b4829"),
        .init(author: "wsj", title: "Dressing Like '50s Housewife Not Just for 'Trad Wives'...", description: "Bright-red lipstick, curled hair, high heels, full skirts: Feminists and ‘trad wives’ alike are embracing the midcentury look", urlToImage: "https://images.wsj.net/im-839505/social", url: "https://www.wsj.com/style/fashion/trad-wife-housewife-fashion-trend-87f36a1d"),
        .init(author: "wsj", title: "Defense in Landmark Antitrust Case Hinges on Lawyers Who Took on MICROSOFT...", description: "Legal team’s top job is explaining why this time is different in the biggest fight between the U.S. and a tech company in 25 years", urlToImage: "https://images.wsj.net/im-848536/social", url: "https://www.wsj.com/tech/googles-defense-in-landmark-antitrust-case-hinges-on-lawyers-who-took-on-microsoft-3c1d5059"),
        .init(author: "wsj", title: "Credit-Card Users Got Bigger Limits. Then They Racked Up $1 Trillion...", description: "Banks are doling out more credit to customers, enticing many to spend more", urlToImage: "https://images.wsj.net/im-847518/social", url: "https://www.wsj.com/personal-finance/credit-card-debt-spending-limits-cc050cbd"),
        .init(author: "wsj", title: "King Charles III Proves Unexpectedly Popular During First Year of Reign...", description: "Prince Harry’s criticisms of royal family haven’t dented a king praised for low-key approach", urlToImage: "https://images.wsj.net/im-847927/social", url: "https://www.wsj.com/world/uk/king-charles-iii-proves-unexpectedly-popular-during-first-year-of-reign-b6c20819"),
        .init(author: "wsj", title: "Fall in Home Prices May Already Be Over...", description: "Quick recovery in prices suggests housing downturn could be shorter, shallower than expected", urlToImage: "https://images.wsj.net/im-845599/social", url: "https://www.wsj.com/economy/housing/the-fall-in-home-prices-may-already-be-over-3496d6bb"),
        .init(author: "Anna Hirtenstein", title: "Stocks to Watch Friday: Apple, DocuSign, AMC, Kroger", description: "Live coverage of what's moving stocks and other markets, including the Dow Jones Industrial Average, S&P 500 and Nasdaq Composite", urlToImage: "https://images.wsj.net/im-848589/social", url: "https://www.wsj.com/livecoverage/stock-market-today-dow-jones-09-08-2023"),
        .init(author: "wsj", title: "Vegas Hotel Workers Move Closer to Strike...", description: "Unions set a date for a vote that would authorize a future walkout", urlToImage: "https://images.wsj.net/im-847230/social", url: "https://www.wsj.com/business/hospitality/las-vegas-hotel-workers-move-closer-to-potential-strike-98a91cab"),
        .init(author: "wsj", title: "Once Inoculated by Nazi Past, Germany Harbors Growing Far-Right Currents...", description: "Support for pro-Russia, anti-immigration Alternative for Germany surges as more voters lose faith in mainstream politics", urlToImage: "https://images.wsj.net/im-843231/social", url: "https://www.wsj.com/world/europe/once-inoculated-by-its-nazi-past-germany-is-becoming-a-far-right-stronghold-7f278664"),
        .init(author: "wsj", title: "Cuba Says Russian Ring Is Recruiting Cubans to Ukraine...", description: "Communist island’s government says it is dismantling network luring Cubans to fight as mercenaries", urlToImage: "https://images.wsj.net/im-846926/social", url: "https://www.wsj.com/world/cuba-says-russian-ring-recruiting-cubans-to-ukraine-72fe6439"),
        .init(author: "Caitlin McCabe", title: "Stocks to Watch Wednesday: Apple, Novo Nordisk, Amazon, Enbridge", description: "Live coverage of what's moving stocks and other markets, including the Dow Jones Industrial Average, S&P 500 and Nasdaq Composite", urlToImage: "https://images.wsj.net/im-847285/social", url: "https://www.wsj.com/livecoverage/stock-market-today-dow-jones-09-06-2023"),
        .init(author: "wsj", title: "FTC Antitrust Suit Against AMAZON Set for This Month...", description: "E-commerce giant’s lawyers offered no concessions in talks with agency officials last month", urlToImage: "https://images.wsj.net/im-847166/social", url: "https://www.wsj.com/finance/regulation/ftc-antitrust-suit-against-amazon-set-for-later-this-month-after-meeting-fails-to-resolve-impasse-c888700f"),
        .init(author: "wsj", title: "Pilot Describes Defection to Ukraine, Urges Others to Follow...", description: "Capt. Maksim Kuzminov flies to Ukraine in helicopter with help from Kyiv’s military intelligence service", urlToImage: "https://images.wsj.net/im-846827/social", url: "https://www.wsj.com/world/russia/russian-pilot-describes-defection-to-ukraine-urges-others-to-follow-8574d0f7"),
        .init(author: "wsj", title: "Alcaraz Is US Open's Hottest Attraction...", description: "The world No. 1’s creativity, movement and control have made him must-see TV for his fellow pros as he defends his U.S. Open title", urlToImage: "https://images.wsj.net/im-846673/social", url: "https://www.wsj.com/sports/tennis/carlos-alcaraz-us-open-hottest-attraction-21f1ad67"),
        .init(author: "wsj", title: "Flamboyant Lawyers to Clash...", description: "State senators will serve as jurors to decide attorney general’s political fate", urlToImage: "https://images.wsj.net/im-845898/social", url: "https://www.wsj.com/politics/texas-impeachment-trial-attorney-general-ken-paxton-7d751bf3"),
        .init(author: "wsj", title: "$53,000 Connection: The High Cost of High-Speed Internet for Everyone...", description: "Officials doling out billions of dollars for broadband in rural America are struggling to decide when a new hookup costs too much", urlToImage: "https://images.wsj.net/im-845942/social", url: "https://www.wsj.com/us-news/the-53-000-connection-the-high-cost-of-high-speed-internet-for-everyone-c903163f"),
        .init(author: "wsj", title: "POLL: Two-Thirds Dems Say Biden Too Old...", description: "Nearly three-quarters of voters say the president is too old to run again", urlToImage: "https://images.wsj.net/im-846311/social", url: "https://www.wsj.com/politics/elections/bidens-age-economic-worries-endanger-re-election-in-2024-wsj-poll-finds-67a7bba8"),
        .init(author: "wsj", title: "How Worried Should We Be About AI Threat to Humanity? Tech Leaders Can't Agree...", description: "Artificial-intelligence experts debate whether to focus on averting an AI apocalypse or problems such as bias, disinformation", urlToImage: "https://images.wsj.net/im-846244/social", url: "https://www.wsj.com/tech/ai/how-worried-should-we-be-about-ais-threat-to-humanity-even-tech-leaders-cant-agree-46c664b6"),
        .init(author: "wsj", title: "Ukraine Has Yet to Break Through Defenses...", description: "Flooding Ukrainian troops into a gap could prove even harder", urlToImage: "https://images.wsj.net/im-846450/social", url: "https://www.wsj.com/world/europe/ukraine-wants-to-break-through-russian-defenses-thats-only-the-first-step-d49c6bd3"),
        .init(author: "wsj", title: "Chinese Gate-Crashers at U.S. Bases Spark Espionage Concerns...", description: "Washington has tracked about 100 incidents involving Chinese nationals trying to access American military and other installations", urlToImage: "https://images.wsj.net/im-844079/social", url: "https://www.wsj.com/politics/national-security/chinese-gate-crashers-at-u-s-bases-spark-espionage-concerns-cdef8187"),
        .init(author: "wsj", title: "How Deion Sanders Took Over College Football...", description: "The Buffaloes, who won one game last year, knocked off Texas Christian, a team that played for a national championship last season, to kick off the Prime Era", urlToImage: "https://images.wsj.net/im-846335/social", url: "https://www.wsj.com/sports/football/deion-sanders-colorado-coach-prime-tcu-10bcbb75"),
        .init(author: "Emily Bobrow", title: "CEO Ted Fischer Knows Older People Still Need to Play", description: "The co-founder of Ageless Innovation makes robotic pets and new versions of classic games for people over 65.", urlToImage: "https://images.wsj.net/im-843253/social", url: "https://www.wsj.com/health/wellness/ceo-ted-fischer-knows-older-people-still-need-to-play-983c07ce"),
        .init(author: "wsj", title: "Health Scares Shine Spotlight on Senate's 'Three Johns'...", description: "Thune, Cornyn, Barrasso seen as potential leaders if the Kentucky lawmaker steps aside", urlToImage: "https://images.wsj.net/im-845291/social", url: "https://www.wsj.com/politics/policy/mitch-mcconnells-health-scares-shine-spotlight-on-senates-three-johns-ad0e3831"),
        .init(author: "Amrith Ramkumar", title: "Eos Energy Stock Surges After Battery Storage Startup Gets Government Loan Commitment", description: "Live coverage of what's moving stocks and other markets, including the Dow Jones Industrial Average, S&P 500 and Nasdaq Composite", urlToImage: "https://images.wsj.net/im-845793?width=600", url: "https://www.wsj.com/livecoverage/stock-market-today-jobs-report-09-01-2023"),
        .init(author: "Christopher Mims", title: "‘While We Watched’ Review: Muzzling the Media in Modi’s India", description: "A ‘POV’ documentary on PBS follows reporter Ravish Kumar, whose independent journalism struggles to survive in a country increasingly hostile to a free press.", urlToImage: "https://images.wsj.net/im-843988/social", url: "https://www.wsj.com/business/media/while-we-watched-review-muzzling-the-media-in-modis-india-9f5e013"),
        .init(author: "wsj", title: "Ukrainian Counteroffensive Pierces Main Russian Defensive Line...", description: "After three months of grinding advances in Western-backed operation, Kyiv accelerates thrust along main line of attack", urlToImage: "https://images.wsj.net/im-845027/social", url: "https://www.wsj.com/world/europe/ukrainian-counteroffensive-pierces-main-russian-defensive-line-in-southeast-9441e204"),
        .init(author: "Candice Choi", title: "Dollar General Stock Sinks After Company Cuts Outlook", description: "Live coverage of stocks and financial news, including the S&P 500, Dow and Nasdaq Composite.", urlToImage: "https://images.wsj.net/im-845045/social", url: "https://www.wsj.com/livecoverage/stock-market-today-dow-jones-08-31-2023"),
        .init(author: "wsj", title: "DOJ, SEC Investigate TESLA Over Secret Glass House for Musk...", description: "Federal prosecutors are seeking information about benefits paid to Elon Musk", urlToImage: "https://images.wsj.net/im-844743/social", url: "https://www.wsj.com/business/autos/tesla-elon-musk-glass-house-doj-sec-investigation-c723166b"),
        .init(author: "Chelsey Dulaney", title: "Stocks to Watch Wednesday: HP, Salesforce, Victoria's Secret", description: "Live coverage of what's moving stocks and other markets, including the Dow Jones Industrial Average, S&P 500 and Nasdaq Composite", urlToImage: "https://images.wsj.net/im-844335/social", url: "https://www.wsj.com/livecoverage/stock-market-today-dow-jones-08-30-2023"),
        .init(author: "wsj", title: "Private Phone, Secret Recordings: CEO's Relationship With TV Anchor...", description: "Under Armour’s Kevin Plank shared nonpublic financial details with Stephanie Ruhle, and she gave advice on how to address negative publicity", urlToImage: "https://images.wsj.net/im-843300/social", url: "https://www.wsj.com/business/media/a-private-phone-secret-recordings-inside-one-ceos-relationship-with-a-tv-anchor-66cb65b5"),
        .init(author: "wsj", title: "Free Speech Runs Up Against Courtroom Decorum...", description: "Judges face uncharted territory in deciding whether a presidential candidate’s remarks flout rules protecting a fair and orderly trial", urlToImage: "https://images.wsj.net/im-842640/social", url: "https://www.wsj.com/us-news/trumps-free-speech-runs-up-against-courtroom-decorum-4a9dd0c4"),
        .init(author: "Jack Pitcher", title: "Bitcoin Rallies, Crypto Assets Surge After Grayscale Wins Suit Over ETF Application", description: "Live coverage of what's moving stocks and other markets, including the Dow Jones Industrial Average, S&P 500 and Nasdaq Composite", urlToImage: "https://images.wsj.net/im-843731?width=600", url: "https://www.wsj.com/livecoverage/stock-market-today-dow-jones-08-29-2023"),
        .init(author: "wsj", title: "Praises Russian Imperialism!", description: "Pontiff celebrates the reigns of Russian czars who subjugated Ukraine for their ‘great culture and great humanity’", urlToImage: "https://images.wsj.net/im-842990/social", url: "https://www.wsj.com/world/russia/pope-francis-praises-historical-russian-imperialism-amid-war-in-ukraine-8b7445c0"),
        .init(author: "wsj", title: "Rising Gas Prices Hit Inflation-Weary Americans...", description: "Costs are making life harder for businesses that have been managing inflation for months", urlToImage: "https://images.wsj.net/im-840626/social", url: "https://www.wsj.com/business/energy-oil/rising-gasoline-prices-hit-inflation-weary-americans-d816b1af"),
        .init(author: "wsj", title: "Meadows Heads to Court in Early Test for DA Fani Willis...", description: "Judge will hear arguments by former White House chief of staff for moving his case to federal court", urlToImage: "https://images.wsj.net/im-842918/social", url: "https://www.wsj.com/us-news/law/mark-meadows-heads-to-court-in-early-test-for-district-attorney-fani-willis-aa42a7f7"),
        .init(author: "wsj", title: "Screens, Lack of Sun Causing Epidemic of Myopia...", description: "Nearsightedness is on the rise worldwide, but there are ways to help children preserve their vision", urlToImage: "https://images.wsj.net/im-841703/social", url: "https://www.wsj.com/tech/personal-tech/our-eyes-really-are-getting-worse-heres-how-to-save-your-kids-vision-de16d592"),
        .init(author: "wsj", title: "Why Tribalism Took Over Our Politics...", description: "Social science gives an uncomfortable explanation: Our brains were made for conflict", urlToImage: "https://images.wsj.net/im-842330/social", url: "https://www.wsj.com/politics/why-tribalism-took-over-our-politics-5936f48e"),
        .init(author: "wsj", title: "Welcome Back to School. Your Teacher is 2,000 Miles Away...", description: "Some parents remain skeptical of piped-in teachers, while schools say they don’t have a choice", urlToImage: "https://images.wsj.net/im-841784/social", url: "https://www.wsj.com/us-news/education/welcome-back-to-school-your-teacher-is-2-000-miles-away-fee6750a"),
        .init(author: "Emily Bobrow", title: "Edna Adan Ismail Fights for the Health of African Women", description: "The Templeton Prize winner and former first lady of Somalia is still working to train midwives and eliminate female genital mutilation.", urlToImage: "https://images.wsj.net/im-839351/social", url: "https://www.wsj.com/world/africa/edna-adan-ismail-fights-for-the-health-of-african-women-e9d25dfd"),
        .init(author: "Angus Berwick", title: "Hawaiian Electric Stock Tumbles After Lawsuit, Ratings Downgrade", description: "Live coverage of what's moving stocks and other markets, including the Dow Jones Industrial Average, S&P 500 and Nasdaq Composite", urlToImage: "https://images.wsj.net/im-841941/social", url: "https://www.wsj.com/livecoverage/stock-market-today-dow-jones-08-25-2023"),
        .init(author: "wsj", title: "Potential Bankruptcy for WEWORK...", description: "BlackRock, King Street, Brigade and other firms are holding preliminary discussions about WeWork’s future, as the company tries to reduce its rent costs", urlToImage: "https://images.wsj.net/im-841392/social", url: "https://www.wsj.com/articles/wall-street-funds-discuss-potential-bankruptcy-plan-for-wework-50d3eb60"),
        .init(author: "Jessica Flint", title: "Inside Most Expensive ZIP Code in America...", description: "The California enclave of Newport Coast has seen homes sell for as high as $61 million—but one local real-estate pro says there are properties worth more than that", urlToImage: "https://images.wsj.net/im-840951/social", url: "https://www.wsj.com/real-estate/luxury-homes/most-expensive-zip-code-in-america-newport-coast-361f0b8a"),
        .init(author: "wsj", title: "Man-Made Lake in Alabama Giving Gulf Coast Run For Its Money!", description: "Lake Martin is drawing wealthy vacationers willing to spend big on waterfront homes", urlToImage: "https://images.wsj.net/im-839678/social", url: "https://www.wsj.com/real-estate/luxury-homes/lake-martin-alabama-real-estate-e0d19fd0"),
        .init(author: "wsj", title: "Mar-a-Lago IT Director Flips on Trump; Implicates in Obstruction...", description: "Evidence behind charges leveled at former president last month emerges in motion raising concerns over lawyer paid by Trump’s PAC", urlToImage: "https://images.wsj.net/im-840263/social", url: "https://www.wsj.com/us-news/mar-a-lago-it-director-flipped-on-trump-after-switching-lawyers-prosecutors-say-649b49c2"),
        .init(author: "wsj", title: "In Japan, People Choose Where to Pay Taxes Based on Thank-You Gifts...", description: "Taxpayers get rewarded for redirecting some payments to places they don’t live. Welding lessons? Mayor for a day?", urlToImage: "https://images.wsj.net/im-836166/social", url: "https://www.wsj.com/world/asia/taxes-japan-thank-you-gifts-dcfec436"),
        .init(author: "Charley Grant", title: "Nvidia's Hot Streak Before Earnings Is Unusually Strong", description: "Live updates on what's moving markets, including the Dow Jones Industrial Average, S&P 500 and Nasdaq Composite", urlToImage: "https://images.wsj.net/im-785590/social", url: "https://www.wsj.com/livecoverage/stock-market-today-dow-jones-08-22-2023"),
        .init(author: "wsj", title: "Bezos Supercharges Miami High-End Home Market...", description: "The Amazon founder’s $68 million Indian Creek purchase is among the priciest deals to close in the South Florida city in recent years", urlToImage: "https://images.wsj.net/im-838729/social", url: "https://www.wsj.com/real-estate/luxury-homes/most-expensive-miami-home-sales-c85bafe1"),
        .init(author: "Salvador Rodriguez and Meghan Bobrowsky", title: "WSJスクープ | メタ、今週初めにも「スレッズ」ウェブ版リリースへ", description: "米メタ・プラットフォームズは今週初め、短文投稿アプリ「Threads（スレッズ）」のウェブ版をリリースする計画だ。イーロン・マスク氏の「X」（ツイッターから改称）に対抗するための最大・最新の機能となる。", urlToImage: "https://images.wsj.net/im-838927/social", url: "https://jp.wsj.com/articles/metas-threads-app-to-launch-web-version-as-rivalry-with-x-enters-new-stage-bc405b31"),
        .init(author: "wsj", title: "The Booming Business of American Anxiety...", description: "A flurry of companies and entrepreneurs aim to fill the demand for mental-health help", urlToImage: "https://images.wsj.net/im-836197/social", url: "https://www.wsj.com/health/wellness/anxiety-mental-health-treatment-supplements-ca4a7fc"),
        .init(author: "wsj", title: "THREADS to Launch Web Version as Rivalry Enters New Stage...", description: "A web version of the new text-first app is one of the features users have asked for and could help it compete with X after decline in usage", urlToImage: "https://images.wsj.net/im-838927/social", url: "https://www.wsj.com/tech/metas-threads-app-to-launch-web-version-as-rivalry-with-x-enters-new-stage-706e8241"),
        .init(author: "Ben Eisen, Rachel Louise Ensign", title: "Banks Don’t Love Rich Mortgage Borrowers as Much as They Used To", description: "The Fed’s interest-rate hikes and recent bank failures mean lenders aren’t competing so fiercely for jumbo loans", urlToImage: "https://images.wsj.net/im-837888/social", url: "https://www.wsj.com/finance/banking/mortgage-jumbo-loan-interest-rates-wealthy-a84e87d3"),
        .init(author: "wsj", title: "Florida Teachers on Edge Over History and Gender-Identity Policies...", description: "Educators are under pressure balancing instruction and compliance with new laws", urlToImage: "https://images.wsj.net/im-838673/social", url: "https://www.wsj.com/us-news/education/florida-teachers-are-on-edge-over-history-and-gender-identity-policies-e96d4dd6"),
        .init(author: "wsj", title: "America's Tech Giants Rush to Comply With New Rules in Europe...", description: "Google, Meta Platforms and others are set to face regulations that resemble the detail and sweep of those imposed on banks", urlToImage: "https://images.wsj.net/im-838647/social", url: "https://www.wsj.com/tech/americas-tech-giants-rush-to-comply-with-new-curbs-in-europe-2076ade9"),
        .init(author: "wsj", title: "China's 40-Year Boom Is Over. What Comes Next?", description: "The economic model that took the country from poverty to great-power status seems broken, and everywhere are signs of distress", urlToImage: "https://images.wsj.net/im-838495/social", url: "https://www.wsj.com/world/china/china-economy-debt-slowdown-recession-622a3be4"),
        .init(author: "wsj", title: "Romney's Political Journey Reaches Crossroads...", description: "Republican senator from Utah, an outspoken critic of Donald Trump, would face a tough fight if he seeks re-election", urlToImage: "https://images.wsj.net/im-835268/social", url: "https://www.wsj.com/politics/policy/mitt-romney-reelection-senate-utah-trump-bf6f386a"),
        .init(author: "David Uberti", title: "U.S. Has Fewest Active Oil Rigs Since the Ukraine War's First Days", description: "Live updates on what's moving markets, including the Dow Jones Industrial Average, Nasdaq Composite and S&P 500", urlToImage: "https://images.wsj.net/im-793474/social", url: "https://www.wsj.com/livecoverage/stock-market-today-dow-jones-08-18-2023"),
        .init(author: "wsj", title: "Hundreds of Gun Dealers Lose Licenses Under Biden Crackdown...", description: "After years of light enforcement to encourage cooperation, ATF is clamping down on firearm sellers, who say they are being unfairly targeted", urlToImage: "https://images.wsj.net/im-835572/social", url: "https://www.wsj.com/us-news/law/hundreds-of-gun-dealers-lose-licenses-under-biden-administration-crackdown-da9d6dfb"),
        .init(author: "wsj", title: "OZEMPIC Craze Could Put These Companies on Crash Diet...", description: "Anti-obesity medications could affect industries that benefit from America’s food problem", urlToImage: "https://images.wsj.net/im-837674/social", url: "https://www.wsj.com/health/healthcare/ozempic-mounjaro-wegovy-eli-lilly-novo-nordisk-stock-87d9d1d6"),
        .init(author: "wsj", title: "Investors Fear China's 'Lehman Moment' Looming...", description: "Troubles at a big trust company are making investors worry about financial contagion from property developers’ distress", urlToImage: "https://images.wsj.net/im-837775/social", url: "https://www.wsj.com/finance/investing/investors-fear-chinas-lehman-moment-is-looming-4364855d")
    ]
}
