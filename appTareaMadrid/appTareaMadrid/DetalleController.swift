//
//  DetalleController.swift
//  appTareaMadrid
//
//  Created by DAMII on 20/09/23.
//

import UIKit

class DetalleController: UIViewController {
    @IBOutlet weak var lblCliente: UILabel!
    @IBOutlet weak var lblGenero: UILabel!
    @IBOutlet weak var lblPelicula: UILabel!
    
    
    @IBOutlet weak var lblCantidadAsientosAdultos: UILabel!
    
    @IBOutlet weak var lblCantidadAsientosNinos: UILabel!
    
    @IBOutlet weak var imgPelicula: UIImageView!
    
    
    @IBOutlet weak var lblMontoAdulto: UILabel!
    
    @IBOutlet weak var lblMontoNinos: UILabel!
    
    @IBOutlet weak var lblTotalPagar: UILabel!
    
    //variables para la operacion
    var cantAdulto:Double=0.0
    var catNino:Double=0.0
    var total:Double=0.0
    var costAdulto:Double=0.0
    var costNino:Double=0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    
    @IBAction func btnVolver(_ sender: UIButton) {
        
        let main = UIStoryboard(name: "Main", bundle: nil)
        
        let pantalla2 = main.instantiateViewController(withIdentifier: "principal") //as! DetalleController
        present(pantalla2,animated: true)
    }
    
}
