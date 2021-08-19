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

class ViewController: UIViewController, CLLocationManagerDelegate {
    
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
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let lon = locations[0].coordinate.longitude
        let lat = locations[0].coordinate.latitude
        AF.request("https://devapi.qweather.com/v7/weather/now?location=\(lon),\(lat)&key=0a14ac4b0af941ba951b938217730547").responseJSON{ response in
            if let data = response.value{
                let weatherJSON = JSON(data)
//                self.tempLabel.text = "\(weatherJSON["now"]["temp"].stringValue)˚"
//                print(weatherJSON["now"]["temp"])
//                self.iconImageView.image = UIImage(named: weatherJSON["now", "icon"].stringValue)
//                print(weatherJSON["refer", "sources", 0])
                self.weather.temp = "\(weatherJSON["now"]["temp"].stringValue)˚"
                self.weather.icon = weatherJSON["now", "icon"].stringValue
                
                self.tempLabel.text = self.weather.temp
                self.iconImageView.image = UIImage(named: self.weather.icon)
            }
        }
        AF.request("https://geoapi.qweather.com/v2/city/lookup?location=\(lon),\(lat)&key=0a14ac4b0af941ba951b938217730547").response{
            reponse in
            if let data = reponse.value{
                let cityJSON = JSON(data ?? "")
                self.weather.city = cityJSON["location", 0, "adm2"].stringValue + " " + cityJSON["location", 0, "name"].stringValue
                self.cityLabel.text = self.weather.city
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("出现了异常！")
        print(error)
    }

}

