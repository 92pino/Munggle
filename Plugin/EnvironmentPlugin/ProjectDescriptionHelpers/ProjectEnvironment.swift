//
//  ProjectEnvironment.swift
//  EnvironmentPlugin
//
//  Created by Jinbae Jeong on 3/20/25.
//

import Foundation
import ProjectDescription

public struct ProjectEnvironment {
    public let name: String
    public let organizationName: String
    public let deploymentTargets: DeploymentTargets
    public let destination: Set<Destination>
    public let bundleVersion: String
    public let baseSetting: SettingsDictionary
}

public let env = ProjectEnvironment(
    name: "Munggle",
    organizationName: "com.iOS",
    deploymentTargets: .iOS("18.0"),
    destination: .iOS,
    bundleVersion: "0.0.1",
    baseSetting: [:]
)
