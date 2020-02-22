//
//  QTVContainer.swift
//  Quick Table View
//
//  Created by John Cheney on 2/22/20.
//  Copyright © 2020 John Cheney. All rights reserved.
//

import Foundation

class QTVContainer {
	static func qtvDataSource() -> QTVDataSource {
		return QTVLocalDataSource(urlString: "books")
	}
	
	static func qtvViewModel() -> QTVViewModel {
		return QTVViewModel(dataSource: QTVContainer.qtvDataSource())
	}
}
