//
//  EventCatalogTableViewController.swift
//  NCCBF-iOS
//
//  Created by Keita Ito on 2/15/17.
//  Copyright © 2017 Keita Ito. All rights reserved.
//

import UIKit
import CoreData

class EventCatalogTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, NSFetchedResultsControllerDelegate {
    
    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    var context: NSManagedObjectContext?
    var fetchedResultsController: NSFetchedResultsController<Event>?
    
    // MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        initializeFetchedResultsController()
        setupTableView()
        setupUI()
        
        do {
            try fetchedResultsController?.performFetch()
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let indexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetchedResultsController?.sections?[section].numberOfObjects ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
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
        let eventDetails = EventDetailsViewModel(event: event)
        let storyboard = UIStoryboard(name: "EventDetailsViewController", bundle: Bundle.main)
        if let vc = storyboard.instantiateInitialViewController() as? EventDetailsViewController {
            vc.eventDetails = eventDetails
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    // MARK: - Private Methods
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func setupUI() {
        title = "Events"
    }
    
    private func initializeFetchedResultsController() {
        guard let context = context else { fatalError("context is nil.") }
        let request: NSFetchRequest<Event> = Event.fetchRequest()
        let idSort = NSSortDescriptor(key: "id", ascending: true)
        request.sortDescriptors = [idSort]
        
        fetchedResultsController = NSFetchedResultsController(fetchRequest: request, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        fetchedResultsController?.delegate = self
    }
}

