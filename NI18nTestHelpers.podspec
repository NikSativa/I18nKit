Pod::Spec.new do |spec|
    spec.name         = "NI18nTestHelpers"
    spec.version      = "1.0.0"
    spec.summary      = "Internationalization framework"

    spec.source       = { :git => "git@github.com:NikSativa/NI18n.git" }
    spec.homepage     = "https://github.com/NikSativa/NI18n"

    spec.license          = 'MIT'
    spec.author           = { "Nikita Konopelko" => "nik.sativa@gmail.com" }
    spec.social_media_url = "https://www.facebook.com/Nik.Sativa"

    spec.ios.deployment_target = "11.0"
    spec.swift_version = '5.0'

    spec.resources = ['TestHelpers/**/*.{storyboard,xib,xcassets,json,imageset,png,strings,stringsdict}']
    spec.source_files = 'TestHelpers/**/*.swift'

    spec.dependency 'Nimble'
    spec.dependency 'NSpry'
    spec.dependency 'Quick'

    spec.dependency 'NI18n'

    spec.frameworks = 'XCTest', 'Foundation', 'UIKit'

    spec.test_spec 'Tests' do |tests|
        #        tests.requires_app_host = true
        tests.source_files = 'Tests/Specs/**/*.swift'
        tests.resources = ['Tests/Specs/**/*.{storyboard,xib,xcassets,json,imageset,png,strings,stringsdict}']
    end
end
