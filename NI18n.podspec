Pod::Spec.new do |spec|
    spec.name         = "NI18n"
    spec.version      = "1.0.0"
    spec.summary      = "Internationalization framework"

    spec.source       = { :git => "git@gitlab.com:gncore/NI18n.git" }
    spec.homepage     = "https://gitlab.com/gncore/NI18n.git"

    spec.license          = 'MIT'
    spec.author           = { "Nikita Konopelko" => "nik.sativa@gmail.com" }
    spec.social_media_url = "https://www.facebook.com/Nik.Sativa"

    spec.ios.deployment_target = "12.0"
    spec.swift_version = '5.0'

    spec.frameworks = 'Foundation', 'UIKit'

    spec.default_subspec = 'Core'

    spec.subspec 'Core' do |cs|
      cs.resources = ['Source/**/*.{storyboard,xib,xcassets,json,imageset,png,strings,stringsdict}']
      cs.source_files  = 'Source/**/*.swift'
      cs.exclude_files = 'Test/**/*'
    end

    spec.subspec 'TestHelpers' do |cs|
        cs.resources = ['Source/**/*.{storyboard,xib,xcassets,json,imageset,png,strings,stringsdict}']
        cs.source_files  = 'Test/**/*.swift', 'Source/**/*.swift'
        cs.exclude_files = 'Test/**/*Spec.swift', 'Test/**/Test*.*'

        cs.dependency 'Nimble'
        cs.dependency 'Spry'
        cs.dependency 'Quick'
        cs.dependency 'Spry+Nimble'

        cs.frameworks = 'XCTest', 'Foundation'

        cs.test_spec 'Tests' do |tests|
            #        tests.requires_app_host = true
            tests.source_files = 'Test/**/*Spec.swift', 'Test/**/Test*.*'
        end
    end
end
