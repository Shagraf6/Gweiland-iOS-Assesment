
import Foundation
import UIKit
import SwiftUI

struct K{
    //MARK: - API Constants
    struct API{
        
        
        
        struct Key{
            static let AuthKey = "c080f2a3-984b-4028-a13b-84e487da1254" // PRD
            static let Auth = "X-CMC_PRO_API_KEY"
            
        }
        
        static let Base = "https://pro-api.coinmarketcap.com" // prd
        static let Server = ""
        static let getCurrencyList = "/v1/cryptocurrency/listings/latest"
        static let getImageData = "/v2/cryptocurrency/info"
        
        //?CMC_PRO_API_KEY=c080f2a3-984b-4028-a13b-84e487da1254&slug=ethereum
        
    }
    
    struct Error{
        
        static let InValidOTP = "Invalid Data"
        static let SomethingWentWrong = "Something went wrong, try again!"
    }
    
    
    struct Color{
        static let AccentColor = UIColor(named:"AccentColor")
        static let gray = UIColor.systemGray6
        static let green = UIColor(named: "green")
        static let red = UIColor(named: "red")
        
    }
    struct AppFontName {
        static let regular = "Inter-Regular"
        static let bold = "Inter-Bold"
        static let semibold = "Inter-SemiBold"
    }
    struct AssetImage{
        static let greenLine = "greenLine"
        static let redLine = "grapph"
    }
    
    
    struct Controller{
        
        static let FilterViewController = "FilterViewController"
      }
    
    struct Cell{
        //Table view cell
        static let CurrencyTableViewCell = "CurrencyTableViewCell"
        //collection view cell
      }
    
    
    
}

