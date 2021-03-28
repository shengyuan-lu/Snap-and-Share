import SwiftUI

struct FoodListCell: View {
    
    @State var image: UIImage
    @State var name: String
    
    var body: some View {
        
        HStack(spacing: 20) {
            Image(uiImage: image)
                .frame(width: 100, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
            Text(name)
                .font(.title)
                .fontWeight(.bold)
                .lineLimit(2)
            
            Spacer()
        }
        .padding()
        
        Divider()
    }
}

struct FoodListCell_Previews: PreviewProvider {
    static var previews: some View {
        FoodListCell(image: UIImage(), name: "Food")
    }
}
