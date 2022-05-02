import SwiftUI

public struct AddBoard: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
        
    var cornerImage: Image?
    var style: AddBoardStyle
    var darkModeStyle: AddBoardStyle {
        if let style = style.darkModeStyle {
            return style
        } else {
            return AddBoardStyle(backgroundColor: .black, accentColor: .accentColor, textColor: .white, legendTextColor: .gray, dropShadowColor: .gray)
        }
    }
    var dropShadow: Bool
    var title: String
    var legend: String?
    var formSize: CGSize
    var onButtonClick: () -> Void
    
    var isFullWidth:Bool {
        return self.formSize == AddBoardForm.large
    }
    
    public var body: some View {
        ZStack {
            Rectangle()
                .fill(self.colorScheme == .dark ? Color.black : Color.white)
                .cornerRadius(20)
                .shadow(color: self.style.dropShadowColor, radius: self.dropShadow ? 8 : 0)
            VStack(alignment: .leading) {
                HStack{
                    Text(self.title)
                        .font(.headline)
                        .foregroundColor(self.colorScheme == .dark ? self.darkModeStyle.textColor : self.style.textColor)
                    Spacer()
                    self.cornerImage
                        .imageScale(.large)
                        .foregroundColor(self.colorScheme == .dark ? self.darkModeStyle.legendTextColor : self.style.legendTextColor)
                }
                .padding()
                if let legend = legend {
                    Text(legend)
                        .font(.subheadline.bold())
                        .padding(.horizontal)
                        .foregroundColor(.gray)
                }
                Spacer()
                HStack {
                    Spacer()
                    Button {
                        onButtonClick()
                    } label: {
                        Image(systemName: "plus")
                        #if os(watchOS)
                            .font(.title)
                            .foregroundColor(self.style.accentColor)
                        #else
                            .padding()
                            .background(self.colorScheme == .dark ? Color.black : Color.white)
                            .font(.title)
                            .foregroundColor(self.style.accentColor)
                            .clipShape(Circle())
                            .shadow(color: .gray, radius: 5)
                        #endif
                    }
                    .padding()
                }
            }
        }
        .frame(minWidth:self.formSize.width,
                maxWidth: self.isFullWidth ? .infinity : self.formSize.width,
                minHeight:self.formSize.height,
                maxHeight:self.formSize.height)
    }
}
struct AddBoard_Previews: PreviewProvider {
    static var previews: some View {
        AddBoard(style: AddBoardStyle(), dropShadow: true, title: "Apple", legend: "This is Legend", formSize: AddBoardForm.extraLarge) { print("Clicked") }
            .padding(30)
    }
}
