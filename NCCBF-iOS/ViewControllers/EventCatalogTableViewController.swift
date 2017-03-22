//
//  EventCatalogTableViewController.swift
//  NCCBF-iOS
//
//  Created by Keita Ito on 2/15/17.
//  Copyright © 2017 Keita Ito. All rights reserved.
//

import UIKit

class EventCatalogTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    var events = [Event]()
    let sampleDataName = "SFCherryBlossomSampleData2"
    let sampleDataType = "json"
    
    // MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.delegate = self
        tableView.dataSource = self
        do {
            let url = try ResourceLoader.load(resource: sampleDataName, ofType: sampleDataType)
            let jsonData = try Data(contentsOf: url)
            let jsonObject = try JSONSerialization.jsonObject(with: jsonData)
            events = try JSONParser.parse(json: jsonObject)
        } catch {
            print(error)
        }
        
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let indexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let event = events[indexPath.row]
        cell.textLabel?.text = event.name
        return cell
    }
    
    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let event = events[indexPath.row]
        let eventDetails = EventDetailsViewModel(event: event)
        let storyboard = UIStoryboard(name: "EventDetailsViewController", bundle: Bundle.main)
        if let vc = storyboard.instantiateInitialViewController() as? EventDetailsViewController {
            vc.eventDetails = eventDetails
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    // MARK: - Private Methods
    
    private func setupUI() {
        title = "Events"
    }
}

