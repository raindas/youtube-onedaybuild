//
//  Constants.swift
//  youtube-onedaybuild
//
//  Created by President Raindas on 22/07/2020.
//  Copyright © 2020 Raindas. All rights reserved.
//

import Foundation

struct Constants {
    
    static var API_KEY = ""
    
    static var PLAYLIST_ID = "UU2D6eRvCeMtcF5OGHf1-trw"
    
    static var API_URL = "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(Constants.PLAYLIST_ID)&key=\(Constants.API_KEY)"
    
}
