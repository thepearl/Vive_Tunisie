//
//  LoadingView.swift
//  Vive Tunisie
//
//  Created by Ghazi Tozri on 4/3/20.
//  Copyright © 2020 wimobi. All rights reserved.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack {
            LottieView(filename: "loading")
                .frame(width: 100, height: 100)
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
