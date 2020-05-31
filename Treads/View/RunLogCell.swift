//
//  RunLogCell.swift
//  Treads
//
//  Created by Mohamed Adel on 5/31/20.
//  Copyright © 2020 Mohamed Adel. All rights reserved.
//

import UIKit

class RunLogCell: UITableViewCell {


   @IBOutlet weak var runDurationLabel: UILabel!
   @IBOutlet weak var totalDistancelabel: UILabel!
   @IBOutlet weak var averagePaceLabel: UILabel!
   @IBOutlet weak var dateLabel: UILabel!
   
  
   func configure(run: Run) {
       runDurationLabel.text = run.duration.formatTimeDurationToString()
       totalDistancelabel.text = "\(run.distance.metersToMiles(places: 2)) mi"
       averagePaceLabel.text = run.pace.formatTimeDurationToString()
       dateLabel.text = run.date.getDateString()
   }

   

}
