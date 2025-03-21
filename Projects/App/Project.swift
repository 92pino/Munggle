//
//  Project.swift
//  Config
//
//  Created by Jinbae Jeong on 3/21/25.
//

import Foundation
import ProjectDescription
import ProjectDescriptionHelpers
import EnvironmentPlugin
import DependencyPlugin

let targets: [Target] = [
    .app(
        implements: .IOS,
        factory: .init(
            infoPlist: .file(path: "Support/Info.plist"),
            entitlements: nil,
            dependencies: [
                .feature
            ]
        )
    )
]

let project: Project = .makeModule(
    name: env.name,
    targets: targets
)
