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
    let mockData = ["foo", "bar", "baz"]
    let sampleDataName = "SFCherryBlossomSampleData"
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
            let data = try JSONParser.parse(json: jsonObject)
        } catch {
            print(error)
        }
    }
    
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mockData.count
    }
    
    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = mockData[indexPath.row]
        return cell
    }

}

