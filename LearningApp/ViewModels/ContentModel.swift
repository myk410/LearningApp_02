//
//  ContentModel.swift
//  LearningApp
//
//  Created by G. Michael Fortin Jr on 12/3/21.
//

import Foundation

class ContentModel: ObservableObject {
    
    // List of modules
    @Published  var modules = [Module]()
    
    // Current module
    @Published var currentModule: Module?
    var currentModuleIndex = 0
    
    var styleData: Data?
    
    init(){
        
        getLocalData()
        
    }
    
    // MARK: - Data methods
    
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
    
    // MARK: - Module navigation methods
    
    func beginModule(_ moduleid:Int) {
        
        // Find the index or this module id
        for index in 0..<modules.count {
            if modules[index].id == moduleid {
                
                // Found the matching module
                currentModuleIndex = index
                break
            }
        }
        
        // Set the current module
        currentModule = modules[currentModuleIndex]
    }
}
