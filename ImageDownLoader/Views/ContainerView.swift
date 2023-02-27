//
//  ImageLoadView.swift
//  ImageDownLoader
//
//  Created by 이준복 on 2023/02/27.
//

import UIKit
import SnapKit

final class ContainerView: UIView {
    
    let networkManager = NetworkManager.shared

    lazy var loadImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "photo")
        return imageView
    }()
    
    lazy var progressView: UIProgressView = {
        let progressView = UIProgressView()
        progressView.progress = 0.5
        return progressView
    }()
    
    lazy var loadButton: UIButton = {
        let button = UIButton(configuration: UIButton.Configuration.filled())
        button.setTitle("Load", for: .normal)
        button.addTarget(self, action: #selector(loadButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        addSubview(loadImageView)
        addSubview(progressView)
        addSubview(loadButton)
        
        loadImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(5)
            $0.bottom.equalToSuperview().offset(-5)
            $0.leading.equalToSuperview().offset(20)
            $0.width.equalTo(100)
            $0.height.equalTo(70)
        }
        
        progressView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(loadImageView.snp.trailing).offset(10)
        }
        
        loadButton.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(progressView.snp.trailing).offset(10)
            $0.trailing.equalToSuperview().offset(-20)
        }
        
    }
    
    @objc func loadButtonTapped() {
        loadImageView.image = UIImage(systemName: "photo")
        networkManager.getImage { [weak self] image in
            guard let image = image, let self = self else { return }
            DispatchQueue.main.async {
                self.loadImageView.image = image
            }
        }
    }
    
    
}


