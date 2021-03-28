import SwiftUI

struct FoodListView: View {
    
    @ObservedObject var foodList: FoodList
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(Array(foodList.foodDict.keys), id: \.self) { key in
                    FoodListCell(image: foodList.foodDict[key]!, name: key)
                }
            }
        }
    }
}

struct FoodListView_Previews: PreviewProvider {
    static var previews: some View {
        FoodListView(foodList: FoodList())
    }
}
