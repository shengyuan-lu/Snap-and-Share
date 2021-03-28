import SwiftUI

struct SettingsRowTypeLink: View {
    
    // MARK: - Variable
    var iconName: String
    var iconColor: Color
    var text: LocalizedStringKey
    var link: String
    
    init(iconName: String, iconColor: Color, text: String, link: String) {
        self.iconName = iconName
        self.text = LocalizedStringKey(text)
        self.link = link
        self.iconColor = iconColor
    }

    // MARK: - View
    var body: some View {
        HStack {
            
            SettingsIcon(iconName: iconName, iconColor: iconColor)
            
            Text(text)
                .foregroundColor(Color.secondary)
                .padding(.leading, 5)
                .lineLimit(1)
                .minimumScaleFactor(0.1)
            
            Spacer()
            
            Button(action: {
                buttonClicked()
            }, label: {
               Image(systemName: "chevron.right")
                .font(.system(size: 14, weight: .semibold, design: .rounded))
            })
            .accentColor(Color(.systemGray2))
        }
        
    }
    
    // MARK: - Function
    func buttonClicked() {
        // Open a link
        guard let url = URL(string: self.link), UIApplication.shared.canOpenURL(url) else {
            return
        }
        
        UIApplication.shared.open(url as URL)
    }
}

// MARK: - Preview
struct SettingsRowTypeLink_Previews: PreviewProvider {
    static var previews: some View {
        SettingsRowTypeLink(iconName: "globe", iconColor: Color.blue, text: "Application", link: "Todo")
            .previewLayout(.fixed(width: 375, height: 60))
            .padding()
    }
}

struct SettingsIcon: View {
    
    // MARK: - Variable
    var iconName: String
    var iconColor: Color
    
    // MARK: - View
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8, style: .continuous)
                .fill(iconColor)
            Image(systemName: iconName)
                .foregroundColor(.white)
        }
        .frame(width: 36, height: 36, alignment: .center)
        
    }
}

// MARK: - Preview
struct SettingsIcon_Previews: PreviewProvider {
    static var previews: some View {
        SettingsIcon(iconName: "globe", iconColor: Color.blue)
            .previewLayout(.fixed(width: 375, height: 60))
            .padding()
    }
}
