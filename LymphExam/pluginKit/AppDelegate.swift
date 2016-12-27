//
//  AppDelegate.swift
//  LymphExam
//
//  Created by ehmo on 2016/12/24.
//  Copyright © 2016年 e-Hmo. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, LaunchScreenDelegate, UITabBarControllerDelegate {

    var window: UIWindow?
    
    func initAppConfig(){
        
        UIApplication.shared.statusBarStyle = UIStatusBarStyle.lightContent
        
        let appTitle = [NSForegroundColorAttributeName:UIColor.black]
        UINavigationBar.appearance().titleTextAttributes = appTitle
        UINavigationBar.appearance().tintColor = UIColor.white
        
        let navBar = UINavigationBar.appearance()
        navBar.barTintColor = UIColor.white
        
        // 用户登录退出通知
        let loginNotification = NotificationCenter.default
        loginNotification.addObserver(self, selector: #selector(initRootViewCtr(_:)), name: NSNotification.Name(rawValue: ExitLoginOut), object: nil)
        loginNotification.addObserver(self, selector: #selector(initRootViewCtr(_:)), name: NSNotification.Name(rawValue: LoginSuccess), object: nil)
        
//        IQKeyboardManager.sharedManager().enable = true
    }


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        initAppConfig()
        
        let launchCtr = LaunchScreenViewCtr()
        launchCtr.delegate = self
        self.window?.rootViewController = launchCtr
        
        
        return true
    }
    
    func launchScreenComplete(){
        self.initRootViewCtr(nil)
    }
    
    func initRootViewCtr(_ notification:Notification?) {
        
        let sandBox = UserDefaults.standard
        
        if notification != nil {
            
            let notiName:String? = notification?.object as! String?
            if notiName == "LoginOut" {
                sandBox.removeObject(forKey: "UserInfo")
            }
            if notiName == "LoginIn" {
                sandBox.set("00000000000", forKey: "UserInfo")
            }
        }
        
        let userInfo = sandBox.value(forKey: "UserInfo")
        
        print("\(userInfo)")
        
        if userInfo != nil
        {
            
            let homeCtr             = HomeTabViewCtr()
            homeCtr.tabBarItem = tabBarItemWith(title: "首页", normalImage: "yiyuan.png", selectImage: "yiyuan-b.png")
            homeCtr.tabBarItem.titlePositionAdjustment = .init(horizontal: 0, vertical: -3.5)
            
            let learnCtr          = LearnTabViewCtr()
            learnCtr.tabBarItem=tabBarItemWith(title: "学习", normalImage: "huanzhe.png", selectImage: "huanzhe-b.png")
            learnCtr.tabBarItem.titlePositionAdjustment = .init(horizontal: 0, vertical: -3.5)
            
            let mineCtr              = MineTabViewCtr()
            mineCtr.tabBarItem=tabBarItemWith(title: "我的", normalImage: "jiance.png", selectImage: "jiance-b.png")
            mineCtr.tabBarItem.titlePositionAdjustment = .init(horizontal: 0, vertical: -3.5)
            
            
            let tabbar = UITabBarController()
            tabbar.viewControllers = [homeCtr,learnCtr,mineCtr]
            tabbar.delegate = self
            tabbar.tabBar.backgroundColor = UIColor.white
            tabbar.tabBar.tintColor = RGB(r: 29, g: 161, b: 243)
            tabbar.tabBar.barTintColor = UIColor.white
            // tabbar.tabBar.barStyle = .black //去掉tabbar上面讨厌的黑线
            
            let rootNavCtr = UINavigationController(rootViewController: tabbar)
            rootNavCtr.isNavigationBarHidden = true
            self.window?.rootViewController = rootNavCtr
            
        }
        else
        {
            let loginCtr = UserLoginViewCtr()
            let loginNav = UINavigationController(rootViewController: loginCtr)
            loginNav.isNavigationBarHidden = true
            self.window?.rootViewController = loginNav
        }
        
    }
    
    // MARK: - 创建UITabBarItem
    func tabBarItemWith(title:String,normalImage:String,selectImage:String)->UITabBarItem{
        let normal_Img = UIImage.init(named: normalImage)?.withRenderingMode(.alwaysOriginal)
        let select_Img = UIImage.init(named: selectImage)?.withRenderingMode(.alwaysOriginal)
        let tabbarItem=UITabBarItem(title: title, image: normal_Img, selectedImage: select_Img)
        return tabbarItem;
    }
    
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

