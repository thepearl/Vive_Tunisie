//
//  UploadingView.swift
//  Vive Tunisie
//
//  Created by Ghazi Tozri on 5/21/20.
//  Copyright © 2020 wimobi. All rights reserved.
//

import SwiftUI

struct UploadingView: View {
    var body: some View {
        VStack {
            LottieView(filename: "uploading")
                .frame(width: 100, height: 100)
        }
    }
}

struct UploadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
