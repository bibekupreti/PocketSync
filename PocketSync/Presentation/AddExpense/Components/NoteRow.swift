//
//  NoteRow.swift
//  PocketSync
//
//  Created by Bibek upreti on 24/07/2026.
//

import SwiftUI

struct NoteRow: View {
    
    // MARK: - Properties
    let title: String
    var placeholder: String
    var text: Binding<String>
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(title)
                .bodyStyle(fontWeight: .semibold)
            TextField(placeholder, text: text)
                .font(AppTypography.footNote)
                .fontWeight(.semibold)
        }
        .padding()
    }
    
}
