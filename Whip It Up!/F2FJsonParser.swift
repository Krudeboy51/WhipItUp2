//
//  F2FJsonParser.swift
//  curl
//
//  Created by Kory E King on 11/11/16.
//  Copyright © 2016 Kory E King. All rights reserved.
//

import Foundation
import UIKit

class F2FJsonParser: NSObject {
    
    var numOfItems = 50
    var mReicpeList = [Dictionary<String, String>()]
    var imgList =  Dictionary<String, UIImage>()
    var searchString = ""
    var isDoneParse = true
    
    private func createLink(list: String)->NSURL?{
        
        let urlComp = NSURLComponents(string: mCONSTANTS.mashape.serverLink)
        var linkparams = Dictionary<String, String>()
        linkparams[mCONSTANTS.mashape.linkKeys.query] = list
        linkparams[mCONSTANTS.mashape.linkKeys.num] = "\(numOfItems)"
        
        var query = Array<NSURLQueryItem>()
        
        for (key, value) in linkparams{
            query.append(NSURLQueryItem(name: key, value: value))
        }
        
        urlComp?.queryItems = query
        return urlComp?.URL
    }
    
    private func getJsonFromLink(url: NSURL){
        isDoneParse = false
         var currentItem = Dictionary<String, String>()
         let request = NSMutableURLRequest(URL: url)
         let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
         let task = session.dataTaskWithRequest(request, completionHandler:
            {
                (data, response, error) in
                if let mError = error {
                    print("Mayday we have a problem: \(mError)")
                }else if let _ =  response, let mData = data{
                    var jError: NSError?
                    let parseData = JSON.init(data: mData, options: NSJSONReadingOptions.AllowFragments, error: &jError)
                    let baseURI = parseData[mCONSTANTS.mashape.resultsKey.baseURI].stringValue
                    var counter = 1
                    for item in parseData[mCONSTANTS.mashape.resultsKey.results].arrayValue{
                        if self.mReicpeList.count > counter{
                            counter += 1
                            continue
                        }
                        counter += 1
                        currentItem[mCONSTANTS.mashape.resultsKey.id] = item[mCONSTANTS.mashape.resultsKey.id].stringValue
                        currentItem[mCONSTANTS.mashape.resultsKey.title] = item[mCONSTANTS.mashape.resultsKey.title].stringValue
                        currentItem[mCONSTANTS.mashape.resultsKey.readyMin] = item[mCONSTANTS.mashape.resultsKey.readyMin].stringValue
                        currentItem[mCONSTANTS.mashape.resultsKey.image] = "\(baseURI)\(item[mCONSTANTS.mashape.resultsKey.image].stringValue)"
                        if let url = NSURL(string: currentItem[mCONSTANTS.mashape.resultsKey.image]!){
                            if let data = NSData(contentsOfURL: url){
                                self.imgList[currentItem[mCONSTANTS.mashape.resultsKey.id]!] = UIImage(data: data)
                            }
                        }
                        self.mReicpeList.append(currentItem)
                    }
            }
        }
        )
       
        
        task.resume()
        isDoneParse = true
    }
    
    
    
    func search(list: String){
        searchString = list
        getJsonFromLink(createLink(searchString)!)
    }
    
    //implemental
    
    func loadNextPage(){
        if(numOfItems < 100){
            numOfItems += 25
            search(searchString)
        }
    }
}
