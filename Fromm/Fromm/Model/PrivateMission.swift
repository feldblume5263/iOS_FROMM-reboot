//
//  PrivateMission.swift
//  Fromm
//
//  Created by Junhong Park on 2022/01/26.
//
import SwiftUI

struct MissionCoordinate {
    var x: Double
    var y: Double
}

struct PrivateMission {
    var name: String
    var image: UIImage
    var date: [Bool]
    var time: Int
    var location: MissionCoordinate
}
