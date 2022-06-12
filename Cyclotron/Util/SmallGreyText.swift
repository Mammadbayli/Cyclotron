//
//  SmallGreyText.swift
//  Cyclotron
//
//  Created by Javad on 12.06.22.
//

import SwiftUI

extension Text {
    func smallGreyText() -> some View {
        self.font(.system(size: 14))
            .foregroundColor(.gray)
    }
}
