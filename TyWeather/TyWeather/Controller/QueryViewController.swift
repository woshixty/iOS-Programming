//
//  QueryViewController.swift
//  TyWeather
//
//  Created by 谢庭宇 on 2021/8/20.
//

import UIKit

protocol QueryViewControllerDelegate {
    func didChangeCity(city: String)
}

class QueryViewController: UIViewController {
    var city = ""
    var delegate: QueryViewControllerDelegate?

    @IBOutlet weak var cityLabel: UILabel!
    
    @IBOutlet weak var cityTextfield: UITextField!
    
    @IBAction func query(_ sender: Any) {
        dismiss(animated: true)
        //只有在用户输入内容以后才会查询
        if !cityTextfield.text!.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            delegate?.didChangeCity(city: cityTextfield.text!)
        }
    }
    
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //进入页面光标聚焦
        cityTextfield.becomeFirstResponder()
        //相反的：cityTextfield.resignFirstResponder()
        cityLabel.text = city
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
