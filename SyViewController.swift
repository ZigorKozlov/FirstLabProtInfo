//
//  SyViewController.swift
//  Lab1ProtectionInfo
//
//  Created by Игорь Козлов on 07.10.2020.
//  Copyright © 2020 Игорь Козлов. All rights reserved.
//

import UIKit



class SyViewController: UIViewController {

    let shift = 10
    
    @IBOutlet weak var Host2Lable: UILabel!
    @IBOutlet weak var Host1Lable: UILabel!
    @IBOutlet weak var Host1View: UIView!
    @IBOutlet weak var Host2View: UIView!
    
    @IBOutlet weak var topLable: UILabel!
    //Sends TextFields
    @IBOutlet weak var sendsMassage: UITextField!
    @IBOutlet weak var encriptedSendsMassage: UITextField!
    //Gets textField
    @IBOutlet weak var encriptedGetMassage: UITextField!
    @IBOutlet weak var getMassage: UITextField!
    
    //Lables
    @IBOutlet weak var sendsLables: UILabel!
    @IBOutlet weak var lable2: UILabel!
    @IBOutlet weak var lable3: UILabel!
    @IBOutlet weak var lable4: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        Host1Lable.layer.cornerRadius = Host1Lable.frame.size.width / 50
        Host1Lable.clipsToBounds = true
        
        Host2Lable.layer.cornerRadius = Host2Lable.frame.size.width / 50
        Host2Lable.clipsToBounds = true
        
        topLable.layer.cornerRadius = topLable.frame.size.width / 8
        topLable.clipsToBounds = true
        
        Host1View.layer.cornerRadius = Host1View.frame.size.width / 20
        Host1View.clipsToBounds = true
        
        Host2View.layer.cornerRadius = Host2View.frame.size.width / 20
        Host2View.clipsToBounds = true
        
        encriptedSendsMassage.isHidden = true
        encriptedGetMassage.isHidden = true
        getMassage.isHidden = true
        
        lable2.isHidden = true
        lable3.isHidden = true;
        lable4.isHidden = true
        
        sendsMassage.placeholder = "Введите сообщение"
    }
    
    @IBAction func sendPressed(_ sender: Any) {
        
        send(massage: sendsMassage.text ?? "")
    }
    
    func send( massage: String) {
        var resultString = ""
        
        //
        for sym in massage {
            //Получение кода ascii кода символа
            let a = Int(sym.unicodeScalars.first!.value)
            //
            resultString +=  String( UnicodeScalar( UInt8((a + shift) % 255) )  )
        }
        
        lable2.isHidden = false
        encriptedSendsMassage.isHidden = false
        encriptedSendsMassage.text = resultString
        
        //ТипА отправляем сообщение resultString))
        lable3.isHidden = false
        encriptedGetMassage.isHidden = false
        encriptedGetMassage.text = resultString
        
        var getResultString = ""
        //Дешифровка
        for sym in resultString {
        //Получение кода ascii кода символа
            let a = Int(sym.unicodeScalars.first!.value)
            //
            getResultString +=  String( UnicodeScalar( UInt8((a - shift + 255) % 255) )  )
            
        }
        
        lable4.isHidden = false
        getMassage.isHidden = false
        getMassage.text = getResultString
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
