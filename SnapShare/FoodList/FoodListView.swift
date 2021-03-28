import SwiftUI

struct FoodListView: View {
    
    @ObservedObject var foodList:FoodList
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct FoodListView_Previews: PreviewProvider {
    static var previews: some View {
        FoodListView(foodList: FoodList())
    }
}
