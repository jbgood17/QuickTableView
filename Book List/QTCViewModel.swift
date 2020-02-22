//
//  QTCViewModel.swift
//  Quick Table View
//
//  Created by John Cheney on 2/22/20.
//  Copyright © 2020 John Cheney. All rights reserved.
//

import Foundation
import UIKit

class QTVViewModel {
	
	var items: [QTVItem] = []
	let dataSource: QTVDataSource
	
	init(dataSource: QTVDataSource) {
		self.dataSource = dataSource
	}
			
	func fetchFromDataSource(completion: @escaping () -> ()) {
		dataSource.fetchItems { (items) in
			self.items = items
			completion()
		}
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return items.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard indexPath.row < self.items.count else {
				return UITableViewCell(style: .subtitle, reuseIdentifier: QTCTableViewCellIdentifier)
		}

		let cell: UITableViewCell
		if let dequeuedCell = tableView.dequeueReusableCell(withIdentifier: QTCTableViewCellIdentifier) {
				cell = dequeuedCell
		} else {
				cell = UITableViewCell(style: .subtitle, reuseIdentifier: QTCTableViewCellIdentifier)
		}

		let item = self.items[indexPath.row]
		cell.textLabel?.text = item.title
		cell.detailTextLabel?.text = item.subtitle

		return cell
	}
	
}
