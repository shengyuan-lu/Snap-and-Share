import SwiftUI
import MapKit

struct FoodBankDetail: View {
    
    @State var foodBank: FoodBank
    
    var body: some View {
        
        ScrollView {
            
            VStack(spacing: 10) {
                
                MapView(coordinate: CLLocationCoordinate2D(latitude: foodBank.lat, longitude: foodBank.lon))
                    .frame(height: 150)
                
                VStack(alignment: .leading, spacing: 15) {
                    Text(foodBank.title)
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Divider()
                
                    Image(foodBank.image)
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 10))
        
                    
                    HStack {
                        Text("Items In Need")
                            .font(.title3)
                            .fontWeight(.semibold)
                        
                        Spacer()
                    }
                    
                    HStack {
                        Text("\(foodBank.item) 23/100")
                        
                        Spacer()
                    }
                    
                    ZStack {
                        
                        Rectangle()
                            .frame(height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.gray)
                            .opacity(0.3)
                        
                        HStack {
                            Rectangle()
                                .frame(width: 120, height: 20, alignment: .leading)
                                .foregroundColor(.green)
                            
                            Spacer()
                        }

                        
                    }
                    
                    HStack {
                        Text("Description")
                            .font(.title3)
                            .fontWeight(.semibold)
                        
                        Spacer()
                    }
                    
                    Text(foodBank.description)
                    
                    SettingsRowTypeLink(iconName: "globe", iconColor: Color.blue, text: "Visit Website", link: foodBank.link)
                    
                    
                }
                .padding()
                
                VStack(spacing: 10) {
                    


                }
                .padding([.horizontal], 20)
            
                Spacer()
                
            }
            
        }
        
        
    }
    
}

struct FoodBankDetail_Previews: PreviewProvider {
    static var previews: some View {
        FoodBankDetail(foodBank: foodBankList[0])
    }
}

struct MapView: View {
    
    var coordinate:CLLocationCoordinate2D
    
    @State private var region = MKCoordinateRegion()
    
    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
        region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        )
    }
    
    var body: some View {
        Map(coordinateRegion: $region)
            .onAppear(perform: {
                setRegion(coordinate)
            })
    }
}
