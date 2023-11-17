//
//  CurrencyTableViewCell.swift
//  Gweiland iOS Assesment
//
//  Created by Me on 11/15/23.
//

import UIKit

class CurrencyTableViewCell: UITableViewCell {
    @IBOutlet weak var coinPrice_lbl: UILabel!
    @IBOutlet weak var currencyName_lbl: UILabel!
    @IBOutlet weak var currencyShortName_lbl: UILabel!
    @IBOutlet weak var currencyProfit_lbl: UILabel!
    @IBOutlet weak var bitCoin_Img: UIImageView!
    @IBOutlet weak var bitCoinGraph_Img: UIImageView!
   

    var currency:CurrencyDatum?{
        didSet{
            currencyDetailConfiguration()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
   
    @IBAction func onclick_bookAppointment(_ sender: Any) {
        
   //     self.btnDelegate?.bookAppointmentBtnTapped(index: (sender as? UIButton)!.tag )
    }
    
    func currencyDetailConfiguration(){
        
        guard let currency else {return}
        coinPrice_lbl.text = "$\(round(currency.quote.usd.price)) USD"
        currencyName_lbl.text = currency.name
        currencyShortName_lbl.text = currency.symbol
        currencyProfit_lbl.text = "\(currency.quote.usd.percentChange24H.roundTo(decimalPlaces: 1))%"
        
        
        currencyProfit_lbl.textColor = getColor(per: currency.quote.usd.percentChange24H)
        // bitCoin_Img.image =
        bitCoinGraph_Img.image = getImage(per: currency.quote.usd.percentChange24H)
        
        
        bitCoin_Img.image = UIImage(systemName: "bitcoinsign.circle")
        //  myImageView.loadFrom(URLAddress: "example.com/image.png")
        
        
    }
    
    func getColor(per:Double) -> UIColor{
        if per > 0 {
            return K.Color.green ?? .green
        }
    
        return  K.Color.red ?? .red
    
    }
    
    func getImage(per:Double) -> UIImage{
        if per > 0 {
            return UIImage(named:K.AssetImage.greenLine)!
        }
    
        return UIImage(named: K.AssetImage.redLine)!
    }

  
}
extension Double {
    func roundTo(decimalPlaces: Int) -> String {
        return NSString(format: "%.\(decimalPlaces)f" as NSString, self) as String
    }
}
