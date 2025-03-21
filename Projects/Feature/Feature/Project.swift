//
//  Project.swift
//  Config
//
//  Created by Jinbae Jeong on 3/21/25.
//

import Foundation
import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let targets: [Target] = [
    .feature(
        factory: .init(
            dependencies: [
                
            ]
        )
    )
]

let project: Project = .makeModule(
    name: "Feature",
    targets: targets
)
