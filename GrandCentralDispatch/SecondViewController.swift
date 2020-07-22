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
        imageURL = URL(string: "https://i.pinimg.com/originals/ff/c8/80/ffc880cba3e810d0a216f493531fdcf8.png")
       //перед загрузкой запускаем activityIndicator
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        
        //создаем отдельный поток для  процесса загрузки
        //создаем очередь
        let queeu = DispatchQueue.global(qos: .utility)
        // добавляем процесс в очередь
        queeu.async {
            guard let url = self.imageURL, let imageData = try? Data (contentsOf: url) else {return}
            //возвращаеемся в основной поток
            DispatchQueue.main.async {
                
                self.image = UIImage(data: imageData)
            }
            
        }
        
     
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
