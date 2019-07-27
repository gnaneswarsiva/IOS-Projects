//
//  ViewController.swift
//  DropDown
//
//  Created by Gnaneswar on 5/18/19.
//  Copyright © 2019 Gnaneswar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var selectBtn: UIButton!
    @IBOutlet var cities: [UIButton]!
    @IBOutlet weak var dropBtn: UIButton!
    @IBOutlet weak var table: UITableView!
    
    var fruits = ["Apple","Mango","Banana","Grape","Orange","Cherry"]
    override func viewDidLoad() {
        super.viewDidLoad()
        table.isHidden = true
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func selectBtn(_ sender: UIButton)
    {
        cities.forEach { (button) in
            UIView.animate(withDuration: 0.5, animations: {
                button.isHidden = !button.isHidden
                self.view.layoutIfNeeded()
            })
            
        }
    }
    
    enum City:String {
        case hyd = "Hyderabad"
        case bang = "Bangalore"
    }
    
    @IBAction func cityAct(_ sender: UIButton) {
        selectBtn.titleLabel?.text = sender.titleLabel?.text
        cities.forEach { (button) in
            UIView.animate(withDuration: 0.5, animations: {
                button.isHidden = !button.isHidden
                self.view.layoutIfNeeded()
            })
        }
        guard let title = sender.currentTitle, let cit = City(rawValue:title) else {
            return
        }
        
        switch cit {
        case .hyd:
            print("Hyderabad")
        default:
            print("Bangalore")
        }
    }
    @IBAction func dropAct(_ sender: UIButton) {
        UIView.animate(withDuration: 0.3) {
            self.table.isHidden = !self.table.isHidden
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fruits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "a", for: indexPath)
        cell.textLabel?.text = fruits[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dropBtn.setTitle("\(fruits[indexPath.row])", for: .normal)
        UIView.animate(withDuration: 0.3) {
            self.table.isHidden = !self.table.isHidden
        }
    }
    
}
