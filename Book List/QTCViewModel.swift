//
//  QTCViewModel.swift
//  Book List
//
//  Created by John Cheney on 2/22/20.
//  Copyright © 2020 John Cheney. All rights reserved.
//

import Foundation
import UIKit

struct Book: Codable {
    var title: String
    var subtitle: String
}

class QTVViewModel {
		
	var books: [Book] = []
	
	func readFromBooksList(completion: @escaping ([Book]) -> ()) {
		if let booksUrl = Bundle.main.url(forResource: "books", withExtension: "json") {
			do {
				let data = try Data(contentsOf: booksUrl, options: [])
				let books = try JSONDecoder().decode([Book].self, from: data)
				
				self.books = books
				
				completion(books)
			} catch {
					
			}
		}
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return books.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard indexPath.row < self.books.count else {
				return UITableViewCell(style: .subtitle, reuseIdentifier: QTCTableViewCellIdentifier)
		}

		let cell: UITableViewCell
		if let dequeuedCell = tableView.dequeueReusableCell(withIdentifier: QTCTableViewCellIdentifier) {
				cell = dequeuedCell
		} else {
				cell = UITableViewCell(style: .subtitle, reuseIdentifier: QTCTableViewCellIdentifier)
		}

		let book = self.books[indexPath.row]
		cell.textLabel?.text = book.title
		cell.detailTextLabel?.text = book.subtitle

		return cell
	}
	
}
