//
//  ViewController.swift
//  Stormy
//
//  Created by Brianna Przybysz on 5/21/15.
//  Copyright (c) 2015 MohammadSUsman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private let apiKey = "16f16c228a2eed437ec51c533d550f13"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let baseURL: NSURL! = NSURL(string: "https://api.forecast.io/forecast/\(apiKey)/")
        
        let forecastURL: NSURL!  = NSURL(string: "37.8267,-122.423", relativeToURL: baseURL)
    
        let sharedSession = NSURLSession.sharedSession()
        
        let downloadTask: NSURLSessionDownloadTask = sharedSession.downloadTaskWithURL(forecastURL, completionHandler: {
            (location:NSURL!, response:NSURLResponse!, error:NSError!) -> Void in
           // println(response)
          //var urlContents =  NSString(contentsOfURL: location, encoding: NSUTF8StringEncoding, error: nil)
        //println(urlContents)
            if (error ==  nil){
           let dataObject = NSData(contentsOfURL:location)
            let  weatherDictionary : NSDictionary = NSJSONSerialization.JSONObjectWithData(dataObject!, options: nil, error: nil) as NSDictionary
            
                let currentDataDictionary: NSDictionary = weatherDictionary["currently"] as NSDictionary
                
               // println(currentDataDictionary["apparentTemperature"])
                
                let currentWeather = current(weatherDictionary: weatherDictionary)
                
                println(currentWeather.temperature)
                
                
            }
        })
        downloadTask.resume()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

