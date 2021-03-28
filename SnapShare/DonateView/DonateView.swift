import SwiftUI

struct DonateView: View {
    
    var body: some View {
        
        NavigationView {
            List {
                ForEach(foodBankList, id: \.self) { foodbank in
                    NavigationLink(
                        destination: FoodBankDetail(foodBank: foodbank),
                        label: {
                            FoodBankCell(foodBank: foodbank)
                        })
                }
            }
            .navigationTitle("🥬 Food Banks")
        }

        
    }
}

struct DonateView_Previews: PreviewProvider {
    static var previews: some View {
        DonateView()
    }
}
