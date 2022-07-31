import iOSSnapshotTestCase
import Kingfisher
import OHHTTPStubsSwift
import SwiftUI
@testable import SwiftUIvsUIKit

final class SwiftUIvsUIKitTests: FBSnapshotTestCase {
    var window: UIWindow!

    override func setUp() {
        super.setUp()

        recordMode = false

        Kingfisher.ImageCache.default.clearCache()

        stub(condition: isHost("sysbird.jp")) { _ in
            fixture(
                filePath: Bundle(for: type(of: self)).path(forResource: "empty", ofType: "json")!,
                headers: ["Content-Type": "application/json"]
            )
        }
        window = UIWindow(
            frame: UIScreen.main.bounds
        )
        window.makeKeyAndVisible()
    }

    func test_UIKit() {
        verify(vc: UIKitListTableViewController(okashiList: getOkashiList()))
    }

    func test_SwiftUI() {
        verify(vc: UIHostingController(rootView: SwiftUIListView(okashiList: getOkashiList())))
    }

    private func verify(vc: UIViewController) {
        window.rootViewController = UINavigationController(rootViewController: vc)
        FBSnapshotVerifyView(window, overallTolerance: 0.05)
    }
}
