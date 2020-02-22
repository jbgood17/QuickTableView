//
//  QTVDataSource.swift
//  Quick Table View
//
//  Created by John Cheney on 2/22/20.
//  Copyright © 2020 John Cheney. All rights reserved.
//

import Foundation

struct QTVItem: Codable {
	var title: String
	var subtitle: String
}

protocol QTVDataSource {
	func fetchItems(completion: @escaping ([QTVItem]) -> ())
}
