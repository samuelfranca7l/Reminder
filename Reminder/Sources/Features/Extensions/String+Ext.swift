//
//  String+Ext.swift
//  Reminder
//
//  Created by Samuel França on 08/05/25.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
