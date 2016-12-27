//
//  LaunchScreenViewCtr.swift
//  LymphExam
//
//  Created by ehmo on 2016/12/24.
//  Copyright © 2016年 e-Hmo. All rights reserved.
//

import UIKit
@objc protocol LaunchScreenDelegate:NSObjectProtocol{
    func launchScreenComplete()
}

class LaunchScreenViewCtr: UIViewController {

    weak var delegate: LaunchScreenDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let delayTime = DispatchTime.now() + .seconds(1)
        DispatchQueue.main.asyncAfter(deadline: delayTime){
            if self.delegate != nil {
                self.delegate?.launchScreenComplete()
            }
        }
        
        //        self.iconView.layer.setAffineTransform(CGAffineTransform(scaleX: 1,y: 1))
        //        UIView.animate(withDuration: 1.1, delay:0.1 ,options:UIViewAnimationOptions.curveEaseInOut, animations:{()-> Void in
        //            self.iconView.layer.setAffineTransform(CGAffineTransform(scaleX: 6,y: 6))
        //            self.iconView.alpha=0
        //        },completion:{(finished:Bool) -> Void in
        //            if self.delegate != nil {
        //                self.delegate?.launchScreenSuccess()
        //            }
        //        })
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIApplication.shared.setStatusBarHidden(true, with: .none)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        UIApplication.shared.setStatusBarHidden(false, with: .none)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
