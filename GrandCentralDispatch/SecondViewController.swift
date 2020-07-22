//
//  SecondViewController.swift
//  GrandCentralDispatch
//
//  Created by yurik on 7/21/20.
//  Copyright © 2020 yurik. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    fileprivate var imageURL: URL?
    fileprivate var image: UIImage? {
        get{
            return imageView.image
        }
        set{
            
            activityIndicator.startAnimating()
            activityIndicator.isHidden = true
            imageView.image = newValue
            imageView.sizeToFit()
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchImage()
        // Do any additional setup after loading the view.
    }
    
    //метод для загрузки изображения
    fileprivate func fetchImage () {
        imageURL = URL(string: "https://thumbs.dreamstime.com/z/bright-balls-14145086.jpg")
       //перед загрузкой запускаем activityIndicator
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        guard let url = imageURL, let imageData = try? Data (contentsOf: url) else {return}
        self.image = UIImage(data: imageData)
     
        /* if let url = imageURL {
            let imageData = try? Data(contentsOf: url)
            if imageData != nil{
                self.image = UIImage(data: imageData!)
            } else {
                self.image = nil
            }
        }
  */
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
