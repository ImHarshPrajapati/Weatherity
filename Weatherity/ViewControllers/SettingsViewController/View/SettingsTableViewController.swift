//
//  SettingsViewController.swift
//  Weatherity
//
//  Created by Harsh on 29/01/2022.
//

import UIKit

protocol SettingsTableViewControllerDelegate: AnyObject {
    func refreshTempUnit()
}

class SettingsTableViewController: UITableViewController {
    
    //MARK: - Properties
    @IBOutlet weak var segmentTempUnits: UISegmentedControl!
    
    weak var delegate: SettingsTableViewControllerDelegate?

    var settingsViewModel = SettingsViewModel()
    
    // MARK: ViewController LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        segmentTempUnits.selectedSegmentIndex = settingsViewModel.getSelectedTempUnit()
        
    }
    
    
    //MARK: - UIButton Action
    @IBAction func btnCloseAction(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    //MARK: - UISegmentedControl Action
    @IBAction func segmentTempUnitsAction(_ sender: UISegmentedControl) {
        settingsViewModel.changeTemperatureUnit(sender.selectedSegmentIndex)
        delegate?.refreshTempUnit()
    }
}
