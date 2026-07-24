//
//  DatePickerRow.swift
//  PocketSync
//
//  Created by Bibek upreti on 24/07/2026.
//

import Foundation
import SwiftUI

struct DatePickerRow: View {
    
    // MARK: - Properties
    @State private var showDatePicker: Bool = false
    @State private var tempDate: Date = Date()
    @Binding var date: Date
    
    // MARK: - Body
    var body: some View {
        Button {
            tempDate = date
            showDatePicker = true
        } label: {
            Text(date.formatted(date: .abbreviated, time: .omitted))
                .captionStyle(fontWeight: .semibold)
                .padding(16)
                .background(AppColor.background)
                .clipShape(Capsule())
        }
        .sheet(isPresented: $showDatePicker) {
            NavigationStack {

                   DatePicker(
                       "Select Date",
                       selection: $tempDate,
                       in: ...Date(),
                       displayedComponents: .date
                   )
                   .datePickerStyle(.graphical)
                   .padding()
                   .navigationTitle("Select Date")
                   .navigationBarTitleDisplayMode(.inline)
                   .toolbar {

                       ToolbarItem(placement: .topBarLeading) {

                           Button("Cancel") {
                               showDatePicker = false
                           }

                       }

                       ToolbarItem(placement: .topBarTrailing) {

                           Button("Done") {

                               date = tempDate
                               showDatePicker = false

                           }
                           .fontWeight(.semibold)

                       }

                   }

               }
               .presentationDetents([.medium])
        }
        .buttonStyle(.plain)
    }
    
}
