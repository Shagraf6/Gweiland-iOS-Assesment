//
//  MainViewController.swift
//  Gweiland iOS Assesment
//
//  Created by Me on 11/15/23.
//

import UIKit

class MainViewController: BaseViewController {
    
    @IBOutlet weak var seacrh_tf: UITextFieldX!
    @IBOutlet weak var coinPer_lbl: UILabel!
    @IBOutlet weak var coinPrice_lbl: UILabel!
    @IBOutlet weak var filledRectangle_img: UIImageView!
    
    @IBOutlet weak var bitCoin_Img: UIImageView!
    @IBOutlet weak var filledGraph_img: UIImageView!
    //   @IBOutlet weak var search_tf: UISearchBar!
    @IBOutlet weak var currency_tableView: UITableView!
    
    var currencyList = [CurrencyDatum]()
    var fileteredCurrencyList = [CurrencyDatum]()
    var logoImgUrlList=[Logo]()
    
    var imgCount = 0
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configtf()
        config_Tb()
        DispatchQueue.main.async {
            self.getCurrencyList()
        }
    }
    
    @IBAction func onClick_filterBtn(_ sender: Any) {
        showFilterOptions()
    }
}

//MARK: - retrieving Prescription data from the api

extension MainViewController{
    
    
    func getLogoUrls(){
        logoImgUrlList.removeAll()
        if currencyList.count>0{
            self.spinnerArray.append(self.loader())
            getImgData(slug: currencyList[0].slug, id: currencyList[0].id)
        }
    }
    
    func getCurrencyList(){
        self.spinnerArray.append(self.loader())
        APIManager.shared.getRequest(modelType: CurrencyModel.self, type: CurrenyEndPoint.GetCurrencyData) { result in
            self.removeSpinner()
            switch result{
            case .success(let currencyList):
                
                self.currencyList = currencyList.data
                self.fileteredCurrencyList = currencyList.data
                
                DispatchQueue.main.async {
                    self.currency_tableView.reloadData()
                    self.getLogoUrls()
                }
                
            case .failure(let error):
                print("error \(error.localizedDescription)")
            }
        }
    }
    
    func getImgData(slug:String,id:Int){
        APIManager.shared.getRequest(modelType: Data.self, type: CurrenyEndPoint.GetImgData(slug: slug)) { [self] result in
            switch result{
            case .success(let data):
                let dic = convertStringToDictionary(text: (data.prettyPrintedJSONString ?? "") as String)
                if let dic{
                    if let data = (dic as AnyObject)["data"]! as? [String:AnyObject]
                    {
                        if let currentObj = (data as AnyObject)["\(id)"]! as? [String:AnyObject]
                        {
                            if let url = (currentObj as AnyObject)["logo"]! as? String
                            {
                                print("Printing data url \(url) , slug: \(slug)")
                                logoImgUrlList.append(Logo(id: id, url: url))
                                DispatchQueue.main.async {
                                    self.currency_tableView.reloadData()
                                }
                         }
                        }
                    }
                }
                
            case .failure(let error):
                print("error \(error.localizedDescription)")
            }
        }
        
        imgCount = imgCount + 1
        self.fetchMoreImgData()
    }
    
    func fetchMoreImgData(){
        DispatchQueue.main.async {
            print("\(self.imgCount), list count \(self.currencyList.count)")
            if self.imgCount == self.currencyList.count-1 {
                self.removeSpinner()
                DispatchQueue.main.async {
                    print("reloading table view")
                    self.currency_tableView.reloadData()
                }
            }
            else{
                self.getImgData(slug: self.currencyList[self.imgCount].slug , id: self.currencyList[self.imgCount].id)
            }
        }
    }
    
    func convertStringToDictionary(text: String) -> [String:AnyObject]? {
        if let data = text.data(using: .utf8) {
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String:AnyObject]
                //    print("cinvert string to json \(json)")
                return json
            } catch {
                print("Something went wrong")
            }
        }
        return nil
    }
    
    
}


//MARK: - handling table view datasource and delegate methods
extension MainViewController:UITableViewDelegate,UITableViewDataSource{
    
    
    func config_Tb(){
        currency_tableView.register(UINib(nibName: K.Cell.CurrencyTableViewCell, bundle: nil), forCellReuseIdentifier: K.Cell.CurrencyTableViewCell)
        currency_tableView.delegate = self
        currency_tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fileteredCurrencyList.count
        //return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: K.Cell.CurrencyTableViewCell, for: indexPath) as? CurrencyTableViewCell else{
            return UITableViewCell()
        }
        
        let Obj = fileteredCurrencyList[indexPath.row]
        cell.currency = Obj
        cell.selectionStyle = .none
        
        if Obj.name == "Bitcoin"{
            coinPrice_lbl.text = "$\(round(Obj.quote.usd.price)) USD"
            coinPer_lbl.text = "\(Obj.quote.usd.percentChange24H.roundTo(decimalPlaces: 1))%"
        }
        
        APIManager.shared.getImage(urlStirng: getImgUrl(id: Obj.id)) { img in
            DispatchQueue.main.async {
                cell.bitCoin_Img.image = img
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("did select row at \(indexPath.row)")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //     return UITableView.automaticDimension
        return 70
    }
    
    func getImgUrl(id:Int) -> String{
        
        let imgData = self.logoImgUrlList.filter {
            $0.id == id
        }
        
        if imgData.count > 0{
            return imgData[0].url
        }
        return ""
    }
    
}

// search tf delegate and configuration
extension MainViewController : UITextFieldDelegate{
    
    func configtf()
    {
        seacrh_tf.delegate = self
        seacrh_tf.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
    }
    
    @objc func textDidChange(textField: UITextField) {
        if(!textField.hasText){
            fileteredCurrencyList = currencyList
        }
        else{
            fileteredCurrencyList.removeAll()
            for obj in currencyList {
                let range = obj.name.lowercased().range(of: textField.text!, options: .caseInsensitive, range: nil, locale: nil)
                print("search text \(textField.text)")
                if range != nil {
                    self.fileteredCurrencyList.append(obj)
                }
            }
        }
        currency_tableView.reloadData()
    }
    
}

//MARK: - filter data

extension MainViewController{
    
    func showFilterOptions(){
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: K.Controller.FilterViewController) as! FilterViewController
        
        vc.selectedOption = { opt in
            
            if let opt{
                DispatchQueue.main.async {
                    self.getFilteredData(opt: opt)
                }
            }
        }
        
        vc.modalPresentationStyle = .overCurrentContext
        self.present(vc, animated: true)
    }
    
    func getFilteredData(opt:Int){
        
        switch opt{
        case 0:
            fileteredCurrencyList = fileteredCurrencyList.sorted { $0.quote.usd.price > $1.quote.usd.price }
            
        case 1:
            fileteredCurrencyList = fileteredCurrencyList.sorted { $0.quote.usd.percentChange24H > $1.quote.usd.percentChange24H }
            
        default:
            fileteredCurrencyList =  fileteredCurrencyList.sorted { $0.quote.usd.price > $1.quote.usd.price }
        }
        
        currency_tableView.reloadData()
        
    }
}
