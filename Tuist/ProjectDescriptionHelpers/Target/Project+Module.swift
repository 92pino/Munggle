//
//  Project+Module.swift
//  Config
//
//  Created by Jinbae Jeong on 3/20/25.
//

import Foundation
import ProjectDescription
import EnvironmentPlugin

public extension Project {
    static func makeModule(
        name: String,
        options: Project.Options = .options(),
        packages: [Package] = [],
        settings: Settings? = nil,
        schemes: [Scheme] = [],
        fileHeaderTemplate: FileHeaderTemplate? = nil,
        additionalFiles: [FileElement] = [],
        resourceSynthesizers: [ResourceSynthesizer] = .default,
        targets: [Target]
    ) -> Self {
        return .init(
            name: name,
            organizationName: env.organizationName,
            options: options,
            packages: packages,
            settings: settings,
            targets: targets,
            schemes: schemes,   // 추후 변경
            fileHeaderTemplate: fileHeaderTemplate,
            additionalFiles: additionalFiles,
            resourceSynthesizers: resourceSynthesizers
        )
    }
}
