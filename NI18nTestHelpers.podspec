Pod::Spec.new do |spec|
    spec.name         = "NI18nTestHelpers"
    spec.version      = "1.0.0"
    spec.summary      = "Internationalization framework"

    spec.source       = { :git => "git@gitlab.com:gncore/NI18n.git" }
    spec.homepage     = "https://gitlab.com/gncore/NI18n.git"

    spec.license          = 'MIT'
    spec.author           = { "Nikita Konopelko" => "nik.sativa@gmail.com" }
    spec.social_media_url = "https://www.facebook.com/Nik.Sativa"

#    spec.ios.deployment_target = "11.0"
#    spec.swift_version = '5'

    spec.source_files  = 'Test/**/*.swift'
    spec.exclude_files = 'Test/**/*Spec.swift', 'Source/**/*.swift'

    spec.dependency 'Nimble'
    spec.dependency 'Spry'
    spec.dependency 'Quick'
    spec.dependency 'Spry+Nimble'

    spec.frameworks = 'XCTest', 'Foundation'

    spec.dependency 'NI18n/Swinject'

    spec.test_spec 'Tests' do |tests|
#        tests.requires_app_host = true
        tests.source_files = 'Test/**/*Spec.swift'
    end
end
