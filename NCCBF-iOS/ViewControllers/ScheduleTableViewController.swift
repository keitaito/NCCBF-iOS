//
//  ScheduleTableViewController.swift
//  NCCBF-iOS
//
//  Created by Keita Ito on 3/22/17.
//  Copyright © 2017 Keita Ito. All rights reserved.
//

import UIKit
import CoreData

class ScheduleTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, NSFetchedResultsControllerDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var dateSegmentedControl: UISegmentedControl!
    
    var context: NSManagedObjectContext?
    var fetchedResultsController: NSFetchedResultsController<Event>?
    var events: [Event]?
    
    let reuseIdentifier = "reuseIdentifier"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initializeFetchedResultsController()
        
        tableView.dataSource = self
        tableView.delegate = self
//        tableView.reloadData()
        
        setupUI()
    }
    
    // MARK: - UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return fetchedResultsController?.sections?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let sections = fetchedResultsController?.sections else {
            fatalError("No sections in fetchedResultsController")
        }
        let sectionInfo = sections[section]
        return sectionInfo.numberOfObjects
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
//        guard let event = events?[indexPath.row] else { fatalError("Failed getting event") }
        guard let event = fetchedResultsController?.object(at: indexPath) else {
            fatalError("Event object is not found.")
        }
        
        cell.textLabel?.text = event.name
        
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let event = fetchedResultsController?.object(at: indexPath) else {
            fatalError("Event object is not found.")
        }
        print(event.name)
        print(event.startAt)
    }
    
    // MARK: - Private Methods
    
    private func setupUI() {
        title = "Schedule"
    }
    
    private func initializeFetchedResultsController() {
        guard let context = context else { fatalError("context is nil.") }
        
        let request: NSFetchRequest<Event> = Event.fetchRequest()
        request.predicate = NSPredicate(from: .apr8, to: .apr9)
        
        let startAtSort = NSSortDescriptor(key: "startAt", ascending: true)
        request.sortDescriptors = [startAtSort]
        
        fetchedResultsController = NSFetchedResultsController(fetchRequest: request, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        fetchedResultsController?.delegate = self
        
        do {
            try fetchedResultsController?.performFetch()
        } catch {
            fatalError("Failed to initialize FetchedResultsController: \(error)")
        }
    }
}
