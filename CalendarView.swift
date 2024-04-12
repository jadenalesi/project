//
//  CalendarView.swift
//  FE_Rebuild
//
//  Created by Jaden Alesi on 4/1/24.
//

import SwiftUI

struct CalendarView: View {
    @State var selectedDate = Date()
    var body: some View {
        NavigationStack{
            VStack {
                FormattedDate(selectedDate: selectedDate, omitTime: true)
                Divider().frame(height: 1)
                DatePicker("Select Date", selection: $selectedDate, displayedComponents: [.date])
                    .padding(.horizontal)
                    .datePickerStyle(.graphical)
                Divider()
                NavigationLink("See Exercises") {
                    CalDetailsView(checkDate: selectedDate)
                }
            }
            .padding(.vertical, 100)
        }
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}

#Preview {
    CalendarView()
}
