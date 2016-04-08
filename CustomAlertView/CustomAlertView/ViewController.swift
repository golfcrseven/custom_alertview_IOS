//
//  ViewController.swift
//  CustomAlertView
//
//  Created by Ankit Saini on 4/8/16.
//  Copyright © 2016 Mr_X. All rights reserved.
//

import UIKit

class ViewController: UIViewController, CustomAlertViewDelegate {

    var objCustomAlert:CustomAlertView?
    
    
    @IBAction func btnShowAlert(sender: AnyObject) {
        self.showAlertView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK:- Custom Alert View
    
    func showAlertView() -> Void {
        self.showCustomAlertView("test", uvContainer: self.createContainerView(), dictData: [:])
    }
    
    // Create a custom container view
    func createContainerView() -> UIView {
        let containerView = UIView(frame: CGRectMake(0, 0, 290, 150))
        
        let sampleLabel = UILabel(frame: CGRectMake(0, 0, containerView.frame.width, 30))
        sampleLabel.center = CGPoint(x: containerView.frame.width / 2, y: containerView.frame.height / 2)
        sampleLabel.textAlignment = NSTextAlignment.Center
        sampleLabel.text = "Hello, AlertView!"
        
        containerView.addSubview(sampleLabel)
        containerView.backgroundColor = UIColor.clearColor()
        return containerView
    }

    //MARK:- Create Custom AlertView
    
    func showCustomAlertView(type:String, uvContainer:UIView!, dictData:NSDictionary) -> Void {
        // Create a new AlertView instance
        if objCustomAlert == nil {
            objCustomAlert = CustomAlertView()
        }
        // Set a custom container view
        if uvContainer != nil {
            objCustomAlert!.containerView = uvContainer
        }
        // Set self as the delegate
        objCustomAlert!.delegate = self
        
        // Or, use a closure
        //alertView.onButtonTouchUpInside = { (alertView: CustomAlertView, buttonIndex: Int) -> Void in
        //}
        
        // Set the button titles array
        objCustomAlert!.buttonTitles = ["OK", "Cancel", "Done" ]
        //objCustomAlert!.showCloseButton = false
        objCustomAlert!.alertBGColor = ["#3090C7", "#3090C9"]
        objCustomAlert!.buttonBGColor = ["#93FFE8", "#93FFE8", "#93FFE8"]
        objCustomAlert!.alertButtonDirection = buttonDirection.buttonDirectionVertical
        
        objCustomAlert!.show()
    }
    
    //MARK:- Delegate Methods
    
    // Handle CustomAlertView button touches
    func customAlertViewButtonTouchUpInside(alertView: CustomAlertView, buttonIndex: Int) {
        
        objCustomAlert!.close()
    }
    
}
