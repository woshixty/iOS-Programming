//
//  ViewController.swift
//  TyWeather
//
//  Created by 谢庭宇 on 2021/8/17.
//

import UIKit
import CoreLocation
import Alamofire

//delegate--代理/委托
//protocol--协议

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //请求授权，获取当前位置
        locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let lon = locations[0].coordinate.longitude
        let lat = locations[0].coordinate.latitude
        print(lon)
        print(lat)
        AF.request("https://devapi.qweather.com/v7/weather/now?location=\(lon),\(lat)&key=0a14ac4b0af941ba951b938217730547").responseJSON{response in
            if let data = response.value{
                print(data)
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }

}

