//
//  CacheManager.swift
//  youtube-onedaybuild
//
//  Created by President Raindas on 31/07/2020.
//  Copyright © 2020 Raindas. All rights reserved.
//

import Foundation

class CacheManager {
    
    static var cache = [String:Data]()
    
    static func setVideoCache (_ url:String, _ data:Data?) {
        
        // store the image datat and use the url as the key
        cache[url] = data
        
    }
    
    static func getVideoCache (_ url:String) -> Data? {
        
        // try to get the data for the specified URL
        return cache[url]
        
    }
    
}
