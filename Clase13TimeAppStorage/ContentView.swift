//
//  ContentView.swift
//  Clase13TimeAppStorage
//
//  Created by Escurra Colquis on 11/10/24.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("clock") var clock: String = ""
    private let color: [Color] = [.primary, .green, .brown, .cyan, .yellow, .blue, .teal, .indigo, .secondary, .mint]
    private let emoji = ["😀", "☺️", "🤪", "😳", "😍", "👨🏻", "⭐️", "😇", "🥶", "🤥", "🤗", "🥹", "🙌"]
    
    
    var body: some View {
        Text("Tiempo actual")
            .bold()
            .foregroundStyle(.black)
            .font(.system(size: 40))
            .padding(.top, 20)
        Spacer()
        TimelineView(PeriodicTimelineSchedule(from: Date(), by: 1)) {
            _ in
            let date = Date.now
            let time = date.formatted(.dateTime.hour(.defaultDigits(amPM: .wide)).minute().second())
            let day = date.formatted(.dateTime.day(.defaultDigits))
            let dayName = date.formatted(.dateTime.weekday(.wide))
            
            Text("\(Text(dayName)) \(day)")
                .font(.title)
                .padding(.bottom, 3)
            HStack(spacing: 20) {
                Text(time)
                    .font(.largeTitle)
                    .foregroundStyle(color.randomElement() ?? .clear)
                Text(emoji.randomElement() ?? "")
                    .scaleEffect(2)
            }
            Button("Capturar hora") {
                clock = time
            }
            .buttonStyle(.bordered)
            .tint(.red)
            .padding(.top, 50)
            .font(.system(size: 30))
            Text("Hora actual: \(clock)")
                .font(.title)
        }
        Spacer()
        
        VStack {
            Text("Mi canal en Youtube y Github:")
            Text("@escurradeveloper")
                .bold()
                .font(.system(size: 30))
        }
    }
}

#Preview {
    ContentView()
}
