//
//  EndPointType.swift
//  DoctorsAppForPatients
//
//  Created by test on 6/27/23.
//

import Foundation
//

enum HTTPMethods:String{
    
    case get = "GET"
    case post = "POST"
    case patch = "PATCH"
}

protocol EndPointType{
    
    var path:String { get }
    var baseURL:String { get }
    var serverURL:String{ get }
    var url:URL?{ get }
    var method:HTTPMethods { get }
    //var body:Encodable?{get}
    var body:AnyHashable?{get}
    var headers:[String:String]?{get}
}
