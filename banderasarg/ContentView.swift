//
//  ContentView.swift
//  banderasarg
//
//  Created by Francisco sosa on 23/06/2019.
//  Copyright © 2019 watafaka-dev. All rights reserved.
//

import SwiftUI
struct ContentView : View {
    @State private var municipios = ["malvinas argentinas","vicente lopez", "san isidro","moron","lanus","adolfo gonzales chaves","albardon","almirante brown", "apostoles", "aristobulo del valle", "arrecifes", "avellaneda", "bahia blanca", "baradero", "basavilbaso", "bell ville", "berazategui", "berisso", "bragado", "brandsen", "campana", "campo grande", "campo viera", "canada de gomez", "canuelas", "capital la rioja" , "carlos casares", "carlos casares","carmen de areco", "casilda", "caucete", "chacabuco", "chajari", "chamical", "chivilcoy", "ciudad de corrientes", "comodoro rivadavia", "concepcion del uruguay", "concordia", "coronel dorrego", "coronel rosales", "coronel suarez", "corpus", "cruz del eje", "curuzu cuatia", "el calafate", "el chalten", "empedrado", "ensenada", "esteban echeverria", "etruria", "exaltacion de la cruz", "ezeiza", "florencio varela", "florentino ameghino", "general pinedo", "general alvear","general belgrano", "general pico", "general pinto", "general pueyrredon", "general san martin", "gobernador crespo", "gualeguay", "gualeguaychu", "ituzaingo", "jachal", "james craik", "jardin america", "jose c paz", "jose juan castelli", "la carlota", "la costa", "la matanza", "la plata", "la playosa", "laguna larga", "lanus", "las flores", "las varillas", "lincoln", "loberia", "lomas de zamora", "malabrigo", "marcos paz", "mercedes", "merlo","monte hermoso", "navarro", "nogoya", "nueve de julio", "obera", "olavarria", "panabi", "parana", "parera", "pehuajo", "pellegrini", "pilar","pinto","posadas", "puan","puerto madryn","punta indio","quilmes", "ramallo","rawson", "recreo","rio cuarto", "rio grande", "rio negro", "rosario", "saavedra", "saladillo", "salliquilo", "san andres de giles", "san antonio de areco", "san cayetano", "san cristobal", "san fernando del valle de catamarca", "san fernando", "san jose de metan", "san vicente", "san ignacio", "san jose", "san salvador", "san vicente", "santa rosa de calchines", "santiago del estero", "suipacha", "sumampa", "tandil", "tigre","tostado", "trenque lauquen", "tres arroyos","tres de febrero", "tres lomas", "tunuyan", "tupungato", "ullum", "venado tuerto", "vicente lopez", "victoria", "villa canas"]
    .shuffled()
    @State private var CorrectAnswer = Int.random(in: 0...2)
    
    @State private var score = 0
    @State private var alertTitle = ""
    @State private var showAlert = false
    
    var body: some View {
        NavigationView {
          
            VStack {
                  Text("Conoces su bandera?")
                ForEach(0...2) { number in
                    Image(self.municipios[number])
                    .border(Color.black,width: 1 )
                        .tapAction {
                            self.flagaTapped(number)
                    }
                }
                Spacer()
            }
                //.uppercased() para poner en mayuscula despues del text()
            .navigationBarTitle(Text(municipios[CorrectAnswer]))
                .presentation($showAlert) {
                    //muestra la alerta aca
                    Alert(title: Text(alertTitle), message: Text("Tu puntaje es: \(score)"), dismissButton:
                        .default(Text("Continuar")) {
                            self.askQuestion()
                            
                        })
            }
        }
    }
    
    func flagaTapped(_ tag: Int ) {
        if tag == CorrectAnswer {
            //Respuesta correcta!
            score+=1
            alertTitle = "La respuesta es correcta!"
        } else {
            // mal
            score-=1
            alertTitle = "ah ah ah! Respuesta incorrecta!"
        }
        showAlert = true
    }
    func askQuestion() {
        municipios.shuffle()
        CorrectAnswer = Int.random(in: 0...2)
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
