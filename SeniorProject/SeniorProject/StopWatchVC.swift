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

class StopWatchVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var fakeSubmit: UIButton!
    @IBOutlet weak var realSubmit: UIButton!
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var athletesNameTextfield: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var lapBtn: UIButton!
    
    //stop watch
    weak var timer: Timer?
    var startTime: Double = 0
    var time: Double = 0
    var time1: Double = 0
    var startTime1: Double = 0
    var timeChange: Double = 0
    var lapTime: Double = 0
    var elapsed: Double = 0
    var status: Bool = false
    
    var timeString = [String]()
    
    
    @IBOutlet weak var labelMinute: UILabel!
    @IBOutlet weak var labelSecond: UILabel!
    @IBOutlet weak var labelMillisecond: UILabel!
    @IBOutlet weak var resetBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        tableView.dataSource = self
        tableView.delegate = self
        
        // Do any additional setup after loading the view.
        pickerView.delegate = self
        pickerView.dataSource = self
        resetBtn.isEnabled = false
        lapBtn.isHidden = true
        realSubmit.isHidden = true
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return timeString.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "stopCell", for: indexPath) as! stopwatchCell
        
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.font = UIFont(name:"Avenir", size:30)
        cell.textLabel?.text = "\(timeString[indexPath.row])"
        return cell
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
        timeString.removeAll()
        let strReset = String("00")
        labelMinute.text = strReset
        labelSecond.text = strReset
        labelMillisecond.text = strReset
        self.counterNumbers = 0
        lapBtn.isHidden = false
        lapBtn.isHidden = true
        fakeSubmit.isHidden = false
        realSubmit.isHidden = true
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
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
    let races = ["100m","200m","400m","800m","1500m","1600m","3200m"]
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

        // elapsed part
        let currentState = f1 + ":" + f2 + "." + f3
        timeString.append(currentState)
        print(timeString)
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    //submit stuff
    @IBAction func submitBtn(_ sender: Any) {
        SVProgressHUD.showSuccess(withStatus: "Data Sent")
        var try1 = races[pickerView.selectedRow(inComponent: 0)]
        var listOfTimes: String = ""
        let f11 = labelMinute.text!
        let f21 = labelSecond.text!
        let f31 = labelMillisecond.text!
        var currentState1 = f11 + ":" + f21 + "." + f31
        var times = ""
        for time1 in timeString {
            print("I don't live on \(time1).")
            times += " \(time1),"
        }
        let f12 = labelMinute.text!
        let f22 = labelSecond.text!
        let f32 = labelMillisecond.text!
        let currentState2 = f12 + ":" + f22 + "." + f32
        times += " \(currentState2)"
        print(times)

        //----------___------------
        let today = NSDate()
        let nextDate = Calendar.current.date(byAdding: .day, value: -1, to: today as Date)
        //let date = NSDate()
        
        let dateString = "\(nextDate)"
        print("THIS BISH")
        
        let dateParts = dateString.split(separator: " ")
        print(dateParts)
        let RealDate = dateParts[0]
        print(RealDate)
        let weirdFormat = RealDate.split(separator: "(")
        let parts = weirdFormat.last!
        let daysParts = parts.split(separator: "-")
        let year = daysParts[0]
        let month = daysParts[1]
        let day = daysParts.last!
        print("\(month)-\(day)-\(year)")
        let finalDate = month + "/" + day + "/" + year
        print(finalDate)
        //--------------------------
        
        let object = PFObject (className: "records")
            object["name"] = athletesNameTextfield.text!
            object["date"] = finalDate
            object["time"] = times//listOfTimes
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
        resetBtn.isEnabled = true
        timer?.invalidate()
        startTime = 0
        time = 0
        elapsed = 0
        timeString.removeAll()
        status = false
        let strReset = String("00")
        labelMinute.text = strReset
        labelSecond.text = strReset
        labelMillisecond.text = strReset
        self.counterNumbers = 0
        athletesNameTextfield.text = ""
        lapBtn.isHidden = false
        lapBtn.isHidden = true
        fakeSubmit.isHidden = false
        realSubmit.isHidden = true
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { // Change `2.0` to the desired number
            SVProgressHUD.dismiss()
        }
    }
}
