//
//  ViewController.swift
//  AlSample
//
//  Created by Gnaneswar on 6/24/19.
//  Copyright © 2019 Gnaneswar. All rights reserved.
//  
import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

    var nameArr = [String]()
    var imgArr = [String]()
    @IBOutlet weak var table: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //3456
        //UserDefaults.standard.set("https://rss.itunes.apple.com/api/v1/us/apple-music/hot-tracks/all/10/explicit.json", forKey: Keys.music)
    alamoF()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func alamoF()
    {
        Alamofire.request(UserDefaults.standard.string(forKey: Keys.music)!).responseJSON { (responseData) in
            if let JSON = responseData.result.value as? [String:Any] {
               // print(JSON)
                if let json = JSON["feed"] as? [String:Any],let result = json["results"] as? [[String:Any]]
                {
                    for i in 0..<result.count
                    {
                        self.nameArr.append("\(result[i]["name"]!)")
                        self.imgArr.append("\(result[i]["artworkUrl100"]!)")
                    }
                    self.table.reloadData()
                }
            }
//            if responseData.result.value != nil
//            {
//                 let swiftyJson = JSON(responseData.result.value!)
//                    print(swiftyJson)
//                if let resData = swiftyJson["feed"].dictionary
//                {
//                    print(resData)
//                }
//            }
        }
    }

}

extension ViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        cell.name.text = nameArr[indexPath.row]
        let url = URL(string: imgArr[indexPath.row])
        let data = try? Data(contentsOf: url!)
        cell.img.image = UIImage(data: data!)
        return cell
    }
    
    
}

