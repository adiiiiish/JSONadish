//
//  ViewController.swift
//  JSONadish
//
//  Created by Adilet Baizakov on 18/2/22.
//
import UIKit

class FirstJson: Codable {
    var glossary: Glossary?
}

class Glossary: Codable {
    var title: String? = nil
    var glossDiv: GlossDiv?
    
    enum CodingKeys: String, CodingKey{
        case glossDiv = "GlossDiv"
    }
}

class GlossDiv: Codable {
    var title: String? = nil
    var glossList: GlossList?
    
    enum CodingKeys: String, CodingKey{
        case glossList = "GlossList"
    }
}

class GlossList: Codable {
    var glossEntry: GlossEntry?
    
    enum CodingKeys: String, CodingKey{
        case glossEntry = "GlossEntry"
    }
}
class GlossEntry: Codable {
    var iD: String? = nil
    var sortAs: String? = nil
    var glossTerm: String? = nil
    var acronym: String? = nil
    var abbrev: String? = nil
    var glossDef: GlossDef?
    var glossSee: String? = nil
    
    enum CodingKeys: String, CodingKey{
        case glossDef = "GlossDef"
        case iD = "ID"
        case sortAs = "SortAs"
        case glossTerm = "GlossTerm"
        case acronym = "Acronym"
        case abbrev = "Abbrev"
        case glossSee = "GlossSee"
    }
}
class GlossDef: Codable {
    var para: String? = nil
    var glossSeeAlso: [String?] = []
    
    enum CodingKeys: String, CodingKey{
        case glossSeeAlso = "GlossSeeAlso"
    }
    
}

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let firstModel = try? JSONDecoder().decode(FirstJson.self, from: Data(json.utf8))
        dump(firstModel)
        
        
        let secondModel = try? JSONDecoder().decode(SecondJson.self, from: Data(json2.utf8))
        dump(secondModel)
        
        
        let thirdModel = try? JSONDecoder().decode(ThirdJson.self, from: Data(json3.utf8))
        dump(thirdModel)
        
    }
}

var json = """
{
    "glossary": {
        "title": "example glossary",
 "GlossDiv": {
            "title": "S",
  "GlossList": {
                      "GlossEntry": {
                                      "ID": "SGML",
     "SortAs": "SGML",
     "GlossTerm": "Standard Generalized Markup Language",
     "Acronym": "SGML",
     "Abbrev": "ISO 8879:1986",
     "GlossDef": {
                                               "para": "A meta-markup language, used to create markup languages such as DocBook.",
      "GlossSeeAlso": ["GML", "XML"]
                    },
      "GlossSee": "markup"
                }
            }
        }
    }
}
"""

class SecondJson: Codable {
    var menu: Menu?
    var id: String? = nil
    var value: String? = nil
}

class Menu: Codable {
    var popup: Popup?
}

class Popup: Codable {
    var menuitem: [Menuitem] = []
}

class Menuitem: Codable {
    var value: String? = nil
    var onClick: String? = nil
}

var json2 = """

{
 "menu": {
      "id": "file",
      "value": "File",
      "popup": {
             "menuitem": [
                   {"value": "New", "onclick": "CreateNewDoc()"},
                   {"value": "Open", "onclick": "OpenDoc()"},
                   {"value": "Close", "onclick": "CloseDoc()"}
             ]
       }
   }
}
"""

class ThirdJson: Codable {
    var widget: Widget?
    var debug: String? = nil
}

class Widget: Codable {
    var image: Image?
    var text: Text?
    var window: Window?
    var debug: String? = nil
    
}

class Window: Codable {
    var title: String? = nil
    var name: String? = nil
    var width: Int? = nil
    var height: Int? = nil
}

class Image: Codable {
    var src: String? = nil
    var name: String? = nil
    var hOffset: Int? = nil
    var vOffset: Int? = nil
    var alignment: String? = nil
}

class Text: Codable {
    var data: String? = nil
    var size: Int? = nil
    var style: String? = nil
    var name: String? = nil
    var hOffset: Int? = nil
    var vOffset: Int? = nil
    var alignment: String? = nil
    var onMouseUp: String? = nil
}

var json3 = """
{
  "widget": {
    "debug": "on",
    "window": {
        "title": "Sample Konfabulator Widget",
        "name": "main_window",
        "width": 500,
        "height": 500
    },
    "image": {
        "src": "Images/Sun.png",
        "name": "sun1",
        "hOffset": 250,
        "vOffset": 250,
        "alignment": "center"
    },
    "text": {
        "data": "Click Here",
        "size": 36,
        "style": "bold",
        "name": "text1",
        "hOffset": 250,
        "vOffset": 100,
        "alignment": "center",
        "onMouseUp": "sun1.opacity = (sun1.opacity / 100) * 90;"
    }
  }
}
"""




