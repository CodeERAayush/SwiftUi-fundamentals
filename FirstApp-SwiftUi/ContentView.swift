import SwiftUI

public class dayWiseTemperature {
    var Day:String
    var imageUrl:String
    var temperature:String
    init(Day: String, imageUrl: String, temperature: String) {
        self.Day = Day
        self.imageUrl = imageUrl
        self.temperature = temperature
    }
}

struct ContentView: View {
    
    @State private var isNight = false
    
    var arrOfTemp:[dayWiseTemperature]=[
    dayWiseTemperature(Day: "MON", imageUrl: "cloud.moon.rain.fill", temperature: "21"),
    dayWiseTemperature(Day: "TUE", imageUrl: "cloud.sun.rain.fill", temperature: "25"),
    dayWiseTemperature(Day: "WED", imageUrl: "cloud.sun.fill", temperature: "26"),
    dayWiseTemperature(Day: "THU", imageUrl: "wind.snow", temperature: "20"),
    dayWiseTemperature(Day: "FRI", imageUrl: "sunset.fill", temperature: "27"),
    ]
    
    var body: some View {
        ZStack{
            BackgroundGradient(colors:isNight ? [Color.black,Color.gray]:[Color.red,Color("lightPink"), Color.blue])
            VStack{
                cityName(name:"Gorakhpur, In")
                mainWeatherStatusView(image: isNight ? "cloud.moon.rain.fill":"cloud.sun.bolt.fill", tempearture: 28)
                .padding(.bottom,60)
                HStack {
                        
                    ForEach(arrOfTemp,id: \.Day) { item in
                                       DayWiseWeatherView(day: item.Day, image: item.imageUrl, temperature: item.temperature)
                                   }
                               
                           }
                Spacer()
                
                Button{
                    isNight.toggle()
                }label: {
                    Text("Change Theme")
                        .frame(width: 280, height: 50)
                        .background(Color.white)
                        .font(.system(size: 20,weight: .bold,design: .default))
                        .cornerRadius(999)
                        .shadow(color:Color("lightPink"), radius: 10)
                        
                }
                
                Spacer()
            }
            }
        }
    }

struct DayWiseWeatherView: View {
    
    var day:String;
    var image:String;
    var temperature:String;
    
    var body: some View {
        VStack{
            Text("\(day)").font(.title2).foregroundColor(.white).padding(.horizontal,10)
            Image(systemName: "\(image)")
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50,height:50)
            Text("\(temperature)°").foregroundColor(.white)
                .bold().monospaced().font(.system(size: 30))
        }
    }
}

    

struct BackgroundGradient: View {
    
    var colors: [Color]
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: colors), startPoint: .bottomLeading, endPoint: .topTrailing)
            .ignoresSafeArea(.all)
//        ContainerRelativeShape().fill(Color.pink.gradient)
//            .ignoresSafeArea(.all)
    }
}

struct cityName : View{
    
    var name:String
    
    var body : some View{
        Text("\(name)")
            .font(.system(size:30,weight: .medium))
            .bold()
            .monospaced()
            .foregroundColor(.white).padding(.top,10)
    }
}

struct mainWeatherStatusView : View{
    
    var image:String
    var tempearture:Int
    
    var body : some View {
        VStack{
            Image(systemName: "\(image)")
                .symbolRenderingMode(.multicolor)
                .resizable()
                .foregroundStyle(.white,.yellow,.pink)
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 150)
                .padding(.top, 20)


                
            Text("\(tempearture)°")
                .font(.system(size: 50, weight: .bold))
                .padding(0)
                .contentMargins(0)
                .foregroundColor(.white)
                .monospaced()
        }
    }
}

#Preview {
    ContentView()
}

