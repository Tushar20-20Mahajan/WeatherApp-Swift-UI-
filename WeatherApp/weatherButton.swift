//
//  weatherButton.swift
//  WeatherApp
//
//  Created by Vibho Sharma on 25/05/24.
//

import Foundation
import SwiftUI
struct ChangeDayTimeButton: View {
    var action: () -> Void
    var titleOfTheButton : String
    var textColor : Color
    var backgroundColor : Color
    
    var body: some View {
        Button(action: action) {
            Text(titleOfTheButton)
                .frame(width: 280, height: 50)
                .background(backgroundColor)
                .font(.system(size: 20, weight: .bold, design: .default))
                .cornerRadius(10.0)
                .foregroundColor(textColor)
        }
    }
}
