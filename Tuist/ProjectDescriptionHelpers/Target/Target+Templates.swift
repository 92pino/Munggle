//
//  Target+Templates.swift
//  Config
//
//  Created by Jinbae Jeong on 3/20/25.
//

import Foundation
import ProjectDescription
import EnvironmentPlugin
import DependencyPlugin

public struct TargetFactory {
    var name: String
    var destinations: Destinations
    var product: Product
    var productName: String?
    var bundleId: String?
    var deploymentTargets: DeploymentTargets?
    var infoPlist: InfoPlist?
    var sources: SourceFilesList?
    var resources: ResourceFileElements?
    var copyFiles: [CopyFilesAction]?
    var headers: Headers?
    var entitlements: Entitlements?
    var scripts: [TargetScript]
    var dependencies: [TargetDependency]
    var settings: Settings?
    var coreDataModels: [CoreDataModel]
    var environmentVariables: [String : EnvironmentVariable]
    var launchArguments: [LaunchArgument]
    var additionalFiles: [FileElement]
    var buildRules: [BuildRule]
    
    public init(
        name: String = "",
        destinations: Destinations = env.destination,
        product: Product = .staticLibrary,
        productName: String? = nil,
        bundleId: String? = nil,
        deploymentTargets: DeploymentTargets? = env.deploymentTargets,
        infoPlist: InfoPlist? = .default,
        sources: SourceFilesList? = .sources,
        resources: ResourceFileElements? = nil,
        copyFiles: [CopyFilesAction]? = nil,
        headers: Headers? = nil,
        entitlements: Entitlements? = nil,
        scripts: [TargetScript] = [],
        dependencies: [TargetDependency] = [],
        settings: Settings? = nil,
        coreDataModels: [CoreDataModel] = [],
        environmentVariables: [String: EnvironmentVariable] = [:],
        launchArguments: [LaunchArgument] = [],
        additionalFiles: [FileElement] = [],
        buildRules: [BuildRule] = []
    ) {
        self.name = name
        self.destinations = destinations
        self.product = product
        self.productName = productName
        self.deploymentTargets = deploymentTargets
        self.bundleId = bundleId
        self.infoPlist = infoPlist
        self.sources = sources
        self.resources = resources
        self.copyFiles = copyFiles
        self.headers = headers
        self.entitlements = entitlements
        self.scripts = scripts
        self.dependencies = dependencies
        self.settings = settings
        self.coreDataModels = coreDataModels
        self.environmentVariables = environmentVariables
        self.launchArguments = launchArguments
        self.additionalFiles = additionalFiles
        self.buildRules = buildRules
    }
}

public extension Target {
    private static func make(factory: TargetFactory) -> Self {
        return .target(
            name: factory.name,
            destinations: factory.destinations,
            product: factory.product,
            productName: factory.productName,
            bundleId: factory.bundleId ?? "\(env.organizationName).\(factory.name)",
            deploymentTargets: factory.deploymentTargets,
            infoPlist: factory.infoPlist,
            sources: factory.sources,
            resources: factory.resources,
            copyFiles: factory.copyFiles,
            headers: factory.headers,
            entitlements: factory.entitlements,
            scripts: factory.scripts,
            dependencies: factory.dependencies,
            settings: factory.settings,
            coreDataModels: factory.coreDataModels,
            environmentVariables: factory.environmentVariables,
            launchArguments: factory.launchArguments,
            additionalFiles: factory.additionalFiles,
            buildRules: factory.buildRules
        )
    }
}

// MARK: Target + App
public extension Target {
    static func app(implements module: ModulePath.App, factory: TargetFactory) -> Self {
        var newFactory = factory
        newFactory.name = ModulePath.App.name + module.rawValue
        
        switch module {
        case .IOS:
            newFactory.destinations = [.iPhone]
            newFactory.product = .app
            newFactory.name = env.name
            newFactory.bundleId = "\(env.organizationName).\(env.name)"
            newFactory.resources = ["Resources/**"]
            newFactory.productName = env.name
        }
        return make(factory: newFactory)
    }
}


// MARK: Target + Feature

public extension Target {
    static func feature(factory: TargetFactory) -> Self {
        var newFactory = factory
        newFactory.name = ModulePath.Feature.name
        
        return make(factory: newFactory)
    }
    
    static func feature(implements module: ModulePath.Feature, factory: TargetFactory) -> Self {
        var newFactory = factory
        newFactory.name = ModulePath.Feature.name + module.rawValue
        
        return make(factory: newFactory)
    }
    
    static func feature(tests module: ModulePath.Feature, factory: TargetFactory) -> Self {
        var newFactory = factory
        newFactory.name = ModulePath.Feature.name + module.rawValue + "Tests"
        newFactory.sources = .tests
        newFactory.product = .unitTests
        
        return make(factory: newFactory)
    }
    
    static func feature(testing module: ModulePath.Feature, factory: TargetFactory) -> Self {
        var newFactory = factory
        newFactory.name = ModulePath.Feature.name + module.rawValue + "Testing"
        newFactory.sources = .testing
        
        return make(factory: newFactory)
    }
    
    static func feature(interface module: ModulePath.Feature, factory: TargetFactory) -> Self {
        var newFactory = factory
        newFactory.name = ModulePath.Feature.name + module.rawValue + "Interface"
        newFactory.sources = .interface
                
        return make(factory: newFactory)
    }
    
    static func feature(example module: ModulePath.Feature, factory: TargetFactory) -> Self {
        var newFactory = factory
        newFactory.name = ModulePath.Feature.name + module.rawValue + "Example"
        newFactory.sources = .exampleSources
        newFactory.product = .app
        newFactory.infoPlist = .extendingDefault(
            with: [
                "UIMainStoryboardFile": "",
                "UILaunchStoryboardName": "LaunchScreen",
            ])
        
        return make(factory: newFactory)
    }
}

// MARK: Target + Domain

public extension Target {
    static func domain(factory: TargetFactory) -> Self {
        var newFactory = factory
        newFactory.name = ModulePath.Domain.name
        
        return make(factory: newFactory)
    }
    
    static func domain(implements module: ModulePath.Domain, factory: TargetFactory) -> Self {
        var newFactory = factory
        newFactory.name = ModulePath.Domain.name + module.rawValue
        
        return make(factory: newFactory)
    }
    
    static func domain(tests module: ModulePath.Domain, factory: TargetFactory) -> Self {
        var newFactory = factory
        newFactory.name = ModulePath.Domain.name + module.rawValue + "Tests"
        newFactory.product = .unitTests
        newFactory.sources = .tests
        
        return make(factory: newFactory)
    }
    
    static func domain(testing module: ModulePath.Domain, factory: TargetFactory) -> Self {
        var newFactory = factory
        newFactory.name = ModulePath.Domain.name + module.rawValue + "Testing"
        newFactory.sources = .testing
        
        return make(factory: newFactory)
    }
    
    static func domain(interface module: ModulePath.Domain, factory: TargetFactory) -> Self {
        var newFactory = factory
        newFactory.name = ModulePath.Domain.name + module.rawValue + "Interface"
        newFactory.sources = .interface

        return make(factory: newFactory)
    }
}

// MARK: Target + Core

public extension Target {
    static func core(factory: TargetFactory) -> Self {
        var newFactory = factory
        newFactory.name = ModulePath.Core.name

        return make(factory: newFactory)
    }
    
    static func core(implements module: ModulePath.Core, factory: TargetFactory) -> Self {
        var newFactory = factory
        newFactory.name = ModulePath.Core.name + module.rawValue

        return make(factory: newFactory)
    }
    
    static func core(tests module: ModulePath.Core, factory: TargetFactory) -> Self {
        var newFactory = factory
        newFactory.name = ModulePath.Core.name + module.rawValue + "Tests"
        newFactory.product = .unitTests
        newFactory.sources = .tests

        return make(factory: newFactory)
    }
    
    static func core(testing module: ModulePath.Core, factory: TargetFactory) -> Self {
        var newFactory = factory
        newFactory.name = ModulePath.Core.name + module.rawValue + "Testing"
        newFactory.sources = .testing
        if module == .Network {
            newFactory.resources = ["Resources/**"]
            newFactory.product = .staticFramework
        }

        return make(factory: newFactory)
    }
    
    static func core(interface module: ModulePath.Core, factory: TargetFactory) -> Self {
        var newFactory = factory
        newFactory.name = ModulePath.Core.name + module.rawValue + "Interface"
        newFactory.sources = .interface

        return make(factory: newFactory)
    }
}

// MARK: Target + Shared

public extension Target {
    static func shared(factory: TargetFactory) -> Self {
        var newFactory = factory
        newFactory.name = ModulePath.Shared.name
        
        return make(factory: newFactory)
    }
    
    static func shared(implements module: ModulePath.Shared, factory: TargetFactory) -> Self {
        var newFactory = factory
        newFactory.name = ModulePath.Shared.name + module.rawValue
        
        return make(factory: newFactory)
    }
    
    static func shared(interface module: ModulePath.Shared, factory: TargetFactory) -> Self {
        var newFactory = factory
        newFactory.name = ModulePath.Shared.name + module.rawValue + "Interface"
        newFactory.sources = .interface
        
        return make(factory: newFactory)
    }
    
    static func shared(testing module: ModulePath.Shared, factory: TargetFactory) -> Self {
        var newFactory = factory
        newFactory.name = ModulePath.Shared.name + module.rawValue + "Testing"
        newFactory.sources = .testing

        return make(factory: newFactory)
    }
    
    static func shared(tests module: ModulePath.Shared, factory: TargetFactory) -> Self {
        var newFactory = factory
        newFactory.name = ModulePath.Shared.name + module.rawValue + "Tests"
        newFactory.product = .unitTests
        newFactory.sources = .tests

        return make(factory: newFactory)
    }

}

public extension Target {
    static func designSystem(factory: TargetFactory) -> Self {
        var newFactory = factory
        newFactory.name = ModulePath.UserInterface.name
        
        return make(factory: newFactory)
    }
    
    static func designSystem(implements module: ModulePath.UserInterface, factory: TargetFactory) -> Self {
        var newFactory = factory
        newFactory.name = ModulePath.UserInterface.name + module.rawValue
        newFactory.sources = .sources
        newFactory.resources = ["Resources/**"]
        newFactory.product = .staticFramework
        
        
        return make(factory: newFactory)
    }
    
    static func designSystem(tests module: ModulePath.UserInterface, factory: TargetFactory) -> Self {
        var newFactory = factory
        newFactory.name = ModulePath.UserInterface.name + module.rawValue + "Tests"
        newFactory.product = .unitTests
        newFactory.sources = .tests
        
        return make(factory: newFactory)
    }
    
    static func designSystem(testing module: ModulePath.UserInterface, factory: TargetFactory) -> Self {
        var newFactory = factory
        newFactory.name = ModulePath.UserInterface.name + module.rawValue + "Testing"
        newFactory.sources = .testing
        
        return make(factory: newFactory)
    }

    
    static func designSystem(interface module: ModulePath.UserInterface, factory: TargetFactory) -> Self {
        var newFactory = factory
        newFactory.name = ModulePath.UserInterface.name + module.rawValue + "Interface"
        newFactory.sources = .interface
        
        return make(factory: newFactory)
    }
}
