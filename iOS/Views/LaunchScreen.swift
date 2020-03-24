//
//  LaunchScreen.swift
//  Roadie
//
//  Created by Michael Johnson on 3/21/20.
//  Copyright © 2020 Michael Johnson. All rights reserved.
//

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
