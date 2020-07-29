//
//  RestarentCollectionView.swift
//  RestarentProject
//
//  Created by Jayalakshmi NP on 28/07/20.
//  Copyright © 2020 natarajan k. All rights reserved.
//

import UIKit

extension  UIImageView {
    func downloadedfrom(url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {  // for swift 4.2 syntax just use ===> mode: UIView.ContentMode
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
            }.resume()
    }
    func downloadedfrom(link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {  // for swift 4.2 syntax just use ===> mode: UIView.ContentMode
        guard let url = URL(string: link) else { return }
        downloadedfrom(url: url, contentMode: mode)
    }
}


class RestarentCollectionVC: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    var restarents = [Restarents]()
//    var rest :[UIImage] = [UIImage(named: "Note")!]
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getRestarents()
//        collectionView.collectionViewLayout.invalidateLayout()


    }
    
    func getRestarents(){
        guard let url = URL(string: "https://s3.amazonaws.com/br-codingexams/restaurants.json") else {return}

        let session = URLSession.shared
        let dataTask = session.dataTask(with: url) { (data,_, error) in
            if let error = error {
                print(error)
            } else if let data = data {
                do{
                    //                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    //                                    print(json)
                    let decoded = try JSONDecoder().decode((JSONStructure.self), from: data)
                    self.restarents = decoded.restaurants
                    print(decoded)

                    print(data)

                    //
                }catch{
                    print(error)
                }
                DispatchQueue.main.async {
                    self.collectionView.reloadData()

                }
            }

        }
        dataTask.resume()
    }
//
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return restarents.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard  let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "restarentCell", for: indexPath) as? RestarentCell else {return UICollectionViewCell()}
        let restarent = restarents[indexPath.item]
        
        cell.restarentImage.contentMode = .scaleAspectFit
        let defaultLink = "\(restarent.backgroundImageURL)"
//        let completeLink = defaultLink + restarent.backgroundImageURL
        cell.restarentImage.downloadedfrom(link: defaultLink)
        cell.restarentName.text = restarent.name
        cell.categoryType.text = restarent.category
//        cell.restarentImage.image = restarents[indexPath.row]
        return cell
    }
    
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let height : CGFloat = 240
//        let width = (collectionView.frame.width/2) - 2
//        let size = CGSize(width: width, height: height)
//        return size
        let height:CGFloat = 200
        let width:CGFloat =  411
        let size = CGSize(width: width, height: height)
        return size
    }
    
   func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "restarentCollectionVcToLunchVC", sender: restarents[indexPath.row])
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let lunchVC = segue.destination as? LunchVC,let restarents = sender as? Restarents{
            lunchVC.restarents = restarents
        }
    }
    
    
    
    
    

}
