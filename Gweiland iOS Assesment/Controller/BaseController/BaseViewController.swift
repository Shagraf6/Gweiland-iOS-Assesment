//
//  BaseViewController.swift
//  DoctorsAppForPatients
//
//  Created by test on 7/8/23.
//

import UIKit

class BaseViewController: UIViewController {
 //   var spinner:UIAlertController?
    let dateFormatter = DateFormatter()
    let userdefault = UserDefaults.standard
    var spinnerArray = [UIAlertController]()
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
       print("updaiting constants didload in base controller")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("updaiting constants viewwillAppear in base controller")
    }
    
    
    func getImage(imageCode:String) -> UIImage?{
        switch (imageCode){
        case "G":
            return UIImage(named: K.AssetImage.greenLine)
        case "R":
            return  UIImage(named: K.AssetImage.redLine)
        default:
            return  UIImage(named: K.AssetImage.redLine)
        }
    }
    
    func getColor(ColorCode:String) -> UIColor{
        switch ColorCode{
        case "G","g":
            return K.Color.green ?? .green
        case "R","r":
            return K.Color.red ?? .red
        default:
            return K.Color.red ?? .red
        }
    }
    
    func removeSpinner(){
        DispatchQueue.main.async {
            if  self.spinnerArray.count>0{
                let spinner = self.spinnerArray[self.spinnerArray.count-1]
                print("spinner count \(self.spinnerArray.count)")
                self.stopLoader(loader: spinner)
                self.spinnerArray.removeLast()
                //  self.spinner = nil
            }
        }
    }
   
    
    func getDate(dateString:String)->Date?{
          dateFormatter.dateFormat = "yyyyMMdd" //20230414
          return dateFormatter.date(from:dateString)
        
    }
}

