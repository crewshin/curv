//
//  ViewController.swift
//  curv
//
//  Created by Gene Crucean on 6/24/15.
//  Copyright (c) 2015 Dagger Dev. All rights reserved.
//

import UIKit
import Charts
import Foundation
import Spring

class ViewController: UIViewController, ChartViewDelegate, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var lineChartView: LineChartView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var baseAmountTextField: UITextField!
    @IBOutlet weak var percentReturnTextField: UITextField!
    @IBOutlet weak var yearsTextField: UITextField!
    var years: [String]!
    var dataArray: [Double]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lineChartView.delegate = self
//        lineChartView.noDataText = "Please enter some values above to calculate a curve."
        lineChartView.noDataText = ""
        
        // Base amount text field.
        baseAmountTextField.layer.cornerRadius = 4.0
        baseAmountTextField.layer.masksToBounds = true
        baseAmountTextField.layer.borderWidth = 1.0
        baseAmountTextField.layer.borderColor = UIColor.whiteColor().CGColor
        baseAmountTextField.textColor = UIColor.whiteColor()
        
        // Percent return text field.
        percentReturnTextField.layer.cornerRadius = 4.0
        percentReturnTextField.layer.masksToBounds = true
        percentReturnTextField.layer.borderWidth = 1.0
        percentReturnTextField.layer.borderColor = UIColor.whiteColor().CGColor
        percentReturnTextField.textColor = UIColor.whiteColor()
        
        // Years text field.
        yearsTextField.layer.cornerRadius = 4.0
        yearsTextField.layer.masksToBounds = true
        yearsTextField.layer.borderWidth = 1.0
        yearsTextField.layer.borderColor = UIColor.whiteColor().CGColor
        yearsTextField.textColor = UIColor.whiteColor()
        
        // Set textfield delegates so we can do 'important' things.
        baseAmountTextField.delegate = self
        percentReturnTextField.delegate = self
        yearsTextField.delegate = self
        
        // When view becomes visible, pop up keyboard on this textfield so it's ready to rock.
        baseAmountTextField.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func goButton(sender: AnyObject) {
        baseAmountTextField.resignFirstResponder()
        percentReturnTextField.resignFirstResponder()
        yearsTextField.resignFirstResponder()
        
        
        if !baseAmountTextField.text.isEmpty && !percentReturnTextField.text.isEmpty && !yearsTextField.text.isEmpty
        {
            self.ripIt()
        }
        else
        {
            var alert = UIAlertController(title: "", message: "Please enter values into all textfields", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }
    
    func ripIt()
    {
        let a = (baseAmountTextField.text as NSString).doubleValue as Double
        let b = (percentReturnTextField.text as NSString).doubleValue as Double
        let c = (yearsTextField.text as NSString).integerValue as Int
        
        dataArray = DataCalculator.calculateCurve(a, percentReturn: b, years: c)
        
        years = []
        for i in 0..<dataArray.count
        {
            years.append("\(i + 1)")
        }
        
        setChart(years, values:dataArray)
        
        tableView.reloadData()
    }
    
    func setChart(dataPoints:[String], values:[Double]) {
        
//        println("dataArray: \(dataArray)")
        
        var dataEntries: [ChartDataEntry] = []
        for i in 0..<dataArray.count {
            let dataEntry = ChartDataEntry(value: values[i], xIndex: i)
            dataEntries.append(dataEntry)
        }
        
        var colors: [UIColor] = []
        for i in 0..<dataArray.count {
            // Random.
//            let red = Double(arc4random_uniform(256))
//            let green = Double(arc4random_uniform(256))
//            let blue = Double(arc4random_uniform(256))
//            let color = UIColor(red: CGFloat(red/255), green: CGFloat(green/255), blue: CGFloat(blue/255), alpha: 1)
            
            let color = UIColor.whiteColor()
            colors.append(color)
        }
        
        
        let lineChartDataSet = LineChartDataSet(yVals: dataEntries, label: "Years")
        let lineChartData = LineChartData(xVals: dataPoints, dataSet: lineChartDataSet)
        
        lineChartDataSet.drawFilledEnabled = true
        lineChartDataSet.fillColor = UIColor.whiteColor()
        lineChartDataSet.fillAlpha = 0.7
        lineChartDataSet.highlightColor = UIColor.whiteColor()
        lineChartDataSet.setColor(UIColor.whiteColor())
        lineChartDataSet.highlightEnabled = false
        
        lineChartDataSet.colors = colors
//        lineChartDataSet.colors = ChartColorTemplates.vordiplom()
        
//        lineChartDataSet.drawCubicEnabled = true
        lineChartDataSet.cubicIntensity = 0.2
        lineChartDataSet.circleRadius = 3.0
        lineChartDataSet.circleColors = [UIColor.whiteColor()]
        lineChartDataSet.drawCirclesEnabled = false
        
//        lineChartView.delegate = self
        lineChartView.data = lineChartData
        
        lineChartView.dragEnabled = true
        lineChartView.pinchZoomEnabled = true
        
        // xAxis.
        lineChartView.xAxis.enabled = false
        lineChartView.xAxis.labelPosition = .Bottom
        lineChartView.xAxis.labelTextColor = UIColor.whiteColor()
//        lineChartView.scaleXEnabled = false
        
        // yAxis
//        lineChartView
//        lineChartView.scaleYEnabled = false
//        lineChartView.yAxis.labelTextColor = UIColor.whiteColor()
        
        // Axis.
        lineChartView.leftAxis.enabled = false
        lineChartView.rightAxis.enabled = false // maybe re-enable once style is set?

        lineChartView.drawGridBackgroundEnabled = false
        lineChartView.drawBordersEnabled = false
        lineChartView.legend.enabled = false
        lineChartView.descriptionText = ""
        
//        lineChartView.animate(xAxisDuration: 0.5)
//        lineChartView.animate(xAxisDuration: 1.0, easingOption: .Linear)
        lineChartView.setNeedsLayout()
        
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        // Advance to the next textfield.
        if (textField === baseAmountTextField)
        {
            percentReturnTextField.becomeFirstResponder()
        }
        else if (textField === percentReturnTextField)
        {
            yearsTextField.becomeFirstResponder()
        }
        else if (textField === yearsTextField)
        {
            yearsTextField.resignFirstResponder()
        }
        
        // Check if the textfields have data.
        if !baseAmountTextField.text.isEmpty && !percentReturnTextField.text.isEmpty && !yearsTextField.text.isEmpty && textField === yearsTextField
        {
            self.ripIt()
        }
        
        return false
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let dataArray = dataArray
        {
            return dataArray.count
        }
        else
        {
            return 0
        }
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("priceCell", forIndexPath: indexPath) as! UITableViewCell
        
        // Format the string into a currency format.
        let numberAsString = Utilities.convertToCurrencyFormat(dataArray[indexPath.row])
        
        // Set text string.
        let txt = "Year \(indexPath.row): \(numberAsString)"
        cell.textLabel?.text = txt
        
        return cell
    }
}

























