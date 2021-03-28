import SwiftUI

struct FoodBankCell: View {
    
    @State var foodBank: FoodBank
    
    let cornerRadius:CGFloat = 10
    let gReaderHeight:CGFloat = 150
    
    var body: some View {
        GeometryReader(content: { geometry in
            
            ZStack {
                
                RoundedRectangle(cornerRadius: cornerRadius + 5)
                    .foregroundColor(Color("guideCardBG"))
                
                HStack {
                    
                       Image(foodBank.image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: geometry.size.width/3 - 20, height: geometry.size.height, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
                    
                    VStack(alignment: .leading) {
                        
                        Text(foodBank.item)
                            .foregroundColor(.green)
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.secondary)
                            .lineLimit(2)
                        
                        Text(foodBank.title)
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                            .lineLimit(2)
                        
                        Spacer()
                        
                        Text(foodBank.description)
                            .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                            .font(.body)
                            .foregroundColor(.secondary)
                    }
                    .padding(.leading, 10)
                }
                .cornerRadius(cornerRadius)
                
            }
            
        })
        .frame(height: gReaderHeight)
        .padding(5)
    }
    
    

}

struct FoodBankCell_Previews: PreviewProvider {
    static var previews: some View {
        FoodBankCell(foodBank: foodBankList[0])
    }
}
