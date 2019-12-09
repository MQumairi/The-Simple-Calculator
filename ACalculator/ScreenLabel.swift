//  ScreenLabel.swift
//  ACalculator
//  Created by Mohammed Alqumairi on 12/8/19.
//  Copyright © 2019 Mohammed Alqumairi. All rights reserved.

import Foundation

class ScreenLabel {
    
    var screenChars: [String] = []
    var size = 0
    var screenString = String(0)
    var screenNumb = 0.0
    
    init() {
    }
    
    //Appends to ScreenArray
    func addToScreenArray (numb : Double) {
        
    if (size <= 8) {
            screenChars.append(String(numb))
            incrementSize()
        }
        
        else {
            print("Too many inputted numbers!")
        }
        
        screenArrayToString()
    }
    
    func addToCharArray (str : String) {
        screenChars.append(str)
    }
    
    //Clears the Array
    func clearLabel() {
        screenChars.removeAll()
        size = 0
        screenString = String(0)
        screenNumb = 0;
    }
    
    //Converts the ScreenArray to a single number represented as String
    func screenArrayToString() {
        
        if(size == 0) {
            screenString = String(0)
        }
            
        else {
            
            for i in screenChars.indices {
                
                if (screenChars[i].hasSuffix(".0")) {
                    screenChars[i].remove(at: screenChars[i].index(before: screenChars[i].endIndex))
                    screenChars[i].remove(at: screenChars[i].index(before: screenChars[i].endIndex))
                }
                
                print("NUMB === " + String(screenChars[i]))
            }

            
            print(screenChars)
            
            //Conveert the screenChars into a single String
            screenString = screenChars.joined()
            print("SCREENSTRING === " + screenString)

            
        }
        
    }
    
    //Converts ScreenString to ScreenNumb
    func screenArrayStringToNumb() -> Double {
        screenNumb = Double(screenString) ?? 0
        return screenNumb
    }
    
    
    func incrementSize() {
        size += 1
        print("Size is now: " + String(size))
    }
    
    
    func getSize() -> Int {
        return size;
    }
    
    func getArray() -> [String] {
        return screenChars
    }
    
    
    func getScreenString() -> String {
        return screenString
    }
    
    func getScreenNumb() -> Double {
        return screenNumb
    }
    
    func getCharArray() -> [String]{
        return screenChars
    }
    
}
