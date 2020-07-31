//
//  ViewController.swift
//  youtube-onedaybuild
//
//  Created by President Raindas on 21/07/2020.
//  Copyright © 2020 Raindas. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ModelDelegate {
    

    
    @IBOutlet weak var tableView: UITableView!
    
    var model = Model()
    var videos = [Video]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set itself as the datasource and the delegate
        tableView.dataSource = self
        tableView.delegate = self
        
        //set itself as delegate of the model
        model.delegate = self
        
        model.getVideos()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // confirm that a video was selected
        guard tableView.indexPathsForSelectedRows != nil else {
            return
        }
        
        // get a reference to the video that was tappedon
        let selectedVideo = videos[tableView.indexPathForSelectedRow!.row]
        
        // get a reference to the detail of the view controller
        let detailVC = segue.destination as! DetailViewController
        
        // set the video property of the detail view controller
        detailVC.video = selectedVideo
        
    }
    
    //MARK: Model Delegate methods
    
    func videosFetched(_ videos: [Video]) {
        
        // set the returned videos to our video property
        self.videos = videos
        
        //refresh the tableview
        tableView.reloadData()
        
    }
    

    // MARK: TableView Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.VIDEOCELL_ID, for: indexPath) as! videoTableViewCell
        
        // Configure the cell with the data
        
        let video = self.videos[indexPath.row]
        
        cell.setCell(video)
        
        // Return the cell
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }

}

