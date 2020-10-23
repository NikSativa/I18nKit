Pod::Spec.new do |spec|
    spec.name         = "NI18n"
    spec.version      = "1.0.0"
    spec.summary      = "Internationalization framework"

    spec.source       = { :git => "git@github.com:NikSativa/NI18n.git" }
    spec.homepage     = "https://github.com/NikSativa/NI18n"

    spec.license          = 'MIT'
    spec.author           = { "Nikita Konopelko" => "nik.sativa@gmail.com" }
    spec.social_media_url = "https://www.facebook.com/Nik.Sativa"

    spec.ios.deployment_target = "11.0"
    spec.swift_version = '5.0'

    spec.frameworks = 'Foundation', 'UIKit'

    spec.resources = ['Source/**/*.{storyboard,xib,xcassets,json,imageset,png,strings,stringsdict}']
    spec.source_files  = 'Source/**/*.swift'
end
