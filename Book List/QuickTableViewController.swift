//
//  ViewController.swift
//  Book List
//
//  Created by John Cheney on 10/24/19.
//  Copyright © 2019 John Cheney. All rights reserved.
//

import UIKit

struct Book: Codable {
    var title: String
    var subtitle: String
}

class QuickTableViewController: UIViewController, UITableViewDelegate {
    
    let bookIdentifier = "bookIdentifier"
    
    var books = [Book]()
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        readFromBooksList { [weak self] (books) in
            guard let strongSelf = self else { return }
            
            DispatchQueue.main.async {
                strongSelf.books = books
                strongSelf.tableView.reloadData()
            }
            
        }
    }
        
    func readFromBooksList(completion: @escaping ([Book]) -> ()) {
        if let booksUrl = Bundle.main.url(forResource: "books", withExtension: "json") {
            do {
                let data = try Data(contentsOf: booksUrl, options: [])
                let books = try JSONDecoder().decode([Book].self, from: data)
                completion(books)
            } catch {
                
            }
        }
    }
    
}

extension QuickTableViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return books.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard indexPath.row < books.count else {
				return UITableViewCell(style: .subtitle, reuseIdentifier: bookIdentifier)
		}

		let cell: UITableViewCell
		if let dequeuedCell = tableView.dequeueReusableCell(withIdentifier: bookIdentifier) {
				cell = dequeuedCell
		} else {
				cell = UITableViewCell(style: .subtitle, reuseIdentifier: bookIdentifier)
		}

		let book = books[indexPath.row]
		cell.textLabel?.text = book.title
		cell.detailTextLabel?.text = book.subtitle

		return cell
	}
	
}



