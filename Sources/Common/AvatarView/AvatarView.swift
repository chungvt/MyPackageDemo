//
//  AvatarView.swift
//  enetviet
//
//  Created by Vuong Chung on 07/07/2021.
//  Copyright © 2021 QiCorp. All rights reserved.
//

import UIKit
import Kingfisher

public class AvatarView: UIView {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var labelFirstCharacter: UILabel!
    @IBOutlet var contentView: UIView!
    var didClickAvatar: (() -> Void)?
    public override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    public func fillData(avatar: String?, displayName: String?, font: UIFont? = UIFont.systemFont(ofSize: 22)) {
        self.labelFirstCharacter.text = ContactHelper.getLastCharacter(input: displayName ?? "")
        self.labelFirstCharacter.font = font
        self.setAvatar(avatar: avatar ?? "")
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed(AvatarView.className, owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.cornerRadius = self.bounds.size.height/2 
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
    private func setAvatar(avatar : String) {
        if !avatar.isEmpty, let url = URL(string: avatar) {
            avatarImageView.kf.indicatorType = .activity
            avatarImageView.kf.setImage(
                with: url,
                options: [
                    .scaleFactor(UIScreen.main.scale),
                    .transition(.fade(1)),
                    .cacheOriginalImage
                ], completionHandler:
                    { [weak self] result in
                        switch result {
                        case .success:
                            self?.showDefaultAvatar(isShow: false)
                            break
                        case .failure:
                            self?.showDefaultAvatar()
                            break
                        }
                    })
        } else {
            showDefaultAvatar()
        }
    }
    
    public func setBackgroundView(displayName: String) {
        if self.avatarImageView.isHidden {
            self.contentView.backgroundColor = .red
        }
    }
    
    private func showDefaultAvatar(isShow: Bool = true) {
        self.avatarImageView.isHidden = isShow
        labelFirstCharacter.isHidden = !isShow
        if isShow {
            self.contentView.backgroundColor = .green
        }
    }
    
    @IBAction func onTapAvatarButton(_ sender: Any) {
        if let callBack = didClickAvatar {
            callBack()
        }
    }
    
    public func getImage() -> UIImage? {
        return avatarImageView.image
    }
    
    public func clearImage() {
       avatarImageView.image = nil
    }
}
