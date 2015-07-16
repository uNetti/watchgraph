//
//  InterfaceController.swift
//  watchgraph WatchKit Extension
//
//  Created by Lars Kinnunen on 16/07/15.
//  Copyright © 2015 Unetti Ltd. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    var demoTimer: NSTimer!
    var demoIsOn = false
    var demoTempo: NSTimeInterval = 60
    var items: [Int]! = [Int](count: 20, repeatedValue: 0)
    var images: [String]! = nil
    
    var currentIndex = 0
    
    @IBOutlet var row0: WKInterfaceImage!
    @IBOutlet var row1: WKInterfaceImage!
    @IBOutlet var row2: WKInterfaceImage!
    @IBOutlet var row3: WKInterfaceImage!
    @IBOutlet var row4: WKInterfaceImage!
    @IBOutlet var row5: WKInterfaceImage!
    @IBOutlet var row6: WKInterfaceImage!
    @IBOutlet var row7: WKInterfaceImage!
    @IBOutlet var row8: WKInterfaceImage!
    @IBOutlet var row9: WKInterfaceImage!
    @IBOutlet var row10: WKInterfaceImage!
    @IBOutlet var row11: WKInterfaceImage!
    @IBOutlet var row12: WKInterfaceImage!
    @IBOutlet var row13: WKInterfaceImage!
    @IBOutlet var row14: WKInterfaceImage!
    @IBOutlet var row15: WKInterfaceImage!
    @IBOutlet var row16: WKInterfaceImage!
    @IBOutlet var row17: WKInterfaceImage!
    @IBOutlet var row18: WKInterfaceImage!
    @IBOutlet var row19: WKInterfaceImage!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        images = (0...61).map {
            "img-tuner-dot\($0).png"
        }
        currentIndex = Int(arc4random_uniform(60))
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
        
        demoIsOn = false
        // Stop the timer.
        demoTimer?.invalidate()
    }

    @IBAction func onStartButton() {
        if (demoIsOn)
        {
            print("stop")
            demoIsOn = false
            // Stop the timer.
            demoTimer?.invalidate()
        }
        else
        {
            print("start")
            demoIsOn = true
            // Start the timer.
            let demoTimeInterval:NSTimeInterval = 2.0 / demoTempo
            demoTimer = NSTimer.scheduledTimerWithTimeInterval(demoTimeInterval, target: self, selector: Selector("demoGraph"), userInfo: nil, repeats: true)
            demoTimer?.fire()
        }
    }
    
    func demoGraph() {
        for index in lazy(1...19).reverse() {
            self.items[index] = self.items[index-1]
        }
        self.items[0] = currentIndex
        currentIndex = currentIndex + 1
        if (currentIndex > 60) { currentIndex = 1 }
        updateRows()
    }
    
    func updateRows()
    {
        row0.setImageNamed(self.images[self.items[0]])
        row1.setImageNamed(self.images[self.items[1]])
        row2.setImageNamed(self.images[self.items[2]])
        row3.setImageNamed(self.images[self.items[3]])
        row4.setImageNamed(self.images[self.items[4]])
        row5.setImageNamed(self.images[self.items[5]])
        row6.setImageNamed(self.images[self.items[6]])
        row7.setImageNamed(self.images[self.items[7]])
        row8.setImageNamed(self.images[self.items[8]])
        row9.setImageNamed(self.images[self.items[9]])
        row10.setImageNamed(self.images[self.items[10]])
        row11.setImageNamed(self.images[self.items[11]])
        row12.setImageNamed(self.images[self.items[12]])
        row13.setImageNamed(self.images[self.items[13]])
        row14.setImageNamed(self.images[self.items[14]])
        row15.setImageNamed(self.images[self.items[15]])
        row16.setImageNamed(self.images[self.items[16]])
        row17.setImageNamed(self.images[self.items[17]])
        row18.setImageNamed(self.images[self.items[18]])
        row19.setImageNamed(self.images[self.items[19]])
    }
}
