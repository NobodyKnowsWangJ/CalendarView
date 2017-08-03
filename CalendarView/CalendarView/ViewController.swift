//
//  ViewController.swift
//  CalendarView
//
//  Created by LittleTwo on 2017/08/01.
//  Copyright © 2017年 LittleTwo. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UIScrollViewDelegate {
    
    @IBOutlet weak var dateTimeLabel: UILabel!
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var calendarCollectionView: UICollectionView!
    let Screen_Width = UIScreen.main.bounds.size.width
    var dataSource:[Date] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: Screen_Width-10, height: 120)
        flowLayout.minimumLineSpacing = 0
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.scrollDirection = .horizontal
        
        calendarCollectionView.register(UINib(nibName: "CalendarCollectionCell", bundle: nil), forCellWithReuseIdentifier: "CalendarColletionCell")
//        calendarCollectionView.register(CalendarCollectionCell.classForCoder(), forCellWithReuseIdentifier: "CalendarColletionCell")
        calendarCollectionView.setCollectionViewLayout(flowLayout, animated: false)
        calendarCollectionView.isPagingEnabled = true
        
        var date = Date()
        let calendar = Calendar.current
        var components = calendar.dateComponents([.year,.month,.day], from: date)
        let month = components.month
        for i in 0...5{
            components.setValue(month!+i, for: .month)
            date = calendar.date(from: components)!
            dataSource.append(date)
        }
    }
    
    override func viewDidLayoutSubviews() {
        calendarCollectionView.scrollToItem(at: IndexPath(item: 2, section: 0), at: .bottom, animated: true)
    }
    
    //MARK: -UICollectionViewDelegate/UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:CalendarCollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CalendarColletionCell", for: indexPath) as! CalendarCollectionCell
        let date = dataSource[indexPath.row]
        cell.configureCell(month: date)
        return cell
    }
    
    
    
    @IBAction func showPreMonth(_ sender: UIButton) {
    }
    
    @IBAction func showAfterMonth(_ sender: UIButton) {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

