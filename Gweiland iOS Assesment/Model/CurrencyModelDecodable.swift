// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let postModel = try? JSONDecoder().decode(PostModel.self, from: jsonData)

import Foundation

// MARK: - PostModel
struct CurrencyModel: Codable {
   // let status: Status
    let data: [CurrencyDatum]
    enum CodingKeys: String, CodingKey {
     //   case status = "num_market_pairs"
        case data = "data"
    }
}

// MARK: - Datum
struct CurrencyDatum: Codable {
    let id: Int
    let name, symbol, slug: String
    let numMarketPairs: Int
    let dateAdded: String
    let tags: [String]
   // let maxSupply: Int?
    let circulatingSupply, totalSupply: Double
    let infiniteSupply: Bool
 //   let platform: Platform?
 //   let cmcRank: Int
//    let selfReportedCirculatingSupply, selfReportedMarketCap, tvlRatio: Double?
//    let lastUpdated: LastUpdated
    let quote: Quote

    enum CodingKeys: String, CodingKey {
        case id, name, symbol, slug
        case numMarketPairs = "num_market_pairs"
        case dateAdded = "date_added"
        case tags =  "tags"
      //  case maxSupply = "max_supply"
        case circulatingSupply = "circulating_supply"
        case totalSupply = "total_supply"
        case infiniteSupply = "infinite_supply"
//        case platform = "platform"
//        case cmcRank = "cmc_rank"
//        case selfReportedCirculatingSupply = "self_reported_circulating_supply"
//        case selfReportedMarketCap = "self_reported_market_cap"
//        case tvlRatio = "tvl_ratio"
//                case lastUpdated = "last_updated"
        case quote = "quote"
    }
}



// MARK: - Platform
struct Platform: Codable {
    let id: Int
    let name, symbol, slug, tokenAddress: String

    enum CodingKeys: String, CodingKey {
        case id, name, symbol, slug
        case tokenAddress = "token_address"
    }
}

// MARK: - Quote
struct Quote: Codable {
    let usd: Usd

    enum CodingKeys: String, CodingKey {
        case usd = "USD"
    }
}

// MARK: - Usd
struct Usd: Codable {
    let price, volume24H, volumeChange24H, percentChange1H: Double
    let percentChange24H, percentChange7D, percentChange30D, percentChange60D: Double
    let percentChange90D, marketCap, marketCapDominance, fullyDilutedMarketCap: Double
 //   let tvl: Double?
   // let lastUpdated: LastUpdated

    enum CodingKeys: String, CodingKey {
        case price
        case volume24H = "volume_24h"
        case volumeChange24H = "volume_change_24h"
        case percentChange1H = "percent_change_1h"
        case percentChange24H = "percent_change_24h"
        case percentChange7D = "percent_change_7d"
        case percentChange30D = "percent_change_30d"
        case percentChange60D = "percent_change_60d"
        case percentChange90D = "percent_change_90d"
        case marketCap = "market_cap"
        case marketCapDominance = "market_cap_dominance"
        case fullyDilutedMarketCap = "fully_diluted_market_cap"
      //  case tvl
      //  case lastUpdated = "last_updated"
    }
}

//// MARK: - Status
//struct Status: Codable {
//    let timestamp: String
//    let errorCode: Int
//  //  let errorMessage: String?
//    let elapsed, creditCount: Int
////    let notice: String?
//    let totalCount: Int
//
//    enum CodingKeys: String, CodingKey {
//        case timestamp = "timestamp"
//        case errorCode = "error_code"
//      //  case errorMessage = "error_message"
//        case elapsed = "elapsed"
//        case creditCount = "credit_count"
//        //case notice = "notice"
//        case totalCount = "total_count"
//    }
//}
//
