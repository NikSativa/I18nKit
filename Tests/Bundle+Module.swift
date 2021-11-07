import Foundation

#if !SWIFT_PACKAGE
private final class BundleFinder {
}

extension Foundation.Bundle {
    static let module: Bundle = {
        Bundle(for: BundleFinder.self)
    }()
}
#endif
