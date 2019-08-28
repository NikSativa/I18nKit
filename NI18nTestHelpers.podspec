Pod::Spec.new do |spec|
    spec.name         = "NI18nTestHelpers"
    spec.version      = "1.0.0"
    spec.summary      = "Internationalization framework"

    spec.source       = { :git => "git@bitbucket.org:tech4star/NI18n.git" }
    spec.homepage     = "https://bitbucket.org/tech4star/NI18n.git"

    spec.license          = 'MIT'
    spec.author           = { "Nikita Konopelko" => "nik.sativa@gmail.com" }
    spec.social_media_url = "https://www.facebook.com/Nik.Sativa"

    spec.ios.deployment_target = "12.0"
    spec.swift_version = '5.0'

    spec.resources = ['Source/**/Test*.{storyboard,xib,xcassets,json,imageset,png,strings,stringsdict}']
    spec.source_files  = 'Source/**/Test*.swift',
                         'Source/**/Fake*.swift',
                         'Source/**/*+TestHelper.swift'
    spec.exclude_files = 'Source/**/*Spec.*'

    spec.dependency 'Nimble'
    spec.dependency 'Spry'
    spec.dependency 'Quick'
    spec.dependency 'Spry+Nimble'
    
    spec.dependency 'NI18n'

    spec.frameworks = 'XCTest', 'Foundation', 'UIKit'

    spec.test_spec 'Tests' do |tests|
        #        tests.requires_app_host = true
        tests.source_files = 'Source/**/*Spec.swift'
        tests.exclude_files = 'Source/**/Test*.*',
                              'Source/**/Fake*.*',
                              'Source/**/*+TestHelper.*'
    end
end
