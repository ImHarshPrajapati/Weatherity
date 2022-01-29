//
//  WeatherTableViewCell.swift
//  Weatherity
//
//  Created by Harsh on 29/01/2022.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {

    
    @IBOutlet weak var imgWeatherIcon: UIImageView!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblTemperature: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    
    var weatherViewModel = WeatherViewModel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: Other Methods
    func initWeatherData(_ dailWeather: DailyWeather) {
        self.selectionStyle = .none
        self.lblDate.text = (dailWeather.dt ?? 0).toDate().toString(format: "dd-MMM, yyyy")
        self.lblTemperature.text = "\(StringBase.kTempature): \(dailWeather.temp?.day ?? 0)\(weatherViewModel.getTempUnit())"
        if let weathers = dailWeather.weather, let weather = weathers.first {
            self.lblDescription.text = weather.weatherDescription ?? "N/A"
            imgWeatherIcon.image = UIImage(named: weather.icon ?? "50d")
        }
        else {
            imgWeatherIcon.image = UIImage(named: "50d")
            self.lblDescription.text = "N/A"
        }
    }
}
