//
//  ContentModel.swift
//  LearningApp
//
//  Created by G. Michael Fortin Jr on 12/3/21.
//

import Foundation

class ContentModel: ObservableObject {
    
    @Published  var modules = [Module]()
    
    var styleData: Data?
    
    init(){
        
        getLocalData()
        
    }
    
    func getLocalData(){
        
        // Get a URL to the JSON file
        let jsonUrl = Bundle.main.url(forResource: "data", withExtension: "json")
        
        // Read the file into a data object
        do{
            let jsonData = try Data(contentsOf: jsonUrl!)
            
            // Try to decode the JSON into an array of modules
            let jsonDecoder = JSONDecoder()
            
            do{
                let modules = try jsonDecoder.decode([Module].self, from: jsonData)
                self.modules = modules
            }
            catch{
                 
            }
        }
        catch{
            // TODO log error
            print("Couldn't parse local data")
        }
        
        // Parse the style data
        let styleUrl = Bundle.main.url(forResource: "style", withExtension: "html")
        
        do{
            
            // Read the file into a data object
            let styleData = try Data(contentsOf: styleUrl!)
            self.styleData = styleData 
            
        }
        catch{
            // Log error
            print("Couldn't parse style data")
        }
        
         
    }
    
}
