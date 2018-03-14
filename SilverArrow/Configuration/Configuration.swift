//
//  Configuration.swift
//  SilverArrow
//
//  Created by Apit on 2/12/18.
//  Copyright © 2018 Apit. All rights reserved.
//

import UIKit

class Configuration: NSObject {

    static let REGEX_EMAIL = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$"
    static let REGEX_PHONE_NUMBER = "^(08){1,2}+[0-9]{2,12}"
    static let COLOR_THEME = UIColor(hexString: "0F669E")
    static let TITLE:Array<String> = ["Opening Market Senin 12 Feb 2018", "Opening Market Jumat 09 Feb 2018"]
    static let POSTING_DATE:Array<String> = ["Posted 12 February 2018", "Posted 12 February 2018"]
    static let CONTENT:Array<String> = ["Bursa Saham · Mengawali perdagangan saham di awal pekan ini, IHSG berpotensi menguat didorong oleh sentimen positif reboundnya saham di bursa Amerika. Pelaku pasar juga menantikan rilis data ekspor impor Indonesia bulan Januari 2018 serta rilis laporan keuangan emiten periode 2017.   · Di Eropa, indeks Stoxx 50 Europe melemah 1,52% pada Jumat (9/25). · Indeks S&P 500 di bursa Amerika menguat 1,49% pada penutupan perdagangan akhir pekan lalu.", "Bursa Saham · IHSG hari ini dapat tertekan dipengaruhi oleh sentimen negatif dari pelemahan indeks saham di Amerika yang diikuti pula dengan pelemahan indeks saham di regional Asia. Sentimen negatif dari eksternal ini membayangi penguatan sejumlah sata ekonomi Indonesia yang dirilis baru-baru ini seperti cadangan devisa dan penjualan ritel yang meningkat.   · Di Eropa, indeks Stoxx 50 Europe melemah 2,24% pada Kamis (8/2). · Indeks saham di bursa Wall St"]
    /**
     method for validate text with regex
     
     - parameter text:  text that will be validated
     - parameter regex: regex string
     
     - returns: bool value true or false (match or not)
     */
    class func checkWithRegex(text:String!, regex:String) -> Bool{
        let emailTest = NSPredicate(format: "SELF MATCHES %@", regex)
        return !emailTest.evaluate(with: text)
    }
}
