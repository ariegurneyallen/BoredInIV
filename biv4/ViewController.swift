//
//  ViewController.swift
//  biv4
//
//  Created by Skylar Jones on 10/28/15.
//  Copyright (c) 2015 Skylar Jones. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPageViewControllerDataSource  {
    
    struct barInformation{
        var name: String
        var startTime: Int
        var endTime: Int
        }
    
    var topBarHeight: CGFloat!
    
    
    
    var mondayGios: barInformation = barInformation(name: "dd", startTime: 3, endTime: 4)
    var mondayWood: barInformation = barInformation(name: "dd", startTime: 3, endTime: 4)
    var mondaySams: barInformation = barInformation(name: "dd", startTime: 3, endTime: 4)
    var mondayStudyHall: barInformation = barInformation(name: "dd", startTime: 3, endTime: 4)
    var mondayPMH: barInformation = barInformation(name: "dd", startTime: 3, endTime: 4)
    var mondayDublins: barInformation = barInformation(name: "dd", startTime: 3, endTime: 4)

    var tuedayGios: barInformation = barInformation(name: "dd", startTime: 3, endTime: 4)
    var tuedayWood: barInformation = barInformation(name: "dd", startTime: 3, endTime: 4)
    var tuedaySams: barInformation = barInformation(name: "dd", startTime: 3, endTime: 4)
    var tuedayStudyHall: barInformation = barInformation(name: "dd", startTime: 3, endTime: 4)
    var tuedayPMH: barInformation = barInformation(name: "dd", startTime: 3, endTime: 4)
    var tuedayDublins: barInformation = barInformation(name: "dd", startTime: 3, endTime: 4)
    
    
    var pageViewController: UIPageViewController!
    
    var dateString: String!
    
    var font: String!
    
    var imageNames:[String] = ["1", "2","3","4","5","6","7", "8", "9", "10"]
    
     var barNames: [String] = ["Gio's", "Woodstock's", "Sam's To Go", "Study Hall", "Pizza My Heart", "Dublin's"]
    
    
    var pageTitles: [String] = ["SUNDAY", "MONDAY", "TUESDAY", "WEDNESDAY", "THURSDAY", "FRIDAY", "SATURDAY"]

    var monday: [String] = ["Gio's", "Woodstock's", "Sam's To Go", "Study Hall", "Pizza My Heart", "Dublin's"]
    var tuesday: [String] = ["Gio's", "Study Hall", "Pizza My Heart", "Dublins"]
    var wednesday: [String] = ["Study Hall", "Pizza My Heart", "Dublins"]
    var thursday: [String] = ["Gio's","Pizza My Heart", "Dublin's"]
    var friday: [String] = ["Gio's", "Woodstock's", "Pizza My Heart", "Dublin's"]
    var saturday: [String] = ["Study Hall", "Pizza My Heart", "Dublin's"]
    var sunday: [String] = ["Study Hall", "Pizza My Heart", "Dublin's"]
    
    var weekArray = Array<Array<String>>()

    
    var myWeekday: Int!
    
    var myDate: NSDate!
    
    
    var ivTitle: UILabel!
    
    var ivTitleText: UILabel!
    
    var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topBarHeight = self.view.frame.height*3/32
        
        
        self.font = "Avenir Next"
        
        
        print(self.view.frame.height)
        
        let dateStyler = NSDateFormatter()
        dateStyler.dateFormat = "yyyy-MM-dd"
        
        self.myDate = NSDate()
        let calendar = NSCalendar.currentCalendar()
        
        let components = calendar.components([.Day, .Month, .Year], fromDate: self.myDate)
        let month = components.month
        let day = components.day
        
        let myWeekday = NSCalendar.currentCalendar().components(NSCalendarUnit.Weekday, fromDate: self.myDate).weekday
        
        print(myWeekday)
        
        weekArray.append(sunday)
        weekArray.append(monday)
        weekArray.append(tuesday)
        weekArray.append(wednesday)
        weekArray.append(thursday)
        weekArray.append(friday)
        weekArray.append(saturday)
        
        
        self.ivTitle = UILabel(frame: CGRectMake(0, 0, self.view.frame.width, self.topBarHeight))
        self.ivTitle.backgroundColor = UIColor(red: 85/255, green:172/255, blue: 238/255, alpha: 1)
//        self.ivTitle.font = UIFont(name: self.font,
//            size: self.view.frame.width/10)
//        self.ivTitle.textColor = UIColor.whiteColor()
        self.view.addSubview(ivTitle)
        
        
        self.ivTitleText = UILabel(frame: CGRectMake(0, self.view.frame.height*1/64, self.view.frame.width, self.topBarHeight))
        self.ivTitleText.text = "bored in IV"
        self.ivTitleText.font = UIFont(name: self.font, size: (self.view.frame.width + self.view.frame.height)/32)
        self.ivTitleText.textAlignment = NSTextAlignment.Center
        self.ivTitleText.textColor = UIColor.whiteColor()
        self.view.addSubview(ivTitleText)

        
        
        
//        
//        self.button = UIButton(frame: CGRectMake(30, 30, 50, 50))
//        self.button.backgroundColor = UIColor(red: 0, green: 1, blue: 1, alpha: 1)
//        self.button.addTarget(self, action: "buttonAction2:", forControlEvents: UIControlEvents.TouchUpInside)
//        self.view.addSubview(self.button)
        
        
        
        // Mon Tue Wed Thur Fri Sat Sun
        print(NSBundle.mainBundle().infoDictionary!["CFBundleName"] as! String)
        
        if(myWeekday != 1){
            for i in 1...myWeekday-1{
                self.pageTitles.append(self.pageTitles[i-1])
                self.weekArray.append(self.weekArray[i-1])
                }
       
            for i in 1...myWeekday-1{
                self.pageTitles.removeAtIndex(0)
                self.weekArray.removeAtIndex(0)

            }
        }
        
        

        self.pageViewController = self.storyboard?.instantiateViewControllerWithIdentifier("PageViewController") as!
        UIPageViewController
        
        self.pageViewController.dataSource = self
        var startVC = self.viewsControllerAtIndex(0) as ContentViewController
        var viewControllers = NSArray(object: startVC)
        
        self.pageViewController.setViewControllers(viewControllers as! [UIViewController], direction: .Forward, animated: true, completion: nil)
        
    
        self.pageViewController.view.frame = CGRectMake(0, self.topBarHeight, self.view.frame.width, self.view.frame.height)
        
        self.addChildViewController(self.pageViewController)
        
        self.view.addSubview(self.pageViewController.view)
        self.pageViewController.didMoveToParentViewController(self)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //secret button
    
//    func buttonAction2(sender:UIButton!){        
//        let nextViewController = self.storyboard?.instantiateViewControllerWithIdentifier("ViewController2") as ViewController2
//        //self.presentViewController(nextViewController, animated:true, completion:nil)
//        self.navigationController?.pushViewController(nextViewController, animated: true)
//        // self.performSegueWithIdentifier("secret", sender: self)
//        println("dd")
//    }
    
    
    
    
    
    func viewsControllerAtIndex(index: Int) -> ContentViewController
    {
        if ((self.pageTitles.count == 0) || (index >= self.pageTitles.count)){
            return ContentViewController()
        }
        
        
        
        var vc: ContentViewController = self.storyboard?.instantiateViewControllerWithIdentifier("ContentViewController") as! ContentViewController
        
        let i = NSTimeInterval(60*60*24*index)
        let date = NSDate(timeIntervalSinceNow:i)
        let calendar = NSCalendar.currentCalendar()
        
        let components = calendar.components([.Day, .Month, .Year], fromDate: date)
        let month = components.month
        let day = components.day
    
        
        
        self.myWeekday = NSCalendar.currentCalendar().components(NSCalendarUnit.Weekday, fromDate: self.myDate).weekday
        
        
        vc.barNamesString = weekArray[index]

        dateString = components.month.description + "/" + components.day.description

        vc.titleText = self.pageTitles[index] as String
        
        vc.dateText = self.dateString as String
        
        // add top images randomly
        
        vc.imageText = self.imageNames[Int(arc4random_uniform(UInt32(imageNames.count)))] as String
        
        vc.pageIndex = index
        
        return vc
    }
    
    
    
    
    // Page View Controller Data Source
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        
        print("owww")
        var vc = viewController as! ContentViewController
        var index = vc.pageIndex as Int
        
        if(index == 0 || index == NSNotFound)
        {
            return nil
        }
        
        
        index--
        return self.viewsControllerAtIndex(index)
        
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        
        var vc = viewController as! ContentViewController
        var index = vc.pageIndex as Int
        
        if(index == NSNotFound){
            return nil
        }
        
        index++
        
        if(index == self.pageTitles.count){
            return nil
        }
        
        return self.viewsControllerAtIndex(index)
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return self.pageTitles.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }
    



}

