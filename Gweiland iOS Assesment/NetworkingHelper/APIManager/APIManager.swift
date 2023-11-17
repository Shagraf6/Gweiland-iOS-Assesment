//
//  APIManager.swift
//  DoctorsAppForPatients
//
//  Created by test on 6/27/23.
//


import Foundation
import UIKit
//import SwiftyJSON

enum DataError: Error{
    
    case invalidResponse
    case invalidURL
    case invalidData
    case network(_ error: Error?)
    
}

typealias Handler<T> = (Result<T,DataError>)  -> Void

final class APIManager{

    static let shared = APIManager()
    static var commonHeaders:[String:String]{
        return [
            "Content-Type": "application/json",
           "Accept": "application",
            "X-CMC_PRO_API_KEY": "\(K.API.Key.AuthKey)"
            
        ]
    }
    
    //can't create its object
    private init(){}
    
 func getRequest<T: Codable>(
        modelType:T.Type,
        type:EndPointType,
        completionHandler: @escaping Handler <T>)
    {
        
        guard let url =  type.url else {
            print("url failed")
            completionHandler(.failure(DataError.invalidURL))
            return
        }
        
        var request = URLRequest(url: url)
       print(url)
        request.httpMethod = type.method.rawValue
     
        if let parameters = type.body{
            print("in param")
            print(parameters)
            request.httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: .fragmentsAllowed)
            //request.httpBody = try? JSONEncoder().encode(parameters)
        }
        
        request.setValue("application/json", forHTTPHeaderField:"Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("X", forHTTPHeaderField: "X-Requested-With")
        request.addValue("\(K.API.Key.AuthKey)", forHTTPHeaderField: "X-CMC_PRO_API_KEY")

        //Background task
        URLSession.shared.dataTask(with: request) { data, response, error in
         
         
            guard let data,error == nil else {
                print("printintg data \(data)")
                print(error?.localizedDescription)
                completionHandler(.failure(DataError.invalidData))
                return

            }
            guard let response = response as? HTTPURLResponse, 200 ... 299 ~= response.statusCode else{
                completionHandler(.failure(DataError.invalidResponse))
                return
            }
            do {
                
                print(" url - got data decodec obj  \(data)")
                //print(data)
                
                if modelType == Data.self{
                    completionHandler(.success(data as! T))
                }
                
                else{
                    let decodedObj = try JSONDecoder().decode(modelType, from: data)
               
                //   print("decodec obj \(decodedObj)")
                    
                  //      let result = try JSONDecoder().decode(Response.self, from: data)
                  
                    
                    completionHandler(.success(decodedObj))
                }
            }
            catch{
                
                completionHandler(.failure(DataError.network(error)))
            }

        }.resume()
    }
   
    func getImage(urlStirng: String, completion: @escaping (UIImage?) -> Void) {
        
        if  let url = URL(string: urlStirng){
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data, let img = UIImage(data: data) {
                    completion(img)
                } else {
                    completion(nil)
                }
            }.resume()
        }
    }

    
}

extension String {
    func getCleanedURL() -> URL? {
        guard self.isEmpty == false else {
            return nil
        }
        if let url = URL(string: self) {
            return url
        } else {
            if let urlEscapedString = self.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) , let escapedURL = URL(string: urlEscapedString){
                return escapedURL
            }
        }
        return nil
    }
}



//protocol MyEncodable: Encodable {
//    func toJSONData() -> Data?
//}
//
//extension MyEncodable {
//    func toJSONData() -> Data?{ try? JSONEncoder().encode(self) }
//}
extension Encodable {
    func toJSONData() -> Data? { try? JSONEncoder().encode(self) }
}
