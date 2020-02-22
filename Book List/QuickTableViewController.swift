//
//  ViewController.swift
//  Book List
//
//  Created by John Cheney on 10/24/19.
//  Copyright © 2019 John Cheney. All rights reserved.
//

import UIKit

let QTCTableViewCellIdentifier = "QTCTableViewCellIdentifier"

class QuickTableViewController: UIViewController, UITableViewDelegate {
    	
	@IBOutlet var tableView: UITableView!
	
	var viewModel: QTVViewModel!
    
	override func viewDidLoad() {
		super.viewDidLoad()
		
		tableView.delegate = self
		tableView.dataSource = self
		
		viewModel = QTVViewModel()
			
		viewModel.readFromBooksList { [weak self] (books) in
			guard let strongSelf = self else { return }
			
			DispatchQueue.main.async {
					strongSelf.tableView.reloadData()
			}
		}
	}
    
}

extension QuickTableViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return viewModel.tableView(tableView, numberOfRowsInSection: section)
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		return viewModel.tableView(tableView, cellForRowAt: indexPath)
	}
	
}



