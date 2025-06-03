//
//  MyReceiptsViewModel.swift
//  Reminder
//
//  Created by Samuel França on 28/05/25.
//

import UserNotifications

class MyReceiptsViewModel {
    func fetchData() -> [Medicine] {
        return DBHelper.shared.fetchReceipts()
    }
    
    func deleteReceipt(byId id: Int) {
        DBHelper.shared.deletReceipt(byId: id)
    }
    
    func removeNotifications(for remedy: String) {
        let center = UNUserNotificationCenter.current()
        let identifiers = (0..<6).map { "\(remedy)-\($0)" }
        center.removePendingNotificationRequests(withIdentifiers: identifiers)
        print("Notificacoes para \(identifiers) removidas")
    }
    
}
