Pod::Spec.new do |spec|
    spec.name         = "NI18nTestHelpers"
    spec.version      = "1.5.0"
    spec.summary      = "Internationalization framework"

    spec.source       = { :git => "git@github.com:NikSativa/NI18n.git" }
    spec.homepage     = "https://github.com/NikSativa/NI18n"

    spec.license          = 'MIT'
    spec.author           = { "Nikita Konopelko" => "nik.sativa@gmail.com" }
    spec.social_media_url = "https://www.facebook.com/Nik.Sativa"

    spec.ios.deployment_target = '11.0'
    spec.swift_version = '5.5'

    spec.resources = ['TestHelpers/**/*.{storyboard,xib,xcassets,json,imageset,png,strings,stringsdict}']
    spec.source_files = 'TestHelpers/**/*.swift'

    spec.dependency 'NSpry'
    spec.dependency 'NI18n'

    spec.frameworks = 'XCTest', 'Foundation', 'UIKit'

    spec.default_subspec = 'Core'

    spec.subspec 'Core' do |sub|
      sub.resources = ['TestHelpers/Core/**/*.{xcassets,json,imageset,png,strings,stringsdict}']
      sub.source_files = 'TestHelpers/Core/**/*.{storyboard,xib,swift}'
    end

    spec.subspec 'Extra' do |sub|
      sub.resources = ['TestHelpers/Extra/**/*.{xcassets,json,imageset,png,strings,stringsdict}']
      sub.source_files = 'TestHelpers/Extra/**/*.swift'

      sub.dependency 'Nimble'
      sub.dependency 'Quick'
      sub.dependency 'NSpry_Nimble'

      sub.frameworks = 'XCTest', 'Foundation', 'UIKit'
    end

    spec.test_spec 'Tests' do |tests|
        #        tests.requires_app_host = true

        tests.dependency 'Quick'
        tests.dependency 'Nimble'
        tests.dependency 'NSpry_Nimble'

        tests.dependency 'NI18nTestHelpers/Core'
        tests.dependency 'NI18nTestHelpers/Extra'

        tests.source_files = 'Tests/**/*.swift'
        tests.resources = ['Tests/**/*.{storyboard,xib,xcassets,json,imageset,png,strings,stringsdict}']
    end
end
