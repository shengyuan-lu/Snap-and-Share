import SwiftUI

struct ConfirmationView: View {
    
    let image:UIImage
    let itemName:String
    let confidenceLevel:Double
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        NavigationView {
            
            VStack(spacing: 30) {
                
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.main.bounds.width/1.5, height: UIScreen.main.bounds.width/1.5, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .border(Color.secondary, width: 10)
                
                
                VStack(alignment: .center, spacing: 10) {
                    Text("Food Name: \(itemName.uppercased())")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding()
                    
                    Text("Confidence Level: \(confidenceLevel)")
                        .font(.body)
                }
                
                VStack(spacing: 10) {

                    // Continue
                    Button(action: {
                        
                    }, label: {
                            Text("That's Correct, Continue! ☺️")
                                .bold()
                                .lineLimit(1)
                                .minimumScaleFactor(0.1)
                                .frame(width: UIScreen.main.bounds.width/1.5, alignment: .center)
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.green)
                                .cornerRadius(8)
                        
                    })

                    
                    // Something's off
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Text("Something's off; Scan Again").bold()
                            .foregroundColor(.secondary)
                            .padding(5)
                    })
                }
                .padding(.top, 30)
                .padding(.bottom, 5)
                .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0.0, y: 0.0)
                
                
            }
            .navigationBarTitle("Confirm Result")
            .navigationBarTitleDisplayMode(.inline)

            
        }
    }
}

struct ConfirmationView_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmationView(image: UIImage(), itemName: "donut", confidenceLevel: 0.555)
    }
}
