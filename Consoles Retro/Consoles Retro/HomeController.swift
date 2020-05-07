//
//  HomeController.swift
//  Consoles Retro
//
//  Created by Mathias Bouillon on 07/05/2020.
//  Copyright © 2020 Mathias Bouillon. All rights reserved.
//

import UIKit

class HomeController: UIViewController {

    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var retroIV: UIImageView!
    
    var consoles: [Console] = []
    var index = 0
    var segueID = "Detail"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Did load")
        consoles = ConsoleCollection().obtenirListe()
        let tap = UITapGestureRecognizer(target: self, action: #selector(toDetail))
        //Possible de le faire dans la vue également
        retroIV.isUserInteractionEnabled = true
        retroIV.addGestureRecognizer(tap)
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("Will appear")
        navigationController?.navigationBar.isHidden = true
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("Did appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("Will dis")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("Did dis")
        navigationController?.navigationBar.isHidden = false
    }
    
    
    
    
    
    
    
    @objc func toDetail(){
        performSegue(withIdentifier: segueID, sender: nil)
    }
    
    func setup() {
        let console = consoles[index]
        titleLabel.text = "Mes consoles Retro\n" + console.nom
        retroIV.image = console.image
        view.backgroundColor = console.couleur
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueID{
            if let controller = segue.destination as? DetailController{
                controller.console = consoles[index]
            }
        }
    }
    
    
    
    
    @IBAction func previousPressed(_ sender: Any) {
        if index == 0 {
            index = consoles.count - 1
        } else {
            index -= 1
        }
        setup()
    }
    
    @IBAction func nextPressed(_ sender: Any) {
        if index == consoles.count - 1{
            index = 0
        } else {
            index += 1
        }
        setup()
    }
    
    @IBAction func randomPressed(_ sender: Any) {
        index = Int.random(in: 0..<consoles.count)
        setup()
    }
    
    
    
}
