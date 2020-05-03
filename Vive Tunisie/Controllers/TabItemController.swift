//
//  TabItemController.swift
//  Vive Tunisie
//
//  Created by Ghazi Tozri on 4/11/20.
//  Copyright © 2020 wimobi. All rights reserved.
//

import UIKit
import SETabView

class ViewController: SEViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // setup the view controllers
        self.setViewControllers()
        
    }
    
    private func setViewControllers() {
        
        // instantiate view controllers
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let firstVC = storyboard.instantiateViewController(withIdentifier: "firstVC")
        let secondVC = storyboard.instantiateViewController(withIdentifier: "secondVC")
        let thirdVC = storyboard.instantiateViewController(withIdentifier: "thirdVC")
        let fourthVC = storyboard.instantiateViewController(withIdentifier: "fourthVC")
        let fifthVC = storyboard.instantiateViewController(withIdentifier: "fifthVC")
        // assign to the viewControllers variable
        self.viewControllers = [firstVC, secondVC, thirdVC, fourthVC, fifthVC]
        
    }

    override func setTabSettings() {
        // customise tab bar colors (always before setting view controllers)
        SETabView.settings.tabColor = UIColor.black
        SETabView.settings.ballColor = UIColor.black
        SETabView.settings.selectedTabTintColor = UIColor.white
        SETabView.settings.unselectedTabTintColor = UIColor.gray
        
        // customise animation duration (always before setting view controllers)
        SETabView.settings.animationDuration = 1.5 // optimal duration = 1.5
    }
    
    override func setAnimationType() {
        self.animationType = .holeBall3 // defaults to .holeBall3
    }

}
