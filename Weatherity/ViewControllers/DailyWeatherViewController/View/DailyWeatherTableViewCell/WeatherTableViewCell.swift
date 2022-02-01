//
//  WeatherTableViewCell.swift
//  Weatherity
//
//  Created by Harsh on 29/01/2022.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {

    
    @IBOutlet weak var viewWeather: UIView! {
        didSet {
            guard let view = self.viewWeather else { return }
            view.cornerRadius = 8
            view.setDropShadow(color: UIColor.lightGray, opacity: 0.40, offSet: CGSize(width: 0, height: 4), radius: 6)
        }
    }
    @IBOutlet weak var imgWeatherIcon: UIImageView! {
        didSet {
            guard let image = self.imgWeatherIcon else { return }
            image.cornerRadius = 4
            image.backgroundColor = UIColor.white
            image.setDropShadow(color: UIColor.lightGray, opacity: 0.40, offSet: CGSize(width: 0, height: 4), radius: 6)
        }
    }
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblTemperature: UILabel!
    @IBOutlet weak var lblTempDay: UILabel!
    @IBOutlet weak var lblTempNight: UILabel!
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
        self.lblDate.text = (dailWeather.dt).toDate().toString(format: "EEE dd-MMM, yyyy")
        
        self.lblTemperature.text = StringBase.kTempature
        
        self.lblTempDay.text = StringBase.kDay + ": " + weatherViewModel.getCalculatedTemperature(dailWeather.temp?.day ?? 0) + weatherViewModel.getTempUnit()
        self.lblTempNight.text = StringBase.kNight + ": " + weatherViewModel.getCalculatedTemperature(dailWeather.temp?.night ?? 0) + weatherViewModel.getTempUnit()
        
        if let weather = dailWeather.weather.first {
            self.lblDescription.text = (weather.main) + " - " + (weather.weatherDescription)
            imgWeatherIcon.image = UIImage(named: weather.icon)
        }
        else {
            imgWeatherIcon.image = UIImage(named: "50d")
            self.lblDescription.text = "N/A"
        }
    }
}
