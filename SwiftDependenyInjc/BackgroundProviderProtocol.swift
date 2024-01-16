//
//  BackgraundProviderProtocol.swift
//  SwiftDependenyInjc
//
//  Created by hasan bilgin on 21.11.2023.
//

import Foundation
//UIColor için eklendi
import UIKit

//genelde BackgroundProvider böyle isim verilir
//Provider sağlayıcı
protocol BackgroundProviderProtocol {
    
    var backgroundColor : UIColor {
        get
    }
}
