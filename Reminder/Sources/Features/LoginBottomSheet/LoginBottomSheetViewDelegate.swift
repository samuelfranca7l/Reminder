//
//  LoginBottomSheetViewDelegate.swift
//  Reminder
//
//  Created by Samuel França on 08/05/25.
//

import UIKit

protocol LoginBottomSheetViewDelegate : AnyObject {
    func sendLoginData(user: String, password: String)
}
