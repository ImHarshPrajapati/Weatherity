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
//            image.backgroundColor = UIColor.white
//            image.setDropShadow(color: UIColor.lightGray, opacity: 0.40, offSet: CGSize(width: 0, height: 4), radius: 6)
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
    var weatherViewModel = WeatherViewModel()
    
    // MARK: ViewController LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initAndSetupView()
    }
    
    // MARK: Other Methods
    func initAndSetupView() {
        
        self.lblTimeZone.text = weatherViewModel.weatherModel.timezone ?? "N/A"
        self.lblDate.text = (dailyWeather.dt ?? 0).toDate().toString(format: "EEE dd-MMM, yyyy")
        
        self.lblTempDay.text = StringBase.kDay + ": " + weatherViewModel.getCalculatedTemperature(dailyWeather.temp?.day ?? 0)
        self.lblTempNight.text = StringBase.kNight + ": " + weatherViewModel.getCalculatedTemperature(dailyWeather.temp?.night ?? 0)
        
        self.lblTempUnit.text = weatherViewModel.getTempUnit()
        
        if let weathers = dailyWeather.weather, let weather = weathers.first {
            self.lblWeather.text = weather.main ?? "N/A"
            self.imgWeatherIcon.image = UIImage(named: weather.icon ?? "50d")
            self.lblWeatherDesc.text = weather.weatherDescription ?? "N/A"
        }
        else {
            self.imgWeatherIcon.image = UIImage(named: "50d")
            self.lblWeather.text = "N/A"
            self.lblWeatherDesc.text = "N/A"
        }
        
        self.lblSunrise.text = (dailyWeather.sunrise ?? 0).toDate().toString(format: "EEE, HH:mm")
        self.lblSunset.text = (dailyWeather.sunset ?? 0).toDate().toString(format: "EEE, HH:mm")
        
        self.lblMoonrise.text = (dailyWeather.moonrise ?? 0).toDate().toString(format: "EEE, HH:mm")
        self.lblMoonset.text = (dailyWeather.moonset ?? 0).toDate().toString(format: "EEE, HH:mm")
        
        self.lblHumidity.text = "\(dailyWeather.humidity ?? 0)%"
        self.lblWindSpeed.text = "\(dailyWeather.windSpeed ?? 0)m/s"
    }
}

