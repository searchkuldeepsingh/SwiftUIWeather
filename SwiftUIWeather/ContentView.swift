//
//  ContentView.swift
//  SwiftUIWeather
//
//  Created by Kuldeep on 12/07/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(topColor: isNight ? .black : .blue,
                           bottomColor: isNight ? .gray : Color("lightBlue"))
            VStack {
                WeatherDayView(dayOfWeek: "Cupertino, CA",
                               imageName: "cloud.sun.fill",
                               tempreture: 76, fontSize: 32, imageSize: 180)
                    .padding(.bottom, 70)
                HStack(spacing: 10) {
                    WeatherDayView(dayOfWeek: "TUE",
                                   imageName: "cloud.sun.fill",
                                   tempreture: 76, fontSize: 16, imageSize: 40)
                    WeatherDayView(dayOfWeek: "WEB",
                                   imageName: "sun.max.fill",
                                   tempreture: 84, fontSize: 16, imageSize: 40)
                    WeatherDayView(dayOfWeek: "THU",
                                   imageName: "wind.snow",
                                   tempreture: 57, fontSize: 16, imageSize: 40)
                    WeatherDayView(dayOfWeek: "FRI",
                                   imageName: "sunset.fill",
                                   tempreture: 61, fontSize: 16, imageSize: 40)
                    WeatherDayView(dayOfWeek: "SAT",
                                   imageName: "snow",
                                   tempreture: 24, fontSize: 16, imageSize: 40)
                }
                Spacer()
                Button {
                    isNight.toggle()
                } label: {
                    Text("Change Day Time")
                        .frame(width: 280, height: 50)
                        .background(Color(.white))
                        .font(.system(size: 20, weight: .bold, design: .default))
                        .cornerRadius(10)
                }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var tempreture: Int
    var fontSize: CGFloat
    var imageSize: CGFloat
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: fontSize, weight: .medium, design: .default))
                .foregroundColor(.white)
                .padding()
            
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: imageSize, height: imageSize)
            
            Text("\(tempreture)°")
                .font(.system(size: 28, weight: .medium, design: .default))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    
    var topColor: Color
    var bottomColor: Color
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [topColor, bottomColor]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}
