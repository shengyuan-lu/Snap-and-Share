import SwiftUI

struct GuideCard: View {
    
    @Binding var selection:Int
    
    let cornerRadius:CGFloat = 10
    let gReaderHeight:CGFloat = 120
    
    var body: some View {
        
        TabView(selection: $selection) {
            GeometryReader(content: { geometry in
                
                ZStack {
                    
                    RoundedRectangle(cornerRadius: cornerRadius + 5)
                        .foregroundColor(Color("guideCardBG"))
                    
                    HStack {
                        
                        Image("scan-food")
                            .resizable()
                            .scaledToFill()
                            .frame(width: geometry.size.width/3 - 20, height: geometry.size.height, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
                        
                        VStack(alignment: .leading) {
                            
                            Text("Step 1")
                                .foregroundColor(.green)
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundColor(.secondary)
                                .lineLimit(1)
                                .minimumScaleFactor(0.1)
                            
                            Text("SNAP your surplus food")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.primary)
                                .lineLimit(2)
                                .minimumScaleFactor(0.1)
                            
                            Spacer()
                            
                            Text("Put your food in the green square for better AI recognition.")
                                .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                                .font(.body)
                                .foregroundColor(.secondary)
                                .minimumScaleFactor(0.1)
                        }
                        .padding(.leading, 10)
                    }
                    .padding(10)
                    .cornerRadius(cornerRadius)
                    
                }
                
            })
            .frame(height: gReaderHeight)
            .padding(5)
            .tag(0)
            
            GeometryReader(content: { geometry in
                
                ZStack {
                    
                    RoundedRectangle(cornerRadius: cornerRadius + 5)
                        .foregroundColor(Color("guideCardBG"))
                    
                    HStack {
                        
                        Image("food-bank")
                            .resizable()
                            .scaledToFill()
                            .frame(width: geometry.size.width/3 - 20, height: geometry.size.height, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
                        
                        VStack(alignment: .leading) {
                            
                            Text("Step 2")
                                .foregroundColor(.green)
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundColor(.secondary)
                                .lineLimit(1)
                                .minimumScaleFactor(0.1)
                            
                            Text("SHARE it with local people in need")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.primary)
                                .lineLimit(2)
                                .minimumScaleFactor(0.1)
                            
                            Spacer()
                            
                            Text("AI will automatically match you with a nearby shelter.")
                                .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                                .font(.body)
                                .foregroundColor(.secondary)
                                .minimumScaleFactor(0.1)
                        }
                        .padding(.leading, 10)
                    }
                    .padding(10)
                    .cornerRadius(cornerRadius)
                    
                }
                
            })
            .frame(height: gReaderHeight)
            .padding(5)
            .tag(1)
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        
        
    }
}

struct GuideCard_Previews: PreviewProvider {
    static var previews: some View {
        GuideCard(selection: .constant(0))
    }
}
