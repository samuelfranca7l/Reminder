//
//  HomeFlowDelegate.swift
//  Reminder
//
//  Created by Samuel França on 15/05/25.
//

public protocol HomeFlowDelegate: AnyObject {
    func navigateToRecipesList()
    func navigateToNewRecipes()
    func logout()
}
