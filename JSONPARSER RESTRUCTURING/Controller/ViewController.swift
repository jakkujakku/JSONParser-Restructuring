//
//  ViewController.swift
//  JSONPARSER RESTRUCTURING
//
//  Created by (^ㅗ^)7 iMac on 2022/12/01.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainTableView: UITableView!
    
    var datalist = [Weather]() // 변수 datalist 생성
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // url String
        let jsonURLString = "https://raw.githubusercontent.com/ChoiJinYoung/iphonewithswift2/master/swift4weather.json"
        
        // url error
        guard let jsonURL = URL(string: jsonURLString) else { return }
        URLSession.shared.dataTask(with: jsonURL, completionHandler: { (data, response, error) -> Void in
            guard let data = data else { return }
            
            do {
                self.datalist = try
                JSONDecoder().decode([Weather].self, from: data)
                
                DispatchQueue.main.async {
                    self.mainTableView.reloadData()
                }
            } catch {
                print("Print error \(error.localizedDescription)")
            }
        })
        .resume()
    }
    
    

}

//MARK: - UitableViewDataSource

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datalist.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! WeatherCell
        
        var structTemp = datalist[indexPath.row]
        
        cell.countryLabel.text = structTemp.country
        let weatherStr = structTemp.weather
        
        cell.weatherLabel.text = weatherStr
        cell.temperatureLabel.text = structTemp.temperature
        
        if weatherStr == "맑음" {
            cell.imgView.image = UIImage(systemName: "sun.max")
            cell.imgView.tintColor = .red
        } else if weatherStr == "비" {
            cell.imgView.image = UIImage(systemName: "cloud.rain.fill")
            cell.imgView.tintColor = .black
        } else if weatherStr == "흐림" {
            cell.imgView.image = UIImage(systemName: "cloud")
            cell.imgView.tintColor = .gray
        } else if weatherStr == "눈" {
            cell.imgView.image = UIImage(systemName: "cloud.snow")
            cell.imgView.tintColor = .systemMint
        } else {
            cell.imgView.image = UIImage(systemName: "cloud.sleet")
            cell.imgView.tintColor = .black
        }
        return cell
    }
}
