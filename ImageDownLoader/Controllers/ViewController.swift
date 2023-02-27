//
//  ViewController.swift
//  ImageDownLoader
//
//  Created by 이준복 on 2023/02/27.
//

import UIKit
import SwiftUI
import SnapKit

class ViewController: UIViewController {
    
    let networkManager = NetworkManager.shared
    
    lazy var containerViews: [ContainerView] = {
       return [firstCotainerView, secondCotainerView, thirdCotainerView, fourthCotainerView, fifthCotainerView]
    }()
    
    lazy var firstCotainerView: ContainerView = {
        let view = ContainerView()
        return view
    }()
    
    lazy var secondCotainerView: ContainerView = {
        let view = ContainerView()
        return view
    }()
    
    lazy var thirdCotainerView: ContainerView = {
        let view = ContainerView()
        return view
    }()
    
    lazy var fourthCotainerView: ContainerView = {
        let view = ContainerView()
        return view
    }()
    
    lazy var fifthCotainerView: ContainerView = {
        let view = ContainerView()
        return view
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: containerViews)
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 20
        return stackView
    }()
    
    lazy var loadAllImagesButton: UIButton = {
        let button = UIButton(configuration: UIButton.Configuration.filled())
        button.setTitle("Load All Images", for: .normal)
        button.addTarget(self, action: #selector(allButtonTapped), for: .touchUpInside)
        return button
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
        
    }

}

// MARK: - func
extension ViewController {
    @objc func allButtonTapped() {
        containerViews.forEach {
            $0.loadButtonTapped()
        }
    }
    
    
}


// MARK: - AutoLayout
extension ViewController {
    func setupConstraints() {
        view.addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.leading.trailing.top.equalTo(view.safeAreaLayoutGuide)
        }
        
        view.addSubview(loadAllImagesButton)
        loadAllImagesButton.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(10)
            $0.trailing.equalToSuperview().offset(-10)
            $0.top.equalTo(stackView.snp.bottom).offset(5)
        }
    }
}


// MARK: - SwiftUI를 활용한 미리보기
struct ViewController_Previews: PreviewProvider {
    static var previews: some View {
        Container().edgesIgnoringSafeArea(.all)
    }
    
    struct Container: UIViewControllerRepresentable {
        
        typealias UIViewControllerType = UIViewController
        
        func makeUIViewController(context: Context) -> UIViewController {
            let ViewController = ViewController()
            return UINavigationController(rootViewController: ViewController)
        }
        
        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
    }
}
