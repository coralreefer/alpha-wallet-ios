//
//  NFTAssetSelectionSectionHeaderView.swift
//  AlphaWallet
//
//  Created by Vladyslav Shepitko on 16.11.2021.
//

import UIKit

protocol NFTAssetSelectionSectionHeaderViewDelegate: class {
    func didSelectAll(in view: NFTAssetSelectionViewController.NFTAssetSelectionSectionHeaderView)
}
protocol SelectionPositioningView: class {
    var positioningView: UIView { get }
}

extension NFTAssetSelectionViewController {

    class NFTAssetSelectionSectionHeaderView: UITableViewHeaderFooterView, SelectAllAssetsViewDelegate {

        private lazy var selectAllAssetsView: SelectAllAssetsView = {
            let view = SelectAllAssetsView()
            view.delegate = self

            return view
        }()

        private var topSeparatorView: UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false

            return view
        }()

        var section: Int?
        weak var delegate: NFTAssetSelectionSectionHeaderViewDelegate?

        override init(reuseIdentifier: String?) {
            super.init(reuseIdentifier: reuseIdentifier)

            addSubview(selectAllAssetsView)
            addSubview(topSeparatorView)

            NSLayoutConstraint.activate([
                selectAllAssetsView.anchorsConstraint(to: self, edgeInsets: .init(top: GroupedTable.Metric.cellSeparatorHeight, left: 0, bottom: GroupedTable.Metric.cellSeparatorHeight, right: 0)),

                topSeparatorView.centerXAnchor.constraint(equalTo: centerXAnchor),
                topSeparatorView.widthAnchor.constraint(equalTo: widthAnchor),
                topSeparatorView.heightAnchor.constraint(equalToConstant: GroupedTable.Metric.cellSeparatorHeight),
                topSeparatorView.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])
        }

        required init?(coder: NSCoder) {
            return nil
        }

        func configure(viewModel: NFTAssetSelectionSectionHeaderViewModel) {
            topSeparatorView.backgroundColor = viewModel.separatorColor
            selectAllAssetsView.configure(viewModel: viewModel.selectAllAssetsViewModel)
        }

        func selectAllSelected(in view: NFTAssetSelectionViewController.SelectAllAssetsView) {
            delegate?.didSelectAll(in: self)
        }
    }

    struct NFTAssetSelectionSectionHeaderViewModel {
        let text: String
        var selectAllAssetsViewModel: SelectAllAssetsViewModel
        var separatorColor: UIColor = GroupedTable.Color.cellSeparator
        var backgroundColor: UIColor = Colors.appWhite
        let tokenHolder: TokenHolder
        var isSelectAllHidden: Bool = false

        init(tokenHolder: TokenHolder, backgroundColor: UIColor = Colors.appWhite) {
            self.tokenHolder = tokenHolder
            self.text = tokenHolder.name
            self.backgroundColor = backgroundColor
            self.selectAllAssetsViewModel = .init(text: text, backgroundColor: backgroundColor, isSelectAllHidden: isSelectAllHidden)
        }
    }
}

