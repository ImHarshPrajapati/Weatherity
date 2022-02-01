//
//  WeatherDetailViewController.swift
//  Weatherity
//
//  Created by Harsh on 30/01/2022.
//

import UIKit

class WeatherDetailViewController: UIViewController {

    //MARK: - Properties
    @IBOutlet weak var lblTimeZone: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    
    @IBOutlet weak var imgWeatherIcon: UIImageView! {
        didSet {
            guard let image = self.imgWeatherIcon else { return }
            image.cornerRadius = 4
        }
    }
    
    @IBOutlet weak var lblWeather: UILabel!
    @IBOutlet weak var lblWeatherDesc: UILabel!
    
    @IBOutlet weak var lblTempDay: UILabel!
    @IBOutlet weak var lblTempNight: UILabel!
    @IBOutlet weak var lblTempUnit: UILabel!
    
    @IBOutlet weak var lblSunrise: UILabel!
    @IBOutlet weak var lblSunset: UILabel!
    @IBOutlet weak var lblMoonrise: UILabel!
    @IBOutlet weak var lblMoonset: UILabel!
    @IBOutlet weak var lblHumidity: UILabel!
    @IBOutlet weak var lblWindSpeed: UILabel!
    
    var dailyWeather: DailyWeather!
    var weatherModel: WeatherModel!
    
    var weatherViewModel = WeatherViewModel()
    
    // MARK: ViewController LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initAndSetupView()
    }
    
    // MARK: Other Methods
    func initAndSetupView() {
        
        self.lblTimeZone.text = weatherModel.timezone
        self.lblDate.text = (dailyWeather.dt).toDate().toString(format: "EEE dd-MMM, yyyy")
        
        self.lblTempDay.text = StringBase.kDay + ": " + weatherViewModel.getCalculatedTemperature(dailyWeather.temp?.day ?? 0)
        self.lblTempNight.text = StringBase.kNight + ": " + weatherViewModel.getCalculatedTemperature(dailyWeather.temp?.night ?? 0)
        
        self.lblTempUnit.text = weatherViewModel.getTempUnit()
        
        if let weather = dailyWeather.weather.first {
            self.lblWeather.text = weather.main
            self.imgWeatherIcon.image = UIImage(named: weather.icon)
            self.lblWeatherDesc.text = weather.weatherDescription
        }
        else {
            self.imgWeatherIcon.image = UIImage(named: "50d")
            self.lblWeather.text = "N/A"
            self.lblWeatherDesc.text = "N/A"
        }
        
        self.lblSunrise.text = (dailyWeather.sunrise).toDate().toString(format: "EEE, HH:mm")
        self.lblSunset.text = (dailyWeather.sunset).toDate().toString(format: "EEE, HH:mm")
        
        self.lblMoonrise.text = (dailyWeather.moonrise).toDate().toString(format: "EEE, HH:mm")
        self.lblMoonset.text = (dailyWeather.moonset).toDate().toString(format: "EEE, HH:mm")
        
        self.lblHumidity.text = "\(dailyWeather.humidity)%"
        self.lblWindSpeed.text = "\(dailyWeather.windSpeed)m/s"
    }
}

