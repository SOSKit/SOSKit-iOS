import Foundation

class Card {
  var content: String = ""
  
  init(content: String){
    self.content = content
  }
  
  func getType() -> String {
    return ""
  }
  
}

class Question : Card {
  var yes : Card?
  var no : Card?
  
  init(content: String, yes: Card?, no: Card?) {
    super.init(content: content)
     
    self.yes = yes
    self.no = no
  }
  
  override func getType() -> String {
    return "question"
  }
  
}

class Result : Card {
  var image: String?
  var title: String?
  var next : Card?
  
  init(content: String, image: String?, title: String?, next: Card?) {
    super.init(content: content)
    
    self.image = image
    self.title = title
    self.next = next
  }
  
  override func getType() -> String {
    return "result"
  }
}
