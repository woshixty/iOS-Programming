//
//  ViewController-QueryViewControllerDelegate.swift
//  TyWeather
//
//  Created by 谢庭宇 on 2021/8/20.
//

import Foundation
import Alamofire
import SwiftyJSON

extension ViewController: QueryViewControllerDelegate {
    func didChangeCity(city: String) {
        AF.request(kQweatherCityPath, parameters: getParampters(city)).response{
            reponse in
            if let data = reponse.value{
                let cityJSON = JSON(data ?? "")
                //数据
                self.showCity(cityJSON: cityJSON)
                let cityID = cityJSON["location", 0, "id"].stringValue
                AF.request(kQweatherNowPath, parameters: self.getParampters(cityID)).responseJSON{ response in
                    if let data = response.value{
                        let weatherJSON = JSON(data)
                        self.showWeather(weatherJSON)
                    }
                }
            }
        }
    }
}
