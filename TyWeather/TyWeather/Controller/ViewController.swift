//
//  ViewController.swift
//  TyWeather
//
//  Created by 谢庭宇 on 2021/8/17.
//

import UIKit
import CoreLocation
import Alamofire
import SwiftyJSON

//delegate--代理/委托
//protocol--协议

class ViewController: UIViewController {
    
    @IBOutlet weak var tempLabel: UILabel!
    
    @IBOutlet weak var iconImageView: UIImageView!
    
    @IBOutlet weak var cityLabel: UILabel!
    
    let weather = Weather()
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //请求授权，获取当前位置
        locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
    }
    
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
//        if segue.identifier == "search" {
//            let vc = segue.destination as! QueryViewController
//            vc.city = weather.city
//        }
        
        if let vc = segue.destination as? QueryViewController {
            vc.city = weather.city
            vc.delegate = self
        } 
    }
    
    
}

