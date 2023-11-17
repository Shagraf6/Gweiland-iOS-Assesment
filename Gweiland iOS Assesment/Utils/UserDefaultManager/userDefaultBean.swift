////
////  userDefaultBean.swift
////  DoctorsAppForPatients
////
////  Created by test on 7/3/23.
////
//
//
//import Foundation
////import ObjectMapper
////import CoreLocation
//final class Bean {
//  
//    public static var sharedIntance=Bean()
//     let userdefault = UserDefaults.standard
//    
//    private init(){
//        }
//       
//    //Bool
//    func get_BoolValue(key:String) -> Bool{
//        return userdefault.bool(forKey: key)
//    }
//
//    func set_boolValue(value:Bool,key:String){
//        userdefault.set(value, forKey: key)
//    }
//    
//    //String
//    func get_StringValue(key:String) -> String? {
//        return userdefault.string(forKey: key)
//    }
//
//    func set_StringValue(value:String,key:String){
//        userdefault.set(value, forKey: key)
//    }
//    
//    //Double
//    func get_DoubleValue(key:String) -> Double{
//        return userdefault.double(forKey: key)
//    }
//
//    func set_DoubleValue(value:Double,key:String){
//        userdefault.set(value, forKey: key)
//    }
//    
//    //Int
//    func get_IntValue(key:String) -> Int{
//        return userdefault.integer(forKey: key)
//    }
//
//    func set_IntValue(value:Int,key:String){
//       userdefault.set(value, forKey: key)
//    }
//    
//    func set_iSLogin(value:Bool){
//        userdefault.set(value, forKey: "Islogin")
//    }
//    
//    func get_iSLogin() -> Bool{
//        return userdefault.bool(forKey: "Islogin")
//           }
//   
//    func set_userData(Sourcedata:String){
//   // AppData.userdefault.set(Sourcedata.toJSONString(), forKey: "user_data")
//
//    }
//  
//
//    func resetDefaults() {
//        let dictionary = userdefault.dictionaryRepresentation()
//        dictionary.keys.forEach { key in
//            userdefault.removeObject(forKey: key)
//        }
//    }
//    var getPatientData: Patient? {
//        if let objects = userdefault.value(forKey: K.UserDefaultKey.Patient) as? Data {
//           let decoder = JSONDecoder()
//           if let objectsDecoded = try? decoder.decode(Patient.self, from: objects) as Patient {
//              return objectsDecoded
//           } else {
//              return nil
//           }
//        } else {
//           return nil
//
//       }
//     }
//
//    
//     func savePatientData(currentPatient: Patient) {
//         let encoder = JSONEncoder()
//         if let encoded = try? encoder.encode(currentPatient){
//             userdefault.set(encoded, forKey: K.UserDefaultKey.Patient)
//         }
//    }
//
//    //    func get_userData() -> Patient {
//    //    if userdefault.string(forKey: "user_data") != nil
//    //          {
//    //         let userString = userdefault.string(forKey: "user_data")!
//    //                 return Mapper<UserBean>().map(JSONString: userString)!
//    //    }
//    //    return UserBean()
//    //
//    //}
//    
////
////     var getAllObjects: [user]? {
////         let defaultObject = user()
////        if let objects = AppData.userdefault.value(forKey: "user_objects") as? Data {
////            let decoder = JSONDecoder()
////            if let objectsDecoded = try? decoder.decode(Array.self, from: objects) as [user] {
////               return objectsDecoded
////            } else {
////               return nil
////            }
////         } else {
////            return nil
////
////        }
////      }
//    
//    
//
//
//
//}
//extension UserDefaults {
//    func storeCodable<T: Codable>(_ object: T, key: String) {
//        do {
//            let data = try JSONEncoder().encode(object)
//            print("data stored successfully!")
//            UserDefaults.standard.set(data, forKey: key)
//        } catch let error {
//            print("Error encoding key: \(error)")
//        }
//    }
//    
//    func retrieveCodable<T: Codable>(for key: String) -> T? {
//        do {
//            guard let data = UserDefaults.standard.data(forKey: key) else {
//                  return nil
//            }
//           return try JSONDecoder().decode(T.self, from: data)
//        } catch let error {
//            print("Error decoding key: \(error)")
//            return nil
//        }
//    }
//}
