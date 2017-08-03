//
//  CalendarCollectionCell.swift
//  CalendarView
//
//  Created by LittleTwo on 2017/08/01.
//  Copyright © 2017年 LittleTwo. All rights reserved.
//

import UIKit

class CalendarCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var firstContentView: UIView!
    @IBOutlet weak var secondContentView: UIView!
    @IBOutlet weak var thirdContentView: UIView!
    @IBOutlet weak var fourthContentView: UIView!
    @IBOutlet weak var fifthContentView: UIView!
    @IBOutlet weak var sixthContentView: UIView!
    @IBOutlet var dateBtns: [UIButton]!

    override func awakeFromNib() {
        super.awakeFromNib()
        dateBtns.first
        firstContentView.viewWithTag(1)
        secondContentView.viewWithTag(8)
        // Inalization code
    }

    //Configurate Cell With Month
    func configureCell(month:Date) {
        
        var btns:[UIButton] = []
        if let btnSet = dateBtns{
            btns = btnSet
            for btn in btns {
                btn.setTitle("", for: .normal)
                btn.isHidden = true
            }
        }
        
        let calendar = Calendar.current
        var components = calendar.dateComponents([.year,.month,.day,.weekday,.weekOfMonth], from: month)
        var index = 0
        var date:Date = month
        let oneDay = 24*60*60
        
        let thisMonth = components.month
        var afterMonth = thisMonth
        while  afterMonth==thisMonth{
            print(components)
            index = index + 1
            let weekday = getDayOfWeek(index: components.weekday!)
            let weekofmonth = components.weekOfMonth
            let day = components.day
            let tag = (weekofmonth!-1)*7+weekday
            if tag<btns.count{
                let button = btns[tag]
                if let realDay = day {
                    let title = String(describing: realDay)
                    button.setTitle(title, for: .normal)
                    button.isHidden = false
                }
                
            }
            
            date = date.addingTimeInterval(TimeInterval(oneDay))
            components = calendar.dateComponents([.year,.month,.day,.weekday,.weekOfMonth], from: date)
            afterMonth = components.month
        }
    }
    
    func getDayOfWeek(index:Int) -> Int {
        var realIndex = index-1
        if realIndex<=0{
            realIndex = 7
        }
        return realIndex
    }
}
