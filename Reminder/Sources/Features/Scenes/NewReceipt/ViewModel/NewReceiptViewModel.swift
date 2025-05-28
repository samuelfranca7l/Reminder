//
//  NewReceiptViewModel.swift
//  Reminder
//
//  Created by Samuel França on 27/05/25.
//

class NewReceiptViewModel {
    func addReceipt(remedy: String, time: String, recurrence: String, takeNow: Bool) {
        DBHelper.shared.insertReceipt(remedy: remedy, time: time, recurrence: recurrence, takeNow: takeNow)
    }
}
