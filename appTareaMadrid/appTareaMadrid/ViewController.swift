//
//  ViewController.swift
//  appTareaMadrid
//
//  Created by DAMII on 20/09/23.
//

import UIKit
import DropDown
import Toaster

class ViewController: UIViewController {
    
    let dropDown = DropDown()

    
    @IBOutlet weak var txtCantidadninos: UITextField!
    @IBOutlet weak var txtCantidadAdultos: UITextField!
    @IBOutlet weak var txtCliente: UITextField!
    
    @IBOutlet weak var btnComedias: UIButton!
    
    @IBOutlet weak var btnDramaticas: UIButton!
    
    
    var cliente = ""
    
    var cantAdulto=0.0
    var catNino=0.0
    var totalPagar=0.0
    var costAdulto=0.0
    var costNino=0.0
    var totalAdult=0.0
    var totalNino=0.0
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        //cargar imagenes en los radios
        btnComedias.setImage(UIImage.init(named: "radio_off"), for: .normal)
        btnComedias.setImage(UIImage.init(named: "radio_on"), for: .selected)
        btnDramaticas.setImage(UIImage.init(named: "radio_off"), for: .normal)
        btnDramaticas.setImage(UIImage.init(named: "radio_on"), for: .selected)
    }
    
    
    override func  prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let  vc = segue.destination as! DetalleController
        vc.cantAdulto=cantAdulto
        vc.catNino=catNino
        vc.costAdulto=costAdulto
        vc.costNino=costNino
    }
    
    
    
    //funcion para ir a la otra pantalla
    @IBAction func btnProcesar(_ sender: UIButton) {
        let main = UIStoryboard(name: "Main", bundle: nil)
        
        let pantalla2 = main.instantiateViewController(withIdentifier: "detalleID") as! DetalleController
        present(pantalla2,animated: true)
        
        
        cliente = txtCliente.text ?? ""
        cantAdulto = Double(txtCantidadAdultos.text ?? "0") ?? 0.0
        catNino = Double(txtCantidadninos.text ?? "0") ?? 0.0
        
        //variable para la img
        var nompeli=""
        var popeli=0
        
        
        nompeli=dropDown.selectedItem ?? ""
        popeli=dropDown.indexForSelectedRow ?? -1
        
        if btnComedias.isSelected{
            if popeli==0{
                pantalla2.imgPelicula.image=UIImage(named: "supercool")
                costAdulto=35.5
                costNino=costAdulto-10
                totalAdult=costAdulto*cantAdulto
                totalNino=costNino*catNino
                totalPagar=totalAdult+totalNino
                
            }else if popeli==1{
                pantalla2.imgPelicula.image=UIImage(named: "quepasoayer")
                costAdulto=32.5
                costNino=costAdulto-10
                totalAdult=costAdulto*cantAdulto
                totalNino=costNino*catNino
                totalPagar=totalAdult+totalNino
            }
        }
        else{
            if popeli==0{
                pantalla2.imgPelicula.image=UIImage(named: "loimposible")
                costAdulto=30.5
                costNino=costAdulto-10
                totalAdult=costAdulto*cantAdulto
                totalNino=costNino*catNino
                totalPagar=totalAdult+totalNino
            }
            else if popeli==1{
                pantalla2.imgPelicula.image=UIImage(named: "12aniosesclavitud")
                costAdulto=28.3
                costNino=costAdulto-10
                totalAdult=costAdulto*cantAdulto
                totalNino=costNino*catNino
                totalPagar=totalAdult+totalNino
            }
            else{
                pantalla2.imgPelicula.image=UIImage(named: "cruzada")
                costAdulto=25.5
                costNino=costAdulto-10
                totalAdult=costAdulto*cantAdulto
                totalNino=costNino*catNino
                totalPagar=totalAdult+totalNino
            }
        }
        
        
        
        Toast(text: "Nombre pelicula: "+nompeli).show()
        
        
        
        
        //mostrar los label en la segunda pantalla
        pantalla2.lblCliente.text = txtCliente.text
        pantalla2.lblCantidadAsientosAdultos.text = txtCantidadAdultos.text
        pantalla2.lblCantidadAsientosNinos.text = txtCantidadninos.text
        pantalla2.lblGenero.text = btnComedias.isSelected ? "Comedia":"Dramatica"
        pantalla2.lblPelicula.text = nompeli
        
        pantalla2.lblMontoAdulto.text = String(totalAdult)
        pantalla2.lblMontoNinos.text = String(totalNino)
        pantalla2.lblTotalPagar.text = String(totalPagar)
    }
     
    
    //funcion para los 2 radios radios
    @IBAction func radioBtn(_ sender: UIButton) {
        
        if sender == btnComedias{
            btnComedias.isSelected = true
            btnDramaticas.isSelected = false
            dropDown.dataSource = ["Super Cool", "Que paso ayer?"]
            
            

        }else{
            btnComedias.isSelected = false
            btnDramaticas.isSelected = true
            dropDown.dataSource = ["Lo imposible", "12 anios de exclavitud", "Historias cruzadas"]
        }
        
    }
    
    @IBAction func btnCombo(_ sender: UIButton) {
        //vincular el objeto dropdown con el boton
        dropDown.anchorView = sender
        //mancho de la lista
        dropDown.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)!)
        //mostrar lista
        dropDown.show()
        //evento cuando se selecciona un jugador
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            print("Selected item: \(item) at index: \(index)")
            sender.setTitle(item, for: .normal)
        }
    }
    
}

