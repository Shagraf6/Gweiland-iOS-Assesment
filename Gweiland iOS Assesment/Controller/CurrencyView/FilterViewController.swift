//
//  FilterViewController.swift
//  Gweiland iOS Assesment
//
//  Created by Me on 11/16/23.
//

import UIKit

class FilterViewController: UIViewController {
   //outlets
    @IBOutlet weak var filterOption_tb: UITableView!
    @IBOutlet weak var titleLabel: UILabel!
    
    //Variables
    
    var selectedOption : ((Int?)->())?
    var filterOptionArray = ["Sort with Price","Sort with Volume"]
  
    override func viewDidLoad() {
        super.viewDidLoad()
        setTitle()
        configTb()
    }
   
    func setTitle(){
        titleLabel.text = "Filter$Sort Data"
    }
    
    @IBAction func onClick_cancelBtn(_ sender: Any) {
       
        if let selectedOption{
            selectedOption(nil)
        }
        self.dismiss(animated: true)
    }

}

// MARK: - tableview handler
extension FilterViewController:UITableViewDelegate,UITableViewDataSource{
   
    func configTb(){
        filterOption_tb.dataSource = self
        filterOption_tb.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return filterOptionArray.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        let cell = filterOption_tb.dequeueReusableCell(withIdentifier: "LanguageCell", for: indexPath)
        cell.textLabel?.text = filterOptionArray[indexPath.row]
    return cell
        }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("row selected \(filterOptionArray[indexPath.row])")
        if let selectedOption{
            selectedOption(indexPath.row)
        }
        self.dismiss(animated: true)
      
    }
    
}
