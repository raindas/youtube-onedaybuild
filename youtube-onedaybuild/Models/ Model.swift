//
//   Model.swift
//  youtube-onedaybuild
//
//  Created by President Raindas on 22/07/2020.
//  Copyright © 2020 Raindas. All rights reserved.
//

import Foundation

protocol ModelDelegate {
    
    func videosFetched(_ videos:[Video])
    
}

class Model {
    
    var delegate:ModelDelegate?
    
    func getVideos() {
        
        //create a URL object
        let url = URL(string: Constants.API_URL)
        
        guard url != nil else {
            return
        }
        // get a URL session object
        let session = URLSession.shared
        
        // get a data task from the URL session object
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            // check if there were any errors
            
            if error != nil || data == nil {
                
                return
                   
            }
            do {
                  
            //Parsing the data into video objects
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            
            let response = try decoder.decode(Response.self, from: data!)
            
                if response.items != nil {
                    
                    DispatchQueue.main.async {
                    
                //call the videos fetched method of the delegate
                    self.delegate?.videosFetched(response.items!)
                    
                    }
                    
                }
                
                // print(response)
            }
            catch {
               
                
            }
            
        }
        
        // kick off the task
        dataTask.resume()
        
    }
    
}
