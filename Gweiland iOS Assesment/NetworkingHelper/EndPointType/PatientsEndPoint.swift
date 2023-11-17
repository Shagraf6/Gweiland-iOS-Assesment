//
//  DoctorsEndPoint.swift
//  DoctorsAppForPatients
//
//  Created by test on 6/27/23.
//

import Foundation

enum CurrenyEndPoint{
    case GetCurrencyData // Module
    case GetImgData(slug:String) // Module

}

extension CurrenyEndPoint:EndPointType{
    var path: String {
        switch self {
            
            
        case .GetCurrencyData:
            return K.API.getCurrencyList
        case .GetImgData(let slug):
            return "\(K.API.getImageData)?slug=\(slug)"
        }
        
        
    }
    
    var serverURL: String {
        return K.API.Server
        
    }
    
    var baseURL: String {
        return K.API.Base
    }
    
    var url: URL? {
        print("\(baseURL)\(serverURL)\(path)")
        switch self{
       
        default:
            return "\(baseURL)\(serverURL)\(path)".getCleanedURL()
        }
    }
    
    var method: HTTPMethods {
        
        switch self {
        case .GetCurrencyData:
            return .get
        case .GetImgData:
            return .get
        }
    }
    
    
    var headers: [String : String]? {
        return APIManager.commonHeaders
    }
    
    
    var body: AnyHashable? {
        switch self {
        case .GetCurrencyData:
            return nil
        case .GetImgData:
            return nil
        }
    }
}


extension CurrenyEndPoint{
    
    func getCancelAppointParam()-> [String:AnyHashable]{
        return [
            "BookingStatus" : "C"
        ]
    }
}
