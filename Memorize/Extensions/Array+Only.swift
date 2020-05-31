//
//  Array+Only.swift
//  Memorize
//
//  Created by Satveer Singh on 5/30/20.
//  Copyright © 2020 Satveer Singh. All rights reserved.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }   
    
}
