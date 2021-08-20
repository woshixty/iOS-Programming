//
//  ViewController-Helper.swift
//  TyWeather
//
//  Created by 谢庭宇 on 2021/8/20.
//

import Foundation
import SwiftyJSON

extension ViewController {
    func showWeather(_ weatherJSON: JSON){
        //数据
        weather.temp = "\(weatherJSON["now"]["temp"].stringValue)˚"
        weather.icon = weatherJSON["now", "icon"].stringValue
        //UI
        tempLabel.text = self.weather.temp
        iconImageView.image = UIImage(named: self.weather.icon)
    }
    
    func showCity(cityJSON: JSON) {
        weather.city = cityJSON["location", 0, "adm2"].stringValue
        cityLabel.text = self.weather.city
    }
    
    func getParampters(_ location: String) -> [String: String] {
        ["location": location, "key": kQweatherWebKey]
    }
    
}
