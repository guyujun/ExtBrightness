//
//  SliderView.swift
//  ExtBrightness
//
//  Created by liuzikai on 2018/7/23.
//  Copyright © 2018 liuzikai. All rights reserved.
//

import Cocoa

class SliderView: NSViewController {

    @IBOutlet weak var slider: NSSlider!
    @IBOutlet weak var sliderValueLabel: NSTextField!
    @IBOutlet weak var screenName: NSTextField!
    
//    weak var menuItem: NSMenuItem!
    
    var displayController: DisplayController!
    
    override func loadView() {
        super.loadView()
        
        slider.maxValue = 1.0
        slider.doubleValue = displayController.brightness
        sliderValueLabel.stringValue = String(Int(slider.doubleValue * 100))
        
        screenName.stringValue = displayController.screenName ?? "Unknown display"
    }
    
    @IBAction func sliderChanged(_ sender: Any) {
        sliderValueLabel.stringValue = String(Int(slider.doubleValue * 100))
        if (!displayController.setBrightness(slider.doubleValue)) {
            // If fail to set brightness, reload brightness value to the slider
            slider.doubleValue = displayController.brightness
        }
    }
}
