//
//  Modules+Path.swift
//  DependencyPlugin
//
//  Created by Jinbae Jeong on 3/20/25.
//

import Foundation
import ProjectDescription

// MARK: ProjectDescription.Path + App

public extension ProjectDescription.Path {
    static var app: Self {
        return .relativeToRoot("Projects/\(ModulePath.App.name)")
    }
}

// MARK: ProjectDescription.Path + Feature

public extension ProjectDescription.Path {
    static var feature: Self {
        return .relativeToRoot("Projects/Feature/\(ModulePath.Feature.name)")
    }
    
    static func feature(implementation module: ModulePath.Feature) -> Self {
        return .relativeToRoot("Projects/\(ModulePath.Feature.name)/\(module.rawValue)")
    }
}

// MARK: ProjectDescription.Path + Domain

public extension ProjectDescription.Path {
    static var domain: Self {
        return .relativeToRoot("Projects/Domain/\(ModulePath.Domain.name)")
    }
    
    static func domain(implementation module: ModulePath.Domain) -> Self {
        return .relativeToRoot("Projects/\(ModulePath.Domain.name)/\(module.rawValue)")
    }
}

// MARK: ProjectDescription.Path + Core

public extension ProjectDescription.Path {
    static var core: Self {
        return .relativeToRoot("Projects/Core/\(ModulePath.Core.name)")
    }
    
    static func core(implementation module: ModulePath.Core) -> Self {
        return .relativeToRoot("Projects/\(ModulePath.Core.name)/\(module.rawValue)")
    }
}

// MARK: ProjectDescription.Path + Shared

public extension ProjectDescription.Path {
    static var shared: Self {
        return .relativeToRoot("Projects/Shared/\(ModulePath.Shared.name)")
    }
    
    static func shared(implementation module: ModulePath.Shared) -> Self {
        return .relativeToRoot("Projects/\(ModulePath.Shared.name)/\(module.rawValue)")
    }
}


public extension ProjectDescription.Path {
    static var designSystem: Self {
        return .relativeToRoot("Projects/DesignSystem/\(ModulePath.UserInterface.name)")
    }
    
    static func designSystem(implementation module: ModulePath.UserInterface) -> Self {
        return .relativeToRoot("Projects/\(ModulePath.UserInterface.name)/\(module.rawValue)")
    }

}
