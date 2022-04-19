//
//  PopupListView.swift
//  CleanSwiftArchitecture
//
//  Created by cw-james on 2022/04/05.
//

import UIKit
import SnapKit
import Then

protocol PopupListViewDelegate: AnyObject {
    func didClickPopupButton(_ view: PopupListView, _ popup: Popup)
}

class PopupListView: UIView {
    // MARK: - Variables
    var viewModel: Home.ShowPopoup.ViewModel
    weak var delegate: PopupListViewDelegate?
    
    // MARK: - UI Components
    var scrollView: UIScrollView!
    var stackView: UIStackView!
    
    // MARK: - Methods
    init(frame: CGRect, viewModel: Home.ShowPopoup.ViewModel) {
        self.viewModel = viewModel
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        setupScrollView()
        setupStackView()
        setupPopupButton()
    }
    
    func setupScrollView() {
        scrollView = UIScrollView().then {
            self.addSubview($0)
            $0.backgroundColor = .white
            $0.bounces = false
        }
        
        scrollView.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    func setupStackView() {
        stackView = UIStackView().then {
            scrollView.addSubview($0)
            $0.axis = .vertical
            $0.distribution = .fillEqually
            $0.alignment = .fill
        }
        
        stackView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.bottom.lessThanOrEqualToSuperview()
            $0.width.equalToSuperview()
        }
    }
    
    func setupPopupButton() {
        viewModel.popups.enumerated().forEach { (index, popup) in
            let button = UIButton().then {
                stackView.addArrangedSubview($0)
                $0.setTitle(popup.id, for: .normal)
                $0.setTitleColor(.black, for: .normal)
                $0.tag = index
                $0.addTarget(self, action: #selector(onClickPopupButton(sender:)), for: .touchUpInside)
            }
            
            button.snp.makeConstraints {
                $0.height.equalTo(50)
            }
        }
    }
    
    // MARK: - IBActions
    @objc func onClickPopupButton(sender: UIButton) {
        delegate?.didClickPopupButton(self, viewModel.popups[sender.tag])
    }
}
