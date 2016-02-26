//
//  ContentViewController.swift
//  biv4
//
//  Created by Skylar Jones on 10/28/15.
//  Copyright (c) 2015 Skylar Jones. All rights reserved.
//



import UIKit

class ContentViewController: UIViewController, UIScrollViewDelegate {

    
    var dayInWeek: UILabel!
    
    var pageIndex: Int!
    
    var titleText: String!
    
    var blurEffect: UIBlurEffect!
    
    var blurEffectView: UIVisualEffectView!
    
    var imageText: String!
    
    var dateText: String!
    var redBanner: UIImageView!
    var date: UILabel!
    
    var barNamesString:[String]!
    
    var returnButton:UIButton!
    
    var holderButton:UIButton!
    
    var buttons:[UIButton]!
    
    var popUp: UIImageView!
    
    var w: UIImageView!
    
    var popUpGo: Bool!
    
    var availableSwitch: UISwitch!
    
    var pageHeight: CGFloat!
    
    var font: String!
    
    

    
    
    
    var scrollView: UIScrollView!
    

    
    @IBOutlet weak var containerView: UIView!
    
    override func viewDidLoad() {
        
        
        
       super.viewDidLoad()
        
        self.font = "Avenir Next"
        
        
    
        
       self.popUpGo = false
        
        self.pageHeight = self.view.frame.height
    
        buttons = Array<UIButton>()
        
     
        
        //top blurred image or red banner
      
        
        self.redBanner = UIImageView(frame: CGRectMake(0, 0, self.view.frame.width, self.view.frame.height*10/32))
        
        self.redBanner.image = UIImage(named: self.imageText)
        //self.redBanner.backgroundColor = UIColor(red: 242/255, green:55/255, blue: 87/255, alpha: 1)
        self.view.addSubview(self.redBanner)
        
        
        //add blur effect
        
//        self.blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Light)
//        
//        self.blurEffectView = UIVisualEffectView(effect: blurEffect)
//        self.blurEffectView.backgroundColor = UIColor(red: 0/255, green: 255/255, blue: 255/255, alpha: 0.1)
//        self.blurEffectView.frame = self.redBanner.frame
//        //        self.blurEffectView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight] // for supporting device rotation
//        self.view.addSubview(self.blurEffectView)
        //date label 10/19
        
        self.date = UILabel(frame: CGRectMake(0, self.view.frame.height/6.5, self.view.frame.width, self.view.frame.width/6))
        self.date.backgroundColor = UIColor.clearColor()
        self.date.textAlignment = NSTextAlignment.Center
        self.date.font = UIFont(name: self.font,
            size: self.view.frame.width/6)
        
        self.date.textColor = UIColor.whiteColor()
        self.date.text = self.dateText
        //self.date.sizeToFit()
        self.view.addSubview(self.date)
        
        //day in week label mon tue wed
        
        self.dayInWeek = UILabel(frame: CGRectMake(0, self.view.frame.height/11, self.view.frame.width, self.view.frame.width/7))
        self.dayInWeek.backgroundColor = UIColor.clearColor()
        self.dayInWeek.textAlignment = NSTextAlignment.Center
        self.dayInWeek.font = UIFont(name: self.font,
            size: self.view.frame.width/10)
        self.dayInWeek.textColor = UIColor.whiteColor()
        self.dayInWeek.text = self.titleText
        //self.dayInWeek.sizeToFit()
        
        self.view.addSubview(self.dayInWeek)
        
        
        //add scroll view
        
        let b = CGFloat(barNamesString.count)
        
        
        self.scrollView = UIScrollView(frame: CGRectMake(0, self.view.frame.height*10/32, self.view.frame.width, self.view.frame.height*19/32))
        self.scrollView.delegate = self
        self.scrollView.backgroundColor = UIColor.lightGrayColor()
        self.scrollView.contentSize = CGSizeMake(self.view.frame.width,b*self.view.frame.height/8 + self.view.frame.height/2)
    
        self.view.addSubview(self.scrollView)
        
      
       
        //make return button
        
        
        self.returnButton   = UIButton() as UIButton
        self.returnButton.frame = CGRectMake(0, 0 , 0, 0)
        self.returnButton.backgroundColor = UIColor(red: 0/255, green:255/255, blue: 255/255, alpha: 0)
        self.returnButton.addTarget(self, action: "closePop:", forControlEvents: UIControlEvents.TouchUpInside)

        self.scrollView.addSubview(self.returnButton)
        
        
        
        
        
        //add switch
        
//        self.availableSwitch = UISwitch(frame: CGRectMake(self.view.frame.width*3/4, self.view.frame.height*1/8, 0, 0))
//        self.availableSwitch.on = true
//        self.availableSwitch.setOn(true, animated: false)
//        self.availableSwitch.addTarget(self, action: "switchValueDidChange:", forControlEvents: .ValueChanged)
//        self.view.addSubview(self.availableSwitch)
        
        
        
        // add buttons to scroll wheel
        makeButtons()
        
        

        
        //pop up label
        self.popUp = UIImageView()
        self.popUp.backgroundColor = UIColor.redColor()
        self.scrollView.addSubview(self.popUp)
        self.view.bringSubviewToFront(self.popUp)
        //self.scrollView.autoresizesSubviews = false
        
   

        
        
        // add
        self.w = UIImageView(frame: CGRectMake(0, -self.view.frame.height/4.5,
            self.view.frame.width/20, self.view.frame.width/20))
        self.w.image = UIImage(named: "mj")
        self.scrollView.addSubview(self.w)
        self.view.bringSubviewToFront(self.w)

    }
    
//    func switchValueDidChange(sender:UISwitch!){
//        if(sender.on == true){
//            for i in buttons{
//                i.removeFromSuperview()
//            }
//            buttons = Array<UIButton>()
//            
//            self.barNamesString.append("dd")
//            
//            makeButtons()
//        }
//        else{
//            for i in buttons{
//                i.removeFromSuperview()
//            }
//            buttons = Array<UIButton>()
//            
//            makeButtons()
//        }
//    }
    
  
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        if(scrollView.contentOffset.y<0){
            scrollView.setContentOffset(CGPoint(x: 0,y: 0), animated: false)
        }
    }
    
    
    
    
    
    
    
    func closePop(sender:UIButton!){
        self.returnButton.frame = CGRectMake(0, 0 , 0, 0)

        UIView.animateWithDuration(NSTimeInterval(0.5),  delay: NSTimeInterval(0), usingSpringWithDamping: CGFloat(1), initialSpringVelocity: CGFloat(0), options: UIViewAnimationOptions.AllowAnimatedContent,
                        animations:{
                            self.scrollView.contentOffset = CGPoint(x: 0, y: 0)
                            self.popUp.frame = CGRectMake(0, self.holderButton.frame.maxY, self.view.frame.width, 0)
                            self.holderButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
                            self.holderButton.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
                        },
                        completion: {finished in
                            self.popUpGo = false
        
                    })
                    
                    
        

    }
    
    func buttonAction(sender:UIButton!)
    {
        

        
        if(self.popUpGo == false){
        self.popUp.frame = CGRectMake(0, sender.frame.maxY, self.view.frame.width, 0)
        let string2 = sender.currentTitle!
            


        print(string2)
        let string = "\(string2)\(self.titleText[self.titleText.startIndex])"
        print(string)
        self.popUp.image = UIImage(named: "menu")
        self.scrollView.bringSubviewToFront(self.popUp)
        self.scrollView.bringSubviewToFront(self.returnButton)
        self.returnButton.frame = CGRectMake(0, 0 , self.view.frame.width, self.scrollView.frame.height)
        self.holderButton = sender


        UIView.animateWithDuration(NSTimeInterval(0.5), delay: NSTimeInterval(0),
            usingSpringWithDamping: CGFloat(0.5), initialSpringVelocity: CGFloat(0),
            options:  UIViewAnimationOptions.AllowAnimatedContent,
            animations:{
            
            
    

            sender.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
            sender.backgroundColor = UIColor(red: 59/255, green: 53/255, blue: 97/255, alpha: 1)
                
            self.scrollView.contentOffset = CGPoint(x: 0, y: sender.frame.minY)
            self.popUp.frame = CGRectMake(0, sender.frame.maxY, self.view.frame.width, self.view.frame.height/2)
            
         
                
                        },
            completion: {finished in
                self.popUpGo = true
                
            }
        )
        }
     }
    
    func makeButtons(){
        
        var a = CGFloat(0)
        
        for i in barNamesString{
            let button   = UIButton() as UIButton
            button.frame = CGRectMake(0, self.pageHeight * a/9 + a, self.view.frame.width, self.pageHeight/9)
            button.backgroundColor = UIColor(red: 255/255, green:255/255, blue: 255/255, alpha: 1)
            button.layer.borderWidth = 0
            button.titleLabel!.font = UIFont(name: self.font,
                size: self.view.frame.width/15)
            
           
            //button.layer.cornerRadius = 0.01 * button.bounds.size.width
            button.layer.borderColor = UIColor(red: 255/255, green:255/255, blue: 255/255, alpha: 1).CGColor
            button.setTitle(i, forState: UIControlState.Normal)
            button.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
            button.addTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
            self.scrollView.addSubview(button)
            
            a=a+1
            self.buttons.append(button)
            
        }
    
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
