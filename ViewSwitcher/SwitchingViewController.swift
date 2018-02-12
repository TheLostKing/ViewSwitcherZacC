//
//  SwitchingViewController.swift
//  ViewSwitcher
//
//  Created by Zachary Calderone on 2/12/18.
//  Copyright © 2018 Black Kobold Games. All rights reserved.
//

import UIKit

class SwitchingViewController: UIViewController {
    private var blueViewController: BlueViewController!
    private var yellowViewController: YellowViewController!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        blueViewController = storyboard?.instantiateViewController( withIdentifier: "Blue") as! BlueViewController
        blueViewController.view.frame = view.frame
        switchViewController(from: nil, to: blueViewController) // helper method
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func switchViews(sender: UIBarButtonItem){
        // Create the new view controller, if required
        if yellowViewController?.view.superview == nil {
            if yellowViewController == nil {
                yellowViewController = storyboard?.instantiateViewController( withIdentifier: "Yellow") as! YellowViewController
            }
        } else if blueViewController?.view.superview == nil {
            if blueViewController == nil {
                blueViewController = storyboard?.instantiateViewController( withIdentifier: "Blue") as! BlueViewController
            }
        }
        // Switch view controllers
        if blueViewController != nil && blueViewController!.view.superview != nil {
            yellowViewController.view.frame = view.frame
            switchViewController( from: blueViewController, to: yellowViewController)
        } else {
            blueViewController.view.frame = view.frame
            switchViewController( from: yellowViewController,to: blueViewController)
        }
    }
    
    private func switchViewController( from fromVC:UIViewController?, to toVC:UIViewController?){
        if fromVC != nil {
            fromVC!.willMove( toParentViewController: nil)
            fromVC!.view.removeFromSuperview()
            fromVC!.removeFromParentViewController()
        }
        if toVC != nil {
            self.addChildViewController( toVC!)
            self.view.insertSubview( toVC!.view, at: 0)
            toVC!.didMove( toParentViewController: self)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
