
import Foundation

struct FoodBank: Hashable {
    
    let title:String
    
    let image:String
    
    let link:String
    
    let description:String
    
    let lat:Double
    
    let lon:Double
    
    let item:String
    
}

let foodBankList = [
    FoodBank(title: "Second Harvest Food Bank", image: "second-harvest", link: "second-harvest", description: "Our virtual 2020 No Lunch Lunch highlights our work feeding newly-vulnerable, food-insecure people in our community. From the Drive-Thru distributions at the Honda Center to the Harvest Truck Brigade’s door-to-door deliveries, you’ll see all the ways our team responded to feed those in need at the height of the hunger crisis.", lat: 34.4736, lon: -117.0011, item: "Salad"),
    FoodBank(title: "Serving the Future Food Bank", image: "oc-fb", link: "https://www.ocgov.com/about/emergency/assistance/food", description: "We have upcoming events in 2021 that you’ll want to know more about. Join us for one or all of them and have fun while supporting Second Harvest. We’ll post more details a few weeks in advance of the events.", lat: 33.7175, lon: -117.8311, item: "Donuts"),
    FoodBank(title: "Community Action Partnership of Orange", image: "oc-fb2", link: "https://www.capoc.org/oc-food-bank/", description: "Every year our retail grocery partners host fundraisers during the holidays to make sure everyone has nutritious meals for the holidays and beyond.", lat: 33.7375, lon: -116.8311, item: "Miso Soup")
]
