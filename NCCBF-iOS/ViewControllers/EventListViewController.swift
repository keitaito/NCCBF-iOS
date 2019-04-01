//
//  EventListViewController.swift
//  NCCBF-iOS
//
//  Created by Keita Ito on 4/1/17.
//  Copyright © 2017 Keita Ito. All rights reserved.
//

import UIKit

class EventListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let events: [Event]
    let tableViewStyle: UITableView.Style
    
    let reuseIdentifier = "reuseIdentifier"

    private var tableView: UITableView {
        return view as! UITableView
    }
    
    init(events: [Event], tableViewStyle: UITableView.Style) {
        self.events = events
        self.tableViewStyle = tableViewStyle
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        self.view = UITableView(frame: view.bounds, style: tableViewStyle)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        let event = events[indexPath.row]
        cell.textLabel?.text = event.name
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let event = events[indexPath.row]
        let eventDetails = EventDetailsViewModel(event: event)
        let vc = UIStoryboard.instantiateViewController(withIdentifier: "EventDetailsViewController") as! EventDetailsViewController
        vc.eventDetails = eventDetails
        navigationController?.pushViewController(vc, animated: true)
    }
}
