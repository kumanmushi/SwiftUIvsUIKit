import Kingfisher
import SnapKit
import UIKit

final class UIKitListTableViewController: UITableViewController {
    let okashiList: [Okashi]

    init(okashiList: [Okashi]) {
        self.okashiList = okashiList
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = FrameworkType.uiKit.name

        tableView.contentInset.top = 8
        tableView.separatorInset.left = .greatestFiniteMagnitude
        tableView.register(OkashiTableCell.self, forCellReuseIdentifier: "OkashiTableCell")
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        okashiList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OkashiTableCell", for: indexPath) as! OkashiTableCell
        cell.configure(okashi: okashiList[indexPath.row])
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        UIApplication.shared.open(URL(string: okashiList[indexPath.row].url)!)
    }
}

final class OkashiTableCell: UITableViewCell {
    let okashiImageView: UIImageView = {
        $0.contentMode = .scaleAspectFit
        $0.backgroundColor = .black
        $0.layer.cornerRadius = 2
        return $0
    }(UIImageView())

    let nameLabel: UILabel = {
        $0.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        $0.textColor = .init(hex: "333333")
        $0.numberOfLines = 0
        return $0
    }(UILabel())

    let makerLabel: UILabel = {
        $0.font = UIFont.systemFont(ofSize: 11)
        $0.textColor = .init(hex: "777777")
        $0.numberOfLines = 0
        return $0
    }(UILabel())

    lazy var contentStackView: UIStackView = {
        $0.axis = .horizontal
        $0.alignment = .center
        $0.spacing = 16
        return $0
    }(UIStackView(arrangedSubviews: [okashiImageView, labelStackView]))

    lazy var labelStackView: UIStackView = {
        $0.axis = .vertical
        $0.spacing = 5
        return $0
    }(UIStackView(arrangedSubviews: [nameLabel, makerLabel]))

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        addSubview(contentStackView)

        contentStackView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(8)
            make.leading.trailing.equalToSuperview().inset(16)
        }

        okashiImageView.snp.makeConstraints { make in
            make.size.equalTo(72)
        }
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
    }

    func configure(okashi: Okashi) {
        okashiImageView.kf.setImage(with: URL(string: okashi.image))
        nameLabel.text = okashi.name
        makerLabel.text = okashi.maker
    }
}
