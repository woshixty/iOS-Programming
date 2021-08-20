//
//  ViewController-CLLocationManagerDelegate.swift
//  TyWeather
//
//  Created by 谢庭宇 on 2021/8/20.
//

import Foundation
import CoreLocation
import Alamofire
import SwiftyJSON

extension ViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let lon = locations[0].coordinate.longitude
        let lat = locations[0].coordinate.latitude
        AF.request(kQweatherNowPath, parameters: getParampters("\(lon),\(lat)")).responseJSON{ response in
            if let data = response.value{
                let weatherJSON = JSON(data)
//                self.tempLabel.text = "\(weatherJSON["now"]["temp"].stringValue)˚"
//                print(weatherJSON["now"]["temp"])
//                self.iconImageView.image = UIImage(named: weatherJSON["now", "icon"].stringValue)
//                print(weatherJSON["refer", "sources", 0])
//                //数据
//                self.weather.temp = "\(weatherJSON["now"]["temp"].stringValue)˚"
//                self.weather.icon = weatherJSON["now", "icon"].stringValue
//                //UI
//                self.tempLabel.text = self.weather.temp
//                self.iconImageView.image = UIImage(named: self.weather.icon)
                self.showWeather(weatherJSON)
                print(weatherJSON)
//                self.showCity(cityJSON: weatherJSON)
            }
        }
        AF.request(kQweatherCityPath, parameters: getParampters("\(lon),\(lat)")).responseJSON{
            reponse in
            if let data = reponse.value{
                let cityJSON = JSON(data)
                self.showCity(cityJSON: cityJSON)
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("出现了异常！")
        print(error)
    }
    
}
