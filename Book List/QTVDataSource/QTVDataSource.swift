//
//  QTVDataSource.swift
//  Book List
//
//  Created by John Cheney on 2/22/20.
//  Copyright © 2020 John Cheney. All rights reserved.
//

import Foundation

protocol QTVItem: Codable {
	var title: String { get }
	var subtitle: String { get }
}

protocol QTVDataSource {
	func fetchItems(completion: @escaping ([QTVItem]) -> ())
}
