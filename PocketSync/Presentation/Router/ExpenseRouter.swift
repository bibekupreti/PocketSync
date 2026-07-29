//
//  ExpenseRouter.swift
//  PocketSync
//
//  Created by Bibek upreti on 29/07/2026.
//

import SwiftUI

@Observable
final class ExpenseRouter {
    var path = NavigationPath()
    
    func push(_ expense: Expense) {
        path.append(expense)
    }
}
