//
//  LIstViewController.swift
//  SuperHeroes-iOS-RC
//
//  Created by Mañanas on 5/9/24.
//

import UIKit

class ListViewController: UIViewController, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var superHeroList: [SuperHero] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    
        tableView.dataSource = self
        
        /*SuperHeroProvider.findSuperHeroesByName("Super", withResult: { results in
            self.superHeroList = results
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }) */
        
            // Aqui hacemos la llamada a la funcion await con async, que esta en SuperHeroProvider.
        Task {
            let results = try? await SuperHeroProvider.findSuperHeroesByName("Super")
            
            self.superHeroList = results!
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return superHeroList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SuperHeroViewCell
        
        let superHero = superHeroList[indexPath.row]
        
        cell.render(superHero: superHero)
        
        return cell
    }
    

    
}
