// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let postModel = try? JSONDecoder().decode(PostModel.self, from: jsonData)

import Foundation

// MARK: - PostModel
struct CurrencyLogoModel: Codable {
  //  let status: Status
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let response: CurrencyImgData

//    enum CodingKeys: String, CodingKey {
//        case the1027 = "1027"
//    }
}

// MARK: - The1027
struct CurrencyImgData: Codable {
    let id: Int
    let name, symbol, category, description: String
    let slug: String
    let logo: String
    let subreddit, notice: String
    let tags, tagNames: [String]
    let dateAdded, twitterUsername: String
    let isHidden: Int
 
    enum CodingKeys: String, CodingKey {
        case id, name, symbol, category, description, slug, logo, subreddit, notice, tags
        case tagNames = "tag-names"
        case dateAdded = "date_added"
        case twitterUsername = "twitter_username"
        case isHidden = "is_hidden"
      }
}



// MARK: - Coin
struct Coin: Codable {
    let id, name, symbol, slug: String
}

