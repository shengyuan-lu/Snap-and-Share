import SwiftUI

struct FoodListCell: View {
    
    @State var image: UIImage
    @State var name: String
    
    var body: some View {
        
        VStack {
            HStack(spacing: 20) {
                
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                Text(name.uppercased())
                    .font(.title2)
                    .fontWeight(.bold)
                    .lineLimit(10)
                
                Spacer()
                
            }
            .padding()
        }
    }
}

struct FoodListCell_Previews: PreviewProvider {
    static var previews: some View {
        FoodListCell(image: UIImage(), name: "Food sdofjasodfjs")
    }
}
