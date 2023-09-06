load("@build_bazel_rules_ios//rules:app.bzl", "ios_application")
load("@build_bazel_rules_ios//rules:framework.bzl", "apple_framework")
load(
    "@build_bazel_rules_ios//rules:test.bzl",
    "ios_ui_test",
    "ios_unit_test",
)

glob = native.glob

def PlayerUI(
    deps
):
    apple_framework(
        name = "PlayerUI",
        swift_version = "5.1",
        xcconfig = {
            "ENABLE_BITCODE": "NO",
            "ENABLE_TESTING_SEARCH_PATHS": "YES",
        },
        srcs = glob([
            "ios/plugins/BaseBeaconPlugin/Sources/**/*.h",
            "ios/plugins/BaseBeaconPlugin/Sources/**/*.hh",
            "ios/plugins/BaseBeaconPlugin/Sources/**/*.m",
            "ios/plugins/BaseBeaconPlugin/Sources/**/*.mm",
            "ios/plugins/BaseBeaconPlugin/Sources/**/*.swift",
            "ios/plugins/BaseBeaconPlugin/Sources/**/*.c",
            "ios/plugins/BaseBeaconPlugin/Sources/**/*.cc",
            "ios/plugins/BaseBeaconPlugin/Sources/**/*.cpp",
            "ios/plugins/BeaconPlugin/Sources/**/*.h",
            "ios/plugins/BeaconPlugin/Sources/**/*.hh",
            "ios/plugins/BeaconPlugin/Sources/**/*.m",
            "ios/plugins/BeaconPlugin/Sources/**/*.mm",
            "ios/plugins/BeaconPlugin/Sources/**/*.swift",
            "ios/plugins/BeaconPlugin/Sources/**/*.c",
            "ios/plugins/BeaconPlugin/Sources/**/*.cc",
            "ios/plugins/BeaconPlugin/Sources/**/*.cpp",
            "ios/plugins/CheckPathPlugin/Sources/**/*.h",
            "ios/plugins/CheckPathPlugin/Sources/**/*.hh",
            "ios/plugins/CheckPathPlugin/Sources/**/*.m",
            "ios/plugins/CheckPathPlugin/Sources/**/*.mm",
            "ios/plugins/CheckPathPlugin/Sources/**/*.swift",
            "ios/plugins/CheckPathPlugin/Sources/**/*.c",
            "ios/plugins/CheckPathPlugin/Sources/**/*.cc",
            "ios/plugins/CheckPathPlugin/Sources/**/*.cpp",
            "ios/plugins/CommonExpressionsPlugin/Sources/**/*.h",
            "ios/plugins/CommonExpressionsPlugin/Sources/**/*.hh",
            "ios/plugins/CommonExpressionsPlugin/Sources/**/*.m",
            "ios/plugins/CommonExpressionsPlugin/Sources/**/*.mm",
            "ios/plugins/CommonExpressionsPlugin/Sources/**/*.swift",
            "ios/plugins/CommonExpressionsPlugin/Sources/**/*.c",
            "ios/plugins/CommonExpressionsPlugin/Sources/**/*.cc",
            "ios/plugins/CommonExpressionsPlugin/Sources/**/*.cpp",
            "ios/plugins/CommonTypesPlugin/Sources/**/*.h",
            "ios/plugins/CommonTypesPlugin/Sources/**/*.hh",
            "ios/plugins/CommonTypesPlugin/Sources/**/*.m",
            "ios/plugins/CommonTypesPlugin/Sources/**/*.mm",
            "ios/plugins/CommonTypesPlugin/Sources/**/*.swift",
            "ios/plugins/CommonTypesPlugin/Sources/**/*.c",
            "ios/plugins/CommonTypesPlugin/Sources/**/*.cc",
            "ios/plugins/CommonTypesPlugin/Sources/**/*.cpp",
            "ios/packages/core/Sources/**/*.h",
            "ios/packages/core/Sources/**/*.hh",
            "ios/packages/core/Sources/**/*.m",
            "ios/packages/core/Sources/**/*.mm",
            "ios/packages/core/Sources/**/*.swift",
            "ios/packages/core/Sources/**/*.c",
            "ios/packages/core/Sources/**/*.cc",
            "ios/packages/core/Sources/**/*.cpp",
            "ios/plugins/ExpressionPlugin/Sources/**/*.h",
            "ios/plugins/ExpressionPlugin/Sources/**/*.hh",
            "ios/plugins/ExpressionPlugin/Sources/**/*.m",
            "ios/plugins/ExpressionPlugin/Sources/**/*.mm",
            "ios/plugins/ExpressionPlugin/Sources/**/*.swift",
            "ios/plugins/ExpressionPlugin/Sources/**/*.c",
            "ios/plugins/ExpressionPlugin/Sources/**/*.cc",
            "ios/plugins/ExpressionPlugin/Sources/**/*.cpp",
            "ios/plugins/ExternalActionPlugin/Sources/**/*.h",
            "ios/plugins/ExternalActionPlugin/Sources/**/*.hh",
            "ios/plugins/ExternalActionPlugin/Sources/**/*.m",
            "ios/plugins/ExternalActionPlugin/Sources/**/*.mm",
            "ios/plugins/ExternalActionPlugin/Sources/**/*.swift",
            "ios/plugins/ExternalActionPlugin/Sources/**/*.c",
            "ios/plugins/ExternalActionPlugin/Sources/**/*.cc",
            "ios/plugins/ExternalActionPlugin/Sources/**/*.cpp",
            "ios/plugins/ExternalActionViewModifierPlugin/Sources/**/*.h",
            "ios/plugins/ExternalActionViewModifierPlugin/Sources/**/*.hh",
            "ios/plugins/ExternalActionViewModifierPlugin/Sources/**/*.m",
            "ios/plugins/ExternalActionViewModifierPlugin/Sources/**/*.mm",
            "ios/plugins/ExternalActionViewModifierPlugin/Sources/**/*.swift",
            "ios/plugins/ExternalActionViewModifierPlugin/Sources/**/*.c",
            "ios/plugins/ExternalActionViewModifierPlugin/Sources/**/*.cc",
            "ios/plugins/ExternalActionViewModifierPlugin/Sources/**/*.cpp",
            "ios/packages/internal-test-utils/Sources/**/*.h",
            "ios/packages/internal-test-utils/Sources/**/*.hh",
            "ios/packages/internal-test-utils/Sources/**/*.m",
            "ios/packages/internal-test-utils/Sources/**/*.mm",
            "ios/packages/internal-test-utils/Sources/**/*.swift",
            "ios/packages/internal-test-utils/Sources/**/*.c",
            "ios/packages/internal-test-utils/Sources/**/*.cc",
            "ios/packages/internal-test-utils/Sources/**/*.cpp",
            "ios/packages/logger/Sources/**/*.h",
            "ios/packages/logger/Sources/**/*.hh",
            "ios/packages/logger/Sources/**/*.m",
            "ios/packages/logger/Sources/**/*.mm",
            "ios/packages/logger/Sources/**/*.swift",
            "ios/packages/logger/Sources/**/*.c",
            "ios/packages/logger/Sources/**/*.cc",
            "ios/packages/logger/Sources/**/*.cpp",
            "ios/plugins/MetricsPlugin/Sources/**/*.h",
            "ios/plugins/MetricsPlugin/Sources/**/*.hh",
            "ios/plugins/MetricsPlugin/Sources/**/*.m",
            "ios/plugins/MetricsPlugin/Sources/**/*.mm",
            "ios/plugins/MetricsPlugin/Sources/**/*.swift",
            "ios/plugins/MetricsPlugin/Sources/**/*.c",
            "ios/plugins/MetricsPlugin/Sources/**/*.cc",
            "ios/plugins/MetricsPlugin/Sources/**/*.cpp",
            "ios/plugins/PrintLoggerPlugin/Sources/**/*.h",
            "ios/plugins/PrintLoggerPlugin/Sources/**/*.hh",
            "ios/plugins/PrintLoggerPlugin/Sources/**/*.m",
            "ios/plugins/PrintLoggerPlugin/Sources/**/*.mm",
            "ios/plugins/PrintLoggerPlugin/Sources/**/*.swift",
            "ios/plugins/PrintLoggerPlugin/Sources/**/*.c",
            "ios/plugins/PrintLoggerPlugin/Sources/**/*.cc",
            "ios/plugins/PrintLoggerPlugin/Sources/**/*.cpp",
            "ios/plugins/PubSubPlugin/Sources/**/*.h",
            "ios/plugins/PubSubPlugin/Sources/**/*.hh",
            "ios/plugins/PubSubPlugin/Sources/**/*.m",
            "ios/plugins/PubSubPlugin/Sources/**/*.mm",
            "ios/plugins/PubSubPlugin/Sources/**/*.swift",
            "ios/plugins/PubSubPlugin/Sources/**/*.c",
            "ios/plugins/PubSubPlugin/Sources/**/*.cc",
            "ios/plugins/PubSubPlugin/Sources/**/*.cpp",
            "ios/packages/reference-assets/Sources/**/*.h",
            "ios/packages/reference-assets/Sources/**/*.hh",
            "ios/packages/reference-assets/Sources/**/*.m",
            "ios/packages/reference-assets/Sources/**/*.mm",
            "ios/packages/reference-assets/Sources/**/*.swift",
            "ios/packages/reference-assets/Sources/**/*.c",
            "ios/packages/reference-assets/Sources/**/*.cc",
            "ios/packages/reference-assets/Sources/**/*.cpp",
            "ios/plugins/StageRevertDataPlugin/Sources/**/*.h",
            "ios/plugins/StageRevertDataPlugin/Sources/**/*.hh",
            "ios/plugins/StageRevertDataPlugin/Sources/**/*.m",
            "ios/plugins/StageRevertDataPlugin/Sources/**/*.mm",
            "ios/plugins/StageRevertDataPlugin/Sources/**/*.swift",
            "ios/plugins/StageRevertDataPlugin/Sources/**/*.c",
            "ios/plugins/StageRevertDataPlugin/Sources/**/*.cc",
            "ios/plugins/StageRevertDataPlugin/Sources/**/*.cpp",
            "ios/packages/swiftui/Sources/**/*.h",
            "ios/packages/swiftui/Sources/**/*.hh",
            "ios/packages/swiftui/Sources/**/*.m",
            "ios/packages/swiftui/Sources/**/*.mm",
            "ios/packages/swiftui/Sources/**/*.swift",
            "ios/packages/swiftui/Sources/**/*.c",
            "ios/packages/swiftui/Sources/**/*.cc",
            "ios/packages/swiftui/Sources/**/*.cpp",
            "ios/plugins/SwiftUICheckPathPlugin/Sources/**/*.h",
            "ios/plugins/SwiftUICheckPathPlugin/Sources/**/*.hh",
            "ios/plugins/SwiftUICheckPathPlugin/Sources/**/*.m",
            "ios/plugins/SwiftUICheckPathPlugin/Sources/**/*.mm",
            "ios/plugins/SwiftUICheckPathPlugin/Sources/**/*.swift",
            "ios/plugins/SwiftUICheckPathPlugin/Sources/**/*.c",
            "ios/plugins/SwiftUICheckPathPlugin/Sources/**/*.cc",
            "ios/plugins/SwiftUICheckPathPlugin/Sources/**/*.cpp",
            "ios/packages/test-utils/Sources/**/*.h",
            "ios/packages/test-utils/Sources/**/*.hh",
            "ios/packages/test-utils/Sources/**/*.m",
            "ios/packages/test-utils/Sources/**/*.mm",
            "ios/packages/test-utils/Sources/**/*.swift",
            "ios/packages/test-utils/Sources/**/*.c",
            "ios/packages/test-utils/Sources/**/*.cc",
            "ios/packages/test-utils/Sources/**/*.cpp",
            "ios/packages/test-utils-core/Sources/**/*.h",
            "ios/packages/test-utils-core/Sources/**/*.hh",
            "ios/packages/test-utils-core/Sources/**/*.m",
            "ios/packages/test-utils-core/Sources/**/*.mm",
            "ios/packages/test-utils-core/Sources/**/*.swift",
            "ios/packages/test-utils-core/Sources/**/*.c",
            "ios/packages/test-utils-core/Sources/**/*.cc",
            "ios/packages/test-utils-core/Sources/**/*.cpp",
            "ios/plugins/TransitionPlugin/Sources/**/*.h",
            "ios/plugins/TransitionPlugin/Sources/**/*.hh",
            "ios/plugins/TransitionPlugin/Sources/**/*.m",
            "ios/plugins/TransitionPlugin/Sources/**/*.mm",
            "ios/plugins/TransitionPlugin/Sources/**/*.swift",
            "ios/plugins/TransitionPlugin/Sources/**/*.c",
            "ios/plugins/TransitionPlugin/Sources/**/*.cc",
            "ios/plugins/TransitionPlugin/Sources/**/*.cpp",
            "ios/plugins/TypesProviderPlugin/Sources/**/*.h",
            "ios/plugins/TypesProviderPlugin/Sources/**/*.hh",
            "ios/plugins/TypesProviderPlugin/Sources/**/*.m",
            "ios/plugins/TypesProviderPlugin/Sources/**/*.mm",
            "ios/plugins/TypesProviderPlugin/Sources/**/*.swift",
            "ios/plugins/TypesProviderPlugin/Sources/**/*.c",
            "ios/plugins/TypesProviderPlugin/Sources/**/*.cc",
            "ios/plugins/TypesProviderPlugin/Sources/**/*.cpp",
        ]),
        resource_bundles = {
            "BaseBeaconPlugin": glob(
                ["ios/plugins/BaseBeaconPlugin/Resources/**/*.js"],
                exclude_directories = 0,
            ),
            "CheckPathPlugin": glob(
                ["ios/plugins/CheckPathPlugin/Resources/**/*.js"],
                exclude_directories = 0,
            ),
            "CommonExpressionsPlugin": glob(
                [
                    "ios/plugins/CommonExpressionsPlugin/Resources/**/*.js",
                ],
                exclude_directories = 0,
            ),
            "CommonTypesPlugin": glob(
                ["ios/plugins/CommonTypesPlugin/Resources/**/*.js"],
                exclude_directories = 0,
            ),
            "PlayerUI": glob(
                ["ios/packages/core/Resources/**/*.js"],
                exclude_directories = 0,
            ),
            "ExpressionPlugin": glob(
                ["ios/plugins/ExpressionPlugin/Resources/**/*.js"],
                exclude_directories = 0,
            ),
            "ExternalActionPlugin": glob(
                ["ios/plugins/ExternalActionPlugin/Resources/**/*.js"],
                exclude_directories = 0,
            ),
            "MetricsPlugin": glob(
                ["ios/plugins/MetricsPlugin/Resources/**/*.js"],
                exclude_directories = 0,
            ),
            "PubSubPlugin": glob(
                ["ios/plugins/PubSubPlugin/Resources/**/*.js"],
                exclude_directories = 0,
            ),
            "ReferenceAssets": glob(
                [
                    "ios/packages/reference-assets/Resources/js/**/*.js",
                    "ios/packages/reference-assets/Resources/svg/*.xcassets",
                    "ios/packages/reference-assets/Resources/svg/*.xcassets/**/*",
                ],
                exclude_directories = 0,
            ),
            "StageRevertDataPlugin": glob(
                [
                    "ios/plugins/StageRevertDataPlugin/Resources/**/*.js",
                ],
                exclude_directories = 0,
            ),
            "TestUtilities": glob(
                ["ios/packages/test-utils/Resources/**/*.js"],
                exclude_directories = 0,
            ),
            "TypesProviderPlugin": glob(
                ["ios/plugins/TypesProviderPlugin/Resources/**/*.js"],
                exclude_directories = 0,
            ),
        },
        weak_sdk_frameworks = ["XCTest"],
        deps = ["@Pods//SwiftHooks"] + deps,
        visibility = ["//visibility:public"],
        platforms = {"ios": "14.0"},
    )

def PlayerUI_Demo(
    deps
):
    ios_application(
        name = "PlayerUI-Demo",
        module_name = "PlayerUI_Demo",
        data = glob(
            [
                "ios/packages/demo/Resources/Primary.storyboard",
                "ios/packages/demo/Resources/Primary.storyboard/**/*",
                "ios/packages/demo/Resources/Launch.xib",
                "ios/packages/demo/Resources/Launch.xib/**/*",
                "ios/packages/demo/Resources/**/*.xcassets",
                "ios/packages/demo/Resources/**/*.xcassets/**/*",
            ],
            exclude_directories = 0,
        ),
        swift_version = "5.1",
        xcconfig = {
            "ENABLE_BITCODE": "NO",
            "ENABLE_TESTING_SEARCH_PATHS": "YES",
            "PRODUCT_BUNDLE_IDENTIFIER": "com.intuit.ios.player",
            "CODE_SIGN_STYLE": "Manual",
            "CODE_SIGN_IDENTITY": "iPhone Distribution",
            "PROVISIONING_PROFILE_SPECIFIER": "match InHouse com.intuit.ios.player",
            "DEVELOPMENT_TEAM": "F6DWWXWEX6",
            "SKIP_INSTALL": "NO",
            "SKIP_INSTALLED_PRODUCT": "YES",
        },
        srcs = glob([
            "ios/packages/demo/Sources/**/*.h",
            "ios/packages/demo/Sources/**/*.hh",
            "ios/packages/demo/Sources/**/*.m",
            "ios/packages/demo/Sources/**/*.mm",
            "ios/packages/demo/Sources/**/*.swift",
            "ios/packages/demo/Sources/**/*.c",
            "ios/packages/demo/Sources/**/*.cc",
            "ios/packages/demo/Sources/**/*.cpp",
        ]),
        deps = [":PlayerUI"] + deps,
        bundle_id = "com.intuit.ios.player",
        families = [
            "iphone",
            "ipad",
        ],
        infoplists = [
            {
                "UILaunchStoryboardName": "Launch",
                "CFBundleIdentifier": "com.intuit.ios.player",
                "UIApplicationSceneManifest": {
                    "UIApplicationSupportsMultipleScenes": True,
                    "UISceneConfigurations": {"UIWindowSceneSessionRoleApplication": [
                        {
                            "UISceneConfigurationName": "Default Configuration",
                            "UISceneDelegateClassName": "PlayerUI_Demo.SceneDelegate",
                        },
                    ]},
                },
            },
        ],
        minimum_os_version = "14.0",
    )

def unit_tests(
):
    ios_unit_test(
        name = "PlayerUI-Unit-Unit",
        module_name = "PlayerUI_Unit_Unit",
        swift_version = "5.1",
        xcconfig = {
            "ENABLE_BITCODE": "NO",
            "ENABLE_TESTING_SEARCH_PATHS": "YES",
        },
        srcs = glob([
            "ios/packages/*/Tests/**/*.swift",
            "ios/plugins/*/Tests/**/*.swift",
        ]),
        deps = [":PlayerUI"],
        minimum_os_version = "14.0",
        test_host = ":PlayerUI-Demo",
    )

def ui_tests(
):
    ios_ui_test(
        name = "PlayerUI-UI-ViewInspectorTests",
        module_name = "PlayerUI_UI_ViewInspectorTests",
        swift_version = "5.1",
        xcconfig = {
            "ENABLE_BITCODE": "NO",
            "ENABLE_TESTING_SEARCH_PATHS": "YES",
            "PRODUCT_BUNDLE_IDENTIFIER": "com.intuit.ios.PlayerUI-ExampleUITests",
            "CODE_SIGN_STYLE": "Manual",
            "CODE_SIGN_IDENTITY[sdk=iphoneos*]": "iPhone Developer",
            "PROVISIONING_PROFILE_SPECIFIER": "match Development com.intuit.ios.PlayerUI-ExampleUITests*",
            "DEVELOPMENT_TEAM": "F6DWWXWEX6",
        },
        srcs = glob([
            "ios/packages/*/ViewInspector/**/*.h",
            "ios/packages/*/ViewInspector/**/*.hh",
            "ios/packages/*/ViewInspector/**/*.m",
            "ios/packages/*/ViewInspector/**/*.mm",
            "ios/packages/*/ViewInspector/**/*.swift",
            "ios/packages/*/ViewInspector/**/*.c",
            "ios/packages/*/ViewInspector/**/*.cc",
            "ios/packages/*/ViewInspector/**/*.cpp",
            "ios/plugins/*/ViewInspector/**/*.h",
            "ios/plugins/*/ViewInspector/**/*.hh",
            "ios/plugins/*/ViewInspector/**/*.m",
            "ios/plugins/*/ViewInspector/**/*.mm",
            "ios/plugins/*/ViewInspector/**/*.swift",
            "ios/plugins/*/ViewInspector/**/*.c",
            "ios/plugins/*/ViewInspector/**/*.cc",
            "ios/plugins/*/ViewInspector/**/*.cpp",
            "ios/packages/demo/Sources/MockFlows.swift",
        ]),
        deps = [
            ":PlayerUI",
            "@Pods//ViewInspector",
        ],
        bundle_id = "com.intuit.ios.PlayerUI-ExampleUITests",
        minimum_os_version = "14.0",
        test_host = ":PlayerUI-Demo",
    )
    ios_ui_test(
        name = "PlayerUI-UI-XCUITests",
        module_name = "PlayerUI_UI_XCUITests",
        swift_version = "5.1",
        xcconfig = {
            "ENABLE_BITCODE": "NO",
            "ENABLE_TESTING_SEARCH_PATHS": "YES",
            "PRODUCT_BUNDLE_IDENTIFIER": "com.intuit.ios.PlayerUI-ExampleUITests",
            "CODE_SIGN_STYLE": "Manual",
            "CODE_SIGN_IDENTITY[sdk=iphoneos*]": "iPhone Developer",
            "PROVISIONING_PROFILE_SPECIFIER": "match Development com.intuit.ios.PlayerUI-ExampleUITests*",
            "DEVELOPMENT_TEAM": "F6DWWXWEX6",
        },
        srcs = glob([
            "ios/packages/*/UITests/**/*.h",
            "ios/packages/*/UITests/**/*.hh",
            "ios/packages/*/UITests/**/*.m",
            "ios/packages/*/UITests/**/*.mm",
            "ios/packages/*/UITests/**/*.swift",
            "ios/packages/*/UITests/**/*.c",
            "ios/packages/*/UITests/**/*.cc",
            "ios/packages/*/UITests/**/*.cpp",
            "ios/plugins/*/UITests/**/*.h",
            "ios/plugins/*/UITests/**/*.hh",
            "ios/plugins/*/UITests/**/*.m",
            "ios/plugins/*/UITests/**/*.mm",
            "ios/plugins/*/UITests/**/*.swift",
            "ios/plugins/*/UITests/**/*.c",
            "ios/plugins/*/UITests/**/*.cc",
            "ios/plugins/*/UITests/**/*.cpp",
        ]),
        deps = [
            ":PlayerUI",
            "@Pods//EyesXCUI",
        ],
        bundle_id = "com.intuit.ios.PlayerUI-ExampleUITests",
        minimum_os_version = "14.0",
        test_host = ":PlayerUI-Demo",
    )
