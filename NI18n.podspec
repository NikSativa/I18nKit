Pod::Spec.new do |spec|
    spec.name         = "NI18n"
    spec.version      = "1.0.0"
    spec.summary      = "Internationalization framework"

    spec.source       = { :git => "git@bitbucket.org:tech4star/NI18n.git" }
    spec.homepage     = "https://bitbucket.org/tech4star/NI18n.git"

    spec.license          = 'MIT'
    spec.author           = { "Nikita Konopelko" => "nik.sativa@gmail.com" }
    spec.social_media_url = "https://www.facebook.com/Nik.Sativa"

    spec.ios.deployment_target = "12.0"
    spec.swift_version = '5.0'

    spec.frameworks = 'Foundation', 'UIKit'

    spec.resources = ['Source/**/*.{storyboard,xib,xcassets,json,imageset,png,strings,stringsdict}']
    spec.source_files  = 'Source/**/*.swift'
    spec.exclude_files = 'Source/**/Test/**/*.*'
end
