import UIKit

class QuestionViewController: UIViewController {
  @IBOutlet weak var logo: UIImageView!
  @IBOutlet weak var question: UILabel!
  @IBOutlet weak var no: UIButton!
  @IBOutlet weak var yes: UIButton!
  @IBOutlet weak var browseInfo: UIButton!
  
  var rootCard: Bool = true
  var currentCard: Card? = nil
  
  var cards: [Card] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Todo: Fetch questions
    cards = getchQuestions()
    
    if rootCard {
        rootCard = false
        currentCard = cards[0]
    }
    
    if currentCard is Result {
      // todo: Segue to InfoViewController
    }
    else {
      self.question.text = currentCard?.content
    }
    
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
    return true
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //
  }
  
  @IBAction func handleYesAnswer(_ sender: UIButton) {
    switch currentCard {
    case is Question:
      let q = currentCard as! Question
      
      if (q.yes != nil) {
        currentCard = q.yes
        if currentCard is Result {
          // todo: Segue to InfoViewController
        }
        else {
          self.question.text = currentCard?.content
        }
      }
      
      break
    case is Result:
      _ = currentCard as! Result

      break
    default:
      break
    }
  }
  
  @IBAction func handleNoAnswer(_ sender: UIButton) {
    switch currentCard {
    case is Question:
      let q = currentCard as! Question
      
      if (q.no != nil) {
        currentCard = q.no
        if currentCard is Result {
          // todo: Segue to InfoViewController
        }
        else {
          self.question.text = currentCard?.content
        }
      }
      
      break
    case is Result:
      _ = currentCard as! Result
      
      break
    default:
      break
    }
  }
  
  
  func getchQuestions() -> [Card] {
    
    let question1 = Question(content: "La personne est-elle consciente?", yes: nil, no: nil)
    
    let question2 = Question(content: "La personne respire-t'elle?", yes: nil, no: nil)
    
    let question3 = Question(content: "La personne souffre-t'elle ", yes: nil, no: nil)
    
    question1.no = question2
    
    question1.yes = question3
    
    let json = "[{\"QuestionInfo\":{\"id\":\"a\",\"type\":\"question\",\"option1\":\"b\",\"option2\":\"c\",\"content\":{\"text\":\"Is the person conscious?\"}}},{\"QuestionInfo\":{\"id\":\"b\",\"type\":\"question\",\"option1\":\"d\",\"option2\":\"e\",\"content\":{\"text\":\"Is the person breathing?\"}}},{\"QuestionInfo\":{\"id\":\"c\",\"type\":\"question\",\"option1\":\"a\",\"option2\":\"b\",\"content\":{\"text\":\"Is the person retarded?\"}}},{\"QuestionInfo\":{\"id\":\"d\",\"type\":\"question\",\"option1\":\"a\",\"option2\":\"b\",\"content\":{\"text\":\"Is the person's heart still beating?\"}}},{\"QuestionInfo\":{\"id\":\"e\",\"type\":\"question\",\"option1\":\"c\",\"option2\":\"d\",\"content\":{\"text\":\"Is the person Richer Archambault?\"}}}]"
    
    return [question1]
  }
}
