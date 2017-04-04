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
            print(error)
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
        let cell = tableView.dequeueReusableCell(withIdentifier: EventCatalogTableViewCell.ReuseIdentifier, for: indexPath) as! EventCatalogTableViewCell
        guard let event = fetchedResultsController?.object(at: indexPath) else { return cell }
        cell.configure(with: event)
        return cell
    }
    
    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let event = fetchedResultsController?.object(at: indexPath) else { return }
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
        guard let context = context else { return }
        let request: NSFetchRequest<Event> = Event.fetchRequest()
        let idSort = NSSortDescriptor(key: "id", ascending: true)
        request.sortDescriptors = [idSort]
        
        fetchedResultsController = NSFetchedResultsController(fetchRequest: request, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        fetchedResultsController?.delegate = self
    }
}

//import Alamofire
//
//extension EventCatalogTableViewController {
//    var refreshControl: UIRefreshControl!
//    var sessionManager: Alamofire.SessionManager!
//    
//    func addRefreshControl() {
//        refreshControl = UIRefreshControl()
//        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
//        refreshControl.addTarget(self, action: #selector(refresh(_:)), for: .valueChanged)
//        tableView.insertSubview(refreshControl, belowSubview: tableView)
//    }
//    
//    func refresh(_ sender: UIRefreshControl) {
//        sessionManager.updateSchedule(context: context!) { isUpdated in
//            DispatchQueue.main.async {
//                self.refreshControl.endRefreshing()
//                
//                if isUpdated {
//                    try! self.fetchedResultsController?.performFetch()
//                    self.tableView.reloadData()
//                } else {
//                    let alert = UIAlertController(title: nil, message: "Schedule is already updated.", preferredStyle: .alert)
//                    self.present(alert, animated: true, completion: {
//                        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2, execute: {
//                            alert.dismiss(animated: true, completion: nil)
//                        })
//                    })
//                }
//                
//            }
//        }
//    }
//}

