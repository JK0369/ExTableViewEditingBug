//
//  MyCell.swift
//  ExTableViewEditing
//
//  Created by 김종권 on 2023/05/15.
//

import UIKit

protocol MyCellDelegate: AnyObject {
    func didDisapperDeleteButton(index: Int)
}

final class MyTableViewCell: UITableViewCell {
    static let id = "MyTableViewCell"
    
    // MARK: UI
    
    override func layoutSubviews() {
        super.layoutSubviews()
        defer { lastMinX = frame.minX }
        guard isDeleteButtonDisappeared, let index else { return }
        delegate?.didDisapperDeleteButton(index: index)
    }

    // MARK: Initializer
    weak var delegate: MyCellDelegate?
    private var index: Int?
    private var lastMinX = 0.0
    private var isDeleteButtonDisappeared: Bool {
        lastMinX < 0 && 0 <= frame.minX
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.prepare(index: nil)
    }
    
    func prepare(index: Int?) {
        self.index = index
    }
}
