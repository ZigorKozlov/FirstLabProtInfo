//
//  AsyViewController.swift
//  Lab1ProtectionInfo
//
//  Created by Игорь Козлов on 07.10.2020.
//  Copyright © 2020 Игорь Козлов. All rights reserved.
//

import UIKit

class AsyViewController: UIViewController {

    @IBOutlet weak var Host2Lable: UILabel!
    @IBOutlet weak var Host1Lable: UILabel!
    
    @IBOutlet weak var topLable: UILabel!
    @IBOutlet weak var Host1View: UIView!
    @IBOutlet weak var Host2View: UIView!
    
    @IBOutlet weak var lable2: UILabel!
    @IBOutlet weak var lable3: UILabel!
    @IBOutlet weak var lable4: UILabel!
    @IBOutlet weak var lalbe4: UILabel!
    @IBOutlet weak var sendsMassage: UITextField!
    @IBOutlet weak var encriptedSendsMassage: UITextField!
    
    @IBOutlet weak var encriptedGetMassage: UITextField!
    
    @IBOutlet weak var getMassage: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        Host1Lable.layer.cornerRadius = Host1Lable.frame.size.width / 50
        Host1Lable.clipsToBounds = true
        
        Host2Lable.layer.cornerRadius = Host2Lable.frame.size.width / 50
        Host2Lable.clipsToBounds = true
        
        Host1View.layer.cornerRadius = Host1View.frame.size.width / 20
        
        Host2View.layer.cornerRadius = Host2View.frame.size.width / 20
        
        topLable.layer.cornerRadius = topLable.frame.size.width / 8
        topLable.clipsToBounds = true
        
        encriptedSendsMassage.isHidden = true
        encriptedGetMassage.isHidden = true
        getMassage.isHidden = true
        
        lable2.isHidden = true
        lable3.isHidden = true;
        lable4.isHidden = true
        
        sendsMassage.placeholder = "Введите сообщение"
    }
    
    @IBAction func sendWasPressed(_ sender: Any) {
        //RSA
        let sender = HostSender()
        let receiver = HostReceiver(sender: sender)
        
        encriptedSendsMassage.isHidden = false
        encriptedGetMassage.isHidden = false
        getMassage.isHidden = false

        lable2.isHidden = false
        lable3.isHidden = false
        lable4.isHidden = false

        
        receiver.encriptedmassage =  sender.send(massage: sendsMassage.text)
        
        encriptedSendsMassage.text = String(sender.encriptedmassage ?? 0)
        
        receiver.decode()
        
        encriptedGetMassage.text = String(receiver.encriptedmassage ?? 0)
        
        getMassage.text = String(receiver.massage ?? 0)
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
