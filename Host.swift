//
//  Host.swift
//  Lab1ProtectionInfo
//
//  Created by Игорь Козлов on 08.10.2020.
//  Copyright © 2020 Игорь Козлов. All rights reserved.
//

import Foundation





func myPow(_ a:UInt64, _ b: UInt64)-> UInt64 {
    var res: UInt64 = 1
    for _ in 0..<b {
        res *= a
    }
    return res
}


class HostSender{
    var encriptedmassage: UInt64?
    
    //Открытый ключ e и n
    var e: UInt64?
    var n: UInt64!
    
    func send(massage: String?)-> UInt64{
        guard let massage = massage else { return 0 }
        //Отправляем зашифрованное сообщение
        if let massage = UInt64(massage){
            
            encriptedmassage =  myPow( massage, e ?? 0) % n
            return encriptedmassage!
        } else {
            return 0
        }

    }
    
}

class HostReceiver{
    var massage: UInt64?
    var encriptedmassage: UInt64?
    
    //Получаем 2 случайных простых числа
    private var p1 = 5
    private var p2 = 7
    private var φ: UInt64
    private var d: UInt64
    
    var N: UInt64
    var e: UInt64 = 13
    
    
    init(sender: HostSender) {
        
        
        N = UInt64 (p1 * p2)
        
        //выч значение функции Эйлера от n
        φ = (UInt64(p1) - 1) * (UInt64(p2) - 1)
        
        //
 

        d = (7 * φ + 1) / e
        //Передает открытый ключ тому, что хочет отправить сообщение
        sender.e = e
        sender.n = N
        
        print("e = ", e)
        print("N = ", N)
        print("d = ", d)
        print("p1 = ", p1)
        print("p2 = ", p2)
        print("ф = ", φ)


    }
    
    func decode(){
        guard let encriptedmassage = encriptedmassage else { return }
        print("c = ", encriptedmassage)
        massage = UInt64(myPow(encriptedmassage, d)) % N
    }
    
}


