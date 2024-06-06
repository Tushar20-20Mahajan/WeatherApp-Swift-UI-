import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundGradientView(isNight: $isNight)
            
            VStack {
                LocationView(location: "Pathankot, Punjab, India")
                
                WeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temperature: 76)
                    .padding(.bottom, 40)
                
                WeatherForecastView()
                
                Spacer()
                
                ChangeDayTimeButton(action:{ 
                                        isNight.toggle()
                                        print("Button Tapped")}
                                    , titleOfTheButton: "Change Day Time"
                                    , textColor: isNight ? Color.black : Color.blue
                                    , backgroundColor: Color.white)
                
                Spacer()
            }
        }
    }
}

struct BackgroundGradientView: View {
    @Binding var isNight : Bool
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue,
                                                   isNight ? .gray : Color("lightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct LocationView: View {
    var location: String
    
    var body: some View {
        Text(location)
            .font(.system(size: 28, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct WeatherStatusView: View {
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temperature)°") // For Degree symbol option+shift+8
                .font(.system(size: 65, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct WeatherDayView: View {
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 25, weight: .medium))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°") // For Degree symbol option+shift+8
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct WeatherForecastView: View {
    var body: some View {
        HStack(spacing: 20) {
            WeatherDayView(dayOfWeek: "MON", imageName: "cloud.sun.fill", temperature: 74)
            WeatherDayView(dayOfWeek: "TUE", imageName: "sun.max.fill", temperature: 70)
            WeatherDayView(dayOfWeek: "WED", imageName: "wind", temperature: 65)
            WeatherDayView(dayOfWeek: "THU", imageName: "cloud.sun.rain.fill", temperature: 68)
            WeatherDayView(dayOfWeek: "FRI", imageName: "moon.stars.fill", temperature: 72)
        }
    }
}



#Preview {
    ContentView()
}
