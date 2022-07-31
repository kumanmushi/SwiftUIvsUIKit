import SwiftUI
import UIKit

enum FrameworkType: Int, CaseIterable {
    case uiKit
    case swiftUi

    var name: String {
        switch self {
        case .uiKit:
            return "UIKit"
        case .swiftUi:
            return "SwiftUI"
        }
    }
}

final class MainViewController: UITableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        FrameworkType.allCases.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = FrameworkType.allCases[indexPath.row].name
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch FrameworkType(rawValue: indexPath.row)! {
        case .uiKit:
            show(UIKitListTableViewController(), sender: nil)
        case .swiftUi:
            show(UIHostingController(rootView: SwiftUIListView(okashiList: getOkashiList())), sender: nil)
        }
    }
}
