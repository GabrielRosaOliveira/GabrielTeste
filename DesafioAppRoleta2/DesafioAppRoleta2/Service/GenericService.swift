//
//  GenericService.swift
//  DesafioAppRoleta2
//
//  Created by Gabriel on 11/12/22.
//

import Foundation


protocol GenericService: AnyObject {
    typealias completion <T> = (_ result: T, _ faiLure: Error?) -> Void
}
