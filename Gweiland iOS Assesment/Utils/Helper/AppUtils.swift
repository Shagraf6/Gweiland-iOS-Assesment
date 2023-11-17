//
//  Utils.swift
//  DoctorsAppForPatients
//
//  Created by test on 6/26/23.
//



import Foundation
import UIKit

//import TTGSnackbar
//import MRProgress
//

struct AppUtils{
    
//    struct progessView{
//        public static func show(_ title: String, andViewController vc: UIViewController){
//            let progressView = MRProgressOverlayView()
//            progressView.titleLabelText = "Please wait..."
//            progressView.tintColor = UIColor(named: "accentColor") ?? UIColor.purple
//            progressView.mode = MRProgressOverlayViewMode.indeterminateSmall
//            //vc.view.addSubview(progressView)
//            progressView.show(true)
//        }
//
//        public static func dissmiss(viewController vc: UIViewController){
//            MRProgressOverlayView.dismissOverlay(for: vc.view, animated: true)
//        }
//
//    }
    
    
    struct UIUTils{
        
        public static func changeLabelTextColor(_ lbl: UILabel, andColor color: UIColor) {
            UIView.animate(withDuration: 0.5, delay: 0.1, options: .transitionCrossDissolve, animations: {
                lbl.textColor = color
            }, completion: nil)
        }
        
        public static func changeViewBackgroundColor(_ view: UIView, andColor color: UIColor) {
            UIView.animate(withDuration: 0.1, delay: 0.1, options: .transitionFlipFromRight, animations: {
                view.backgroundColor = color
            }, completion: nil)
        }
        
        public static func shakeTextField(_ txtField: UIView) {
            let animation = CABasicAnimation(keyPath: "position")
            animation.duration = 0.07
            animation.repeatCount = 4
            animation.autoreverses = true
            animation.fromValue = NSValue.init(cgPoint: CGPoint.init(x: txtField.center.x - 10, y: txtField.center.y))
            animation.toValue = NSValue.init(cgPoint: CGPoint.init(x: txtField.center.x + 10, y: txtField.center.y))
            txtField.layer.add(animation, forKey: "position")
        }
    }
    
    
    struct Alert{
        
        
            static func Toast(message: String, controller: UIViewController) {
                let toastContainer = UIView(frame: CGRect())
                toastContainer.backgroundColor = UIColor.black.withAlphaComponent(0.8)
                toastContainer.alpha = 0.0
                toastContainer.layer.cornerRadius = 25;
                toastContainer.clipsToBounds  =  true

                let toastLabel = UILabel(frame: CGRect())
                toastLabel.textColor = UIColor.white
                toastLabel.textAlignment = .center;
                toastLabel.font.withSize(12.0)
                toastLabel.text = message
                toastLabel.clipsToBounds  =  true
                toastLabel.numberOfLines = 0

                toastContainer.addSubview(toastLabel)
                controller.view.addSubview(toastContainer)

                toastLabel.translatesAutoresizingMaskIntoConstraints = false
                toastContainer.translatesAutoresizingMaskIntoConstraints = false

                let a1 = NSLayoutConstraint(item: toastLabel, attribute: .leading, relatedBy: .equal, toItem: toastContainer, attribute: .leading, multiplier: 1, constant: 15)
                let a2 = NSLayoutConstraint(item: toastLabel, attribute: .trailing, relatedBy: .equal, toItem: toastContainer, attribute: .trailing, multiplier: 1, constant: -15)
                let a3 = NSLayoutConstraint(item: toastLabel, attribute: .bottom, relatedBy: .equal, toItem: toastContainer, attribute: .bottom, multiplier: 1, constant: -15)
                let a4 = NSLayoutConstraint(item: toastLabel, attribute: .top, relatedBy: .equal, toItem: toastContainer, attribute: .top, multiplier: 1, constant: 15)
                toastContainer.addConstraints([a1, a2, a3, a4])

                let c1 = NSLayoutConstraint(item: toastContainer, attribute: .leading, relatedBy: .equal, toItem: controller.view, attribute: .leading, multiplier: 1, constant: 65)
                let c2 = NSLayoutConstraint(item: toastContainer, attribute: .trailing, relatedBy: .equal, toItem: controller.view, attribute: .trailing, multiplier: 1, constant: -65)
                let c3 = NSLayoutConstraint(item: toastContainer, attribute: .bottom, relatedBy: .equal, toItem: controller.view, attribute: .bottom, multiplier: 1, constant: -75)
                controller.view.addConstraints([c1, c2, c3])

                UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseIn, animations: {
                    toastContainer.alpha = 1.0
                }, completion: { _ in
                    UIView.animate(withDuration: 0.5, delay: 1.5, options: .curveEaseOut, animations: {
                        toastContainer.alpha = 0.0
                    }, completion: {_ in
                        toastContainer.removeFromSuperview()
                    })
                })
            }
        

        
//        public static  func show_Snackbar( msg : String) {
//            //  view.endEditing(true)
//
//            let snackbar: TTGSnackbar = TTGSnackbar.init(message: msg , duration: .middle)
//
//            // Change the content padding inset
//            snackbar.contentInset = UIEdgeInsets.init(top: 8, left: 10, bottom: 8, right: 10)
//            // Change margin
//            snackbar.leftMargin = 0
//            snackbar.rightMargin = 0
//            /*
//             // Change message text font and color
//             snackbar.messageTextColor = .white
//             snackbar.messageTextFont = UIFont.boldSystemFont(ofSize: 18)
//             // Change snackbar background color
//             snackbar.backgroundColor = .black
//             // Change animation duration
//             snackbar.animationDuration = 0.5
//             // Change action max width
//             //   snackbar.actionMaxWidth = 80
//             // Change bottom margin
//             snackbar.bottomMargin = 12
//             // Change separate line back color
//             snackbar.separateViewBackgroundColor = .yellow
//             */
//            // Change corner radius
//            snackbar.cornerRadius = 0
//
//            // Animation type
//            snackbar.animationType = .slideFromBottomBackToBottom
//            snackbar.show()
//        }
//
        
        public static func showAlertDialog(title :String,msg :String,viewController vc: UIViewController){
            let alertController = UIAlertController(title: title, message: msg, preferredStyle: UIAlertController.Style.alert) //Replace UIAlertControllerStyle.Alert by UIAlertControllerStyle.alert
            //        let DestructiveAction = UIAlertAction(title: "Destructive", style: UIAlertActionStyle.destructive) {
            //            (result : UIAlertAction) -> Void in
            //            print("Destructive")
            //        }
            // Replace UIAlertActionStyle.Default by UIAlertActionStyle.default
            let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) {
                (result : UIAlertAction) -> Void in
                print("OK")
            }
            //        alertController.addAction(DestructiveAction)
            alertController.addAction(okAction)
            vc.present(alertController, animated: true, completion: nil)
        }
        
        public static  func Alert_with_ok_btn(msg : String,success:String,controller:UIViewController){
            let alert = UIAlertController(title: success, message: msg, preferredStyle: UIAlertController.Style.alert)
            // add the actions (buttons)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default,handler:{ action in
                // controller.navigationController?.popViewController(animated: true)
            }))
            controller.present(alert, animated: true, completion: nil)
        }
        
        public static func showAlertDialogWithidentifier(title :String,msg :String, viewController :UIViewController,check :Bool,identifier :String){
            let alertController = UIAlertController(title: title, message: msg, preferredStyle: UIAlertController.Style.alert) //Replace
            let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) {
                (result : UIAlertAction) -> Void in
                if(check == true){
                    
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let secondViewController = storyboard.instantiateViewController(withIdentifier: identifier)
                    viewController.present(secondViewController, animated: true, completion: nil)
                }
            }
            alertController.addAction(okAction)
            viewController.present(alertController, animated: true, completion: nil)
        }
        
    }
    
    
    
    //User defaults
    public static func resetDefaults() {
        let defaults = UserDefaults.standard
        let dictionary = defaults.dictionaryRepresentation()
        dictionary.keys.forEach { key in
            print("userDefauly kry \(key)")
            defaults.removeObject(forKey: key)
        }
    }
    
    
    struct Date_Formatter{
        
       static  var dateFormatter = DateFormatter()
      
        //get years difference
       static func yearsBetweenDate(startDate: Date, endDate: Date) -> Int {

            let calendar = Calendar.current

            let components = calendar.dateComponents([.year], from: startDate, to: endDate)

            return components.year!
        }
        
        //get converted date string from api
         static func getFormatedDateString(currentFormat:String,RequiredFromat:String,DateString:String) -> String?{
            
          
             let dateFormatterGet = DateFormatter()
             dateFormatterGet.dateFormat = currentFormat
             
             //date
             let dateFormatterPrint = DateFormatter()
             dateFormatterPrint.dateFormat = RequiredFromat 

             if let date = dateFormatterGet.date(from: DateString) {
                 return dateFormatterPrint.string(from: date)
                 
             } else {
                print("There was an error decoding the string")
             }

             
             return nil
        }
        
        
        
        
        
        //get date difference
        public static func getRelativeDate(date:Date){
            let exampleDate = date.addingTimeInterval(-15000)

            // ask for the full relative date
            let formatter = RelativeDateTimeFormatter()
            formatter.unitsStyle = .full

            // get exampleDate relative to the current date
            let relativeDate = formatter.localizedString(for: exampleDate, relativeTo: Date.now)

            // print it out
            print("Relative date is: \(relativeDate)")
        }
        
        public static func getDate(date:Date, format:String) -> String{
            dateFormatter = DateFormatter()
            dateFormatter.dateFormat = format
            return dateFormatter.string(from: date)
        }
        
        public static func getDate(date:String) -> Date? {
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            dateFormatter.timeZone = TimeZone.current
            dateFormatter.locale = Locale.current
            return dateFormatter.date(from: date ) // replace Date String
        }
        
        //    HH:mm:ss
        public static  func getDate(date:String,format:String) -> Date? {
            dateFormatter = DateFormatter()
            dateFormatter.dateFormat = format
            dateFormatter.timeZone = TimeZone.current
            dateFormatter.locale = Locale.current
            return dateFormatter.date(from: date ) // replace Date String
        }
        
        public static   func getDate_HH_MM_SS(date:String) -> Date? {
            dateFormatter.dateFormat = "HH:mm:ss"
            dateFormatter.timeZone = TimeZone.autoupdatingCurrent
            dateFormatter.locale = Locale.current
            return dateFormatter.date(from: date ) // replace Date String
        }
        public static func setDateFormat(objDate:Date, format:String)->String{
            dateFormatter.dateFormat = format
            dateFormatter.timeZone = TimeZone.current
            dateFormatter.locale = Locale.current
            return "\(dateFormatter.string(from: objDate))" // replace Date String
            
        }
        
    }
}
extension UIViewController {
    func loader() -> UIAlertController {
        let alert = UIAlertController(title: nil, message: "Please wait...", preferredStyle: .alert)
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.large
        loadingIndicator.startAnimating()
        alert.view.addSubview(loadingIndicator)
        present(alert, animated: true, completion: nil)
        return alert
    }
    
    func stopLoader(loader : UIAlertController){
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
          loader.dismiss(animated: true, completion: nil)
        }
    }
}
// ui activityIndicatorview
extension UIActivityIndicatorView {
    func loader(aview:UIViewController) -> UIActivityIndicatorView {
        let alert = UIAlertController(title: nil, message: "Please wait...", preferredStyle: .alert)
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.large
        loadingIndicator.startAnimating()
        alert.view.addSubview(loadingIndicator)
        aview.present(alert, animated: true, completion: nil)
        return loadingIndicator
    }
    func stopLoader(loader : UIAlertController){
        DispatchQueue.main.async {
            loader.dismiss(animated: true, completion: nil)
        }
    }
    
}
