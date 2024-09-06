//
//  DetailViewController.swift
//  SuperHeroes-iOS-RC
//
//  Created by Mañanas on 6/9/24.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var avatarImageView: UIImageView!
    var superHero: SuperHero? = nil

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
            // Aqui ponemos a traves de codigo el nombre del superheroe y la imagen.
        if let superHero = superHero {
            self.navigationItem.title = superHero.name
            avatarImageView.loadFrom(url: superHero.image.url)
        }
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
