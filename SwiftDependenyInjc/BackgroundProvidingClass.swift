//
//  BackgroundProvidingClass.swift
//  SwiftDependenyInjc
//
//  Created by hasan bilgin on 21.11.2023.
//

import Foundation
//UIColor için eklendi
import UIKit

//Genelde BackgroundProviding böyle isim verilir
//Providing sağlayan anlamındadır
class BackgroundProvidingClass : BackgroundProviderProtocol{
    
    var backgroundColor: UIColor {
        let backgroundColors : [UIColor] = [.systemGray,.systemRed,.systemMint,.systemCyan]
        
        //renklerin random olarak 1 adet döndürürcek
        return backgroundColors.randomElement()!
    }
    
    
}
