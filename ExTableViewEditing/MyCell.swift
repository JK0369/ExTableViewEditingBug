//
//  MyCell.swift
//  ExTableViewEditing
//
//  Created by 김종권 on 2023/05/15.
//

import UIKit

protocol MyCellDelegate: AnyObject {
    func willDisapperDeleteButton(index: Int)
}

final class MyTableViewCell: UITableViewCell {
    static let id = "MyTableViewCell"
    
    // MARK: UI
    override func layoutSubviews() {
        super.layoutSubviews()
        defer { lastMinX = frame.minX }
        guard deleteButtonDisappeared, let index else { return }
        delegate?.willDisapperDeleteButton(index: index)
    }

    // MARK: Properties
    weak var delegate: MyCellDelegate?
    private var index: Int?
    private var lastMinX = 0.0
    private var deleteButtonDisappeared: Bool {
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
