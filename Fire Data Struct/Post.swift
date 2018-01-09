//
//  File.swift
//  Fire Data Struct
//
//  Created by Lucas Caron Albarello on 18/12/17.
//  Copyright © 2017 Lucas Caron Albarello. All rights reserved.
//

import Foundation
struct Post {
    let postId : String
    let nome : String
    let mensagem: String
    let data : Date
    init?(postId: String, dict: [String: Any]) {
        self.postId = postId
        let dataFormatada = DateFormatter()
        dataFormatada.dateFormat = ""
        guard let nome = dict["nome"] as? String,
        let mensagem = dict["mensagem"] as? String,
        let dataString = dict["data"] as? String,
        let data = dataFormatada.date(from: dataString)
            else {return nil}
        self.nome = nome
        self.mensagem = mensagem
        self.data = data
    }
}
