//
//  StopWatchVC.swift
//  SeniorProject
//
//  Created by Mitchell Petellin on 4/3/19.
//  Copyright © 2019 Mitchell Petellin. All rights reserved.
//

import UIKit
import Parse
import SVProgressHUD

class StopWatchVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var fakeSubmit: UIButton!
    @IBOutlet weak var realSubmit: UIButton!
    @IBOutlet weak var startButton: UIButton!
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var athletesNameTextfield: UITextField!
    
    //lap display
    @IBOutlet weak var lap1: UILabel!
    @IBOutlet weak var lap2: UILabel!
    @IBOutlet weak var lap3: UILabel!
    @IBOutlet weak var lap4: UILabel!
    @IBOutlet weak var lapBtn: UIButton!
    
    //stop watch
    weak var timer: Timer?
    var startTime: Double = 0
    var time: Double = 0
    var elapsed: Double = 0
    var status: Bool = false
    
    @IBOutlet weak var labelMinute: UILabel!
    @IBOutlet weak var labelSecond: UILabel!
    @IBOutlet weak var labelMillisecond: UILabel!
    @IBOutlet weak var resetBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        lap1.isHidden = true
        lap2.isHidden = true
        lap3.isHidden = true
        lap4.isHidden = true
        lap1.text = ""
        lap2.text = ""
        lap3.text = ""
        lap4.text = ""
        
        // Do any additional setup after loading the view.
        pickerView.delegate = self
        pickerView.dataSource = self
        resetBtn.isEnabled = false
        lapBtn.isHidden = true
        realSubmit.isHidden = true
    }

    @IBAction func toggleStartStop(_ sender: UIButton!) {
        if (status) {
            stop()
            sender.setTitle("Start", for: .normal)
            resetBtn.isEnabled = true
            realSubmit.isHidden = false
            fakeSubmit.isHidden = true
        } else {
            start()
            sender.setTitle("Stop", for: .normal)
            resetBtn.isEnabled = false
            lapBtn.isHidden = false
            //fakeSubmit.isHidden = true
            
        }
        
        
    }
    @IBAction func resetBtn(_ sender: Any) {
        timer?.invalidate()
        startTime = 0
        time = 0
        elapsed = 0
        status = false
        let strReset = String("00")
        labelMinute.text = strReset
        labelSecond.text = strReset
        labelMillisecond.text = strReset
        self.counterNumbers = 0
        lap1.isHidden = true
        lap2.isHidden = true
        lap3.isHidden = true
        lap4.isHidden = true
        lapBtn.isHidden = false
        lap1.text = ""
        lap2.text = ""
        lap3.text = ""
        lap4.text = ""
        lapBtn.isHidden = true
        fakeSubmit.isHidden = false
        realSubmit.isHidden = true
    }
    
    func start() {
        startTime = Date().timeIntervalSinceReferenceDate - elapsed
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        status = true
    }
    
    func stop() {
        elapsed = Date().timeIntervalSinceReferenceDate - startTime
        timer?.invalidate()
        status = false
    }
    
    
    
    @objc func updateCounter() {
        time = Date().timeIntervalSinceReferenceDate - startTime
        
        let minutes = UInt8(time / 60.0)
        time -= (TimeInterval(minutes) * 60)
        
        let seconds = UInt8(time)
        time -= TimeInterval(seconds)
        
        let milliseconds = UInt8(time * 100)
        
        let strMinutes = String(format: "%02d", minutes)
        let strSeconds = String(format: "%02d", seconds)
        let strMilliseconds =  String(format: "%02d", milliseconds)
        labelMinute.text = strMinutes
        labelSecond.text = strSeconds
        labelMillisecond.text = strMilliseconds
    }
    
    //picker stuff
    let races = ["100m","200m","400m","800m","1600m"]
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return races.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        //pickerView.textColor = [UIColor, white];
        return races[row]
    }
    //lap stuff
    var counterNumbers : Int = 0
    @IBAction func lapBtn(_ sender: Any) {
        
        
        let f1 = labelMinute.text!
        let f2 = labelSecond.text!
        let f3 = labelMillisecond.text!
        
        //print(f1)
        //print(f2)
        //print(f3)
        let currentState = f1 + ":" + f2 + "." + f3
        
        self.counterNumbers += 1
        if self.counterNumbers == 1 {
            self.lap1.isHidden = false
            lap1.text = currentState
        }
        if self.counterNumbers == 2 {
            self.lap2.isHidden = false
            lap2.text = currentState
        }
        if self.counterNumbers == 3 {
            self.lap3.isHidden = false
            lap3.text = currentState
        }
        if self.counterNumbers == 4 {
            self.lap4.isHidden = false
            lap4.text = currentState
            lapBtn.isHidden = true
            stop()
            resetBtn.isEnabled = true
        }
        fakeSubmit.isHidden = true
        realSubmit.isHidden = false
    }
    //submit stuff
    
    var dateString: String = ""
    @IBAction func submitBtn(_ sender: Any) {
        
        
        
        SVProgressHUD.showSuccess(withStatus: "Data Sent")
        var try1 = races[pickerView.selectedRow(inComponent: 0)]
        var listOfTimes: String = ""
        let f11 = labelMinute.text!
        let f21 = labelSecond.text!
        let f31 = labelMillisecond.text!
        var currentState1 = f11 + ":" + f21 + "." + f31
        
        
        let l1: String = lap1.text!
        let l2: String = lap2.text!
        let l3: String = lap3.text!
        let l4: String = lap4.text!
        
        if lap1.text! != "" {
            listOfTimes += l1
        }
        if lap2.text! != "" {
            listOfTimes += ", " + l2
        }
        if lap3.text! != "" {
            listOfTimes += ", " + l3
        }
        if lap4.text! != "" {
            listOfTimes += ", " + l4
        }
        
        //----------___------------
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd HH:mm:ss"
        print(dateFormatterGet)
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "MMM dd, yyyy"
        print(dateFormatterPrint)
        if let date = dateFormatterGet.date(from: "2019-04-29 12:24:26") {
            dateString = dateFormatterPrint.string(from: date)
            //print(dateFormatterPrint.string(from: date))
            //print(dateString)
        } else {
            print("There was an error decoding the string")
        }
        print(dateString)
        //--------------------------
        let object = PFObject (className: "records")
            object["name"] = athletesNameTextfield.text!
            object["date"] = dateString
            object["time"] = listOfTimes
            object["total"] = currentState1
            object["distance"] = try1
            object.saveInBackground { (success, error1) in
                if success {
                    print("sent")
                } else {
                    print(error1 as Any)
                }
            }

        stop()
        //startButton.text = "Start"
        startButton.setTitle("Start", for: UIControl.State.normal)
        resetBtn.isEnabled = true
        timer?.invalidate()
        startTime = 0
        time = 0
        elapsed = 0
        status = false
        
        
        let strReset = String("00")
        labelMinute.text = strReset
        labelSecond.text = strReset
        labelMillisecond.text = strReset
        self.counterNumbers = 0
        athletesNameTextfield.text = ""
        lap1.isHidden = true
        lap2.isHidden = true
        lap3.isHidden = true
        lap4.isHidden = true
        lapBtn.isHidden = false
        lap1.text = ""
        lap2.text = ""
        lap3.text = ""
        lap4.text = ""
        lapBtn.isHidden = true
        fakeSubmit.isHidden = false
        realSubmit.isHidden = true

        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { // Change `2.0` to the desired number
            SVProgressHUD.dismiss()
        }
//
//
//
    }
}
