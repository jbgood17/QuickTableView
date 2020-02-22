//
//  QTVLocalDataSource.swift
//  Quick Table View
//
//  Created by John Cheney on 2/22/20.
//  Copyright © 2020 John Cheney. All rights reserved.
//

import Foundation

class QTVLocalDataSource: QTVDataSource {

	var bundle: Bundle = .main
	var localURL: URL?
	
	required init(localURL: URL, bundle: Bundle = .main) {
		self.bundle =  bundle
		self.localURL = localURL
	}
	
	convenience init(urlString: String, bundle: Bundle = .main) {
		guard let localURL = bundle.url(forResource: urlString, withExtension: "json") else {
			fatalError("Couldn't find url for local resource")
		}
		
		self.init(localURL: localURL, bundle: bundle)
	}
	
	func fetchItems(completion: @escaping ([QTVItem]) -> ()) {
		if let url = localURL {
			do {
				let data = try Data(contentsOf: url, options: [])
				let items = try JSONDecoder().decode([QTVItem].self, from: data)
				
				completion(items)
			} catch {
				
			}
		}
	}
}
