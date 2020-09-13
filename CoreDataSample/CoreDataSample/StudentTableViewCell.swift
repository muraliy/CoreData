//
//  StudentTableViewCell.swift
//  CoreDataSample
//
//  Created by Murali Yarramsetti on 08/08/20.
//  Copyright © 2020 Murali Yarramsetti. All rights reserved.
//

import UIKit

class StudentTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLbl : UILabel!
    @IBOutlet weak var rollnumLbl : UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func displaydata(student: User){
        nameLbl.text = student.name
        rollnumLbl.text = "\(student.email)"
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
