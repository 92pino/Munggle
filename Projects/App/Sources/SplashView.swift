//
//  SplashView.swift
//  Munggle
//
//  Created by Jinbae Jeong on 3/21/25.
//  Copyright © 2025 com.iOS. All rights reserved.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [Color("top-bg"), Color("bottom-bg")]),
                startPoint: .top,
                endPoint: .bottom
            )
            
            Image("splash")
                .resizable()
                .scaledToFit()
        }
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    SplashView()
}
