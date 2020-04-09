import SwiftUI

struct LaunchScreen: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color(Asset.backgroundPrimary.color)
                    .edgesIgnoringSafeArea(.all)

                Image(uiImage: Asset.roadie.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.all)
            }
            .navigationBarHidden(true)
        }
    }
}

#if DEBUG
struct LaunchScreen_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreen()
    }
}
#endif
