//
//  ViewController.swift
//  Bout Time
//
//  Created by MacBook Air on 4/19/17.
//  Copyright © 2017 LionsEye. All rights reserved.
//

import UIKit
import GameKit

class MainVC: UIViewController {
    
    //Game Play Variables
    var currentRound = 0
    var correctAnswers = 0
    var roundsPlayed = 0
    var presidentIndexes: [Int]!
    var currentIndex = 0
    var currentIndex1 = 1
    var currentIndex2 = 2
    var currentIndex3 = 3

    
    // For Timer
    var seconds = 60
    var timer = Timer()
    var timerIsOn = false
    
    //Array of Presidents
    var presidentsArray: [President] = [President(name: "George Washington", swornIn: 1789),
                                        President(name: "John Adams", swornIn: 1797),
                                        President(name: "Thomas Jefferson", swornIn: 1801),
                                        President(name: "James Madison", swornIn: 1809),
                                        President(name: "James Monroe", swornIn: 1817),
                                        President(name: "John Quincy Adams", swornIn: 1825),
                                        President(name: "Andrew Jackson", swornIn: 1829),
                                        President(name: "Martin Van Buren", swornIn: 1837),
                                        President(name: "John Tyler", swornIn: 1841),
                                        President(name: "James K Polk", swornIn: 1845),
                                        President(name: "Millard Fillmore", swornIn: 1850),
                                        President(name: "Franklin Pierce", swornIn: 1853),
                                        President(name: "James Buchanan", swornIn: 1857),
                                        President(name: "Abraham Lincoln", swornIn: 1861),
                                        President(name: "Andrew Johnson", swornIn: 1865),
                                        President(name: "Ulysses S Grant", swornIn: 1869),
                                        President(name: "Rutherford B Hayes", swornIn: 1877),
                                        President(name: "Chester Arthur", swornIn: 1881),
                                        President(name: "Grover Cleveland", swornIn: 1885),
                                        President(name: "William McKinley", swornIn: 1897),
                                        President(name: "Theodore Roosevelt", swornIn: 1901),
                                        President(name: "William Howard Taft", swornIn: 1909),
                                        President(name: "Woodrow Wilson", swornIn: 1913),
                                        President(name: "Warren G Harding", swornIn: 1921),
                                        President(name: "Calvin Coolidge", swornIn: 1923),
                                        President(name: "Herbert Hoover", swornIn: 1929),
                                        President(name: "Franklin D Roosevelt", swornIn: 1933),
                                        President(name: "Harry S Truman", swornIn: 1945),
                                        President(name: "Dwight D. Eisenhower", swornIn: 1953),
                                        President(name: "John F. Kennedy", swornIn: 1961),
                                        President(name: "Lyndon B Johnson", swornIn: 1963),
                                        President(name: "Richard M. Nixon", swornIn: 1969),
                                        President(name: "Gerald R. Ford", swornIn: 1974),
                                        President(name: "Jimmy Carter", swornIn: 1977),
                                        President(name: "Ronald Regan", swornIn: 1981),
                                        President(name: "George H.W. Bush", swornIn: 1989),
                                        President(name: "Bill Clinton", swornIn: 1993),
                                        President(name: "George W Bush", swornIn: 2001),
                                        President(name: "Barack Obama", swornIn: 2009),
                                        President(name: "Donald J Trump", swornIn: 2016)]
    
    @IBOutlet weak var labelOne: UILabel!
    @IBOutlet weak var labelTwo: UILabel!
    @IBOutlet weak var labelThree: UILabel!
    @IBOutlet weak var labelFour: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var failureButton: UIButton!
    @IBOutlet weak var successButton: UIButton!
    @IBOutlet weak var downOne: UIButton!
    @IBOutlet weak var upTwo: UIButton!
    @IBOutlet weak var downTwo: UIButton!
    @IBOutlet weak var upThree: UIButton!
    @IBOutlet weak var downThree: UIButton!
    @IBOutlet weak var upFour: UIButton!

    lazy var buttons: [UIButton] = { return [self.downOne, self.upTwo, self.downTwo, self.upThree, self.downThree, self.upFour] }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        failureButton.isHidden = true
        successButton.isHidden = true
        presidentIndexes = Array(0 ..< presidentsArray.count)
        presidentIndexes.shuffle()
        updateLabelsFor()
        print(presidentIndexes)
    }
    
    
    // Shake Functionality
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        roundsPlayed += 1
        checkIfCorrect()
        print("Phone is shaking")
        print(roundsPlayed)
    }
    
    // Populate Labels
    func updateLabelsFor() {
        
        // Reset timer for new round
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(MainVC.timerRules)), userInfo: nil, repeats: true)
        
        let presidentObject = presidentsArray[presidentIndexes[currentIndex]]
        labelOne.text = presidentObject.name
        
        let presidentObject1 = presidentsArray[presidentIndexes[currentIndex1]]
        labelTwo.text = presidentObject1.name

        let presidentObject2 = presidentsArray[presidentIndexes[currentIndex2]]
        labelThree.text = presidentObject2.name

        let presidentObject3 = presidentsArray[presidentIndexes[currentIndex3]]
        labelFour.text = presidentObject3.name
        
    }
    
    func checkIfCorrect() {
        
        let first = presidentsArray[presidentIndexes[currentIndex]]
        let second = presidentsArray[presidentIndexes[currentIndex1]]
        let third = presidentsArray[presidentIndexes[currentIndex2]]
        let four = presidentsArray[presidentIndexes[currentIndex3]]
        
        let answer1 = first.swornIn
        let answer2 = second.swornIn
        let answer3 = third.swornIn
        let answer4 = four.swornIn
        
        if answer1 >= answer2 &&
           answer2 >= answer3 &&
            answer3 >= answer4 {
            print("You've ordered the Presidents correctly!")
            successButton.isHidden = false
            timerLabel.isHidden = true
        } else {
            print("Oops! You've entered the wrong order!")
            failureButton.isHidden = false
            timerLabel.isHidden = true
        }
        
    }
    
    func ifOrderCorrect() {
        correctAnswers += 1
        roundsPlayed += 1
        if roundsPlayed >= 6 {
            print("You have answered \(correctAnswers) out of \(roundsPlayed)")
            performSegue(withIdentifier: "GameOverVC", sender: self)
        }
    }
    
    func ifOrderIncorrect () {
        roundsPlayed += 1
        if roundsPlayed >= 6 {
            print("You have answered \(correctAnswers) out of \(roundsPlayed)")
            performSegue(withIdentifier: "GameOverVC", sender: self)
        }
    }
    
    func loadNextRound() {
        timerReset()
        presidentIndexes.shuffle()
        updateLabelsFor()
        successButton.isHidden = true
        failureButton.isHidden = true
        timerLabel.isHidden = false
    }
    
    func timerRules() {
        seconds -= 1
        timerLabel.text = String(seconds)
        
        if seconds == 0 {
            self.timer.invalidate()
            seconds = 60
        }
    }
    
    func timerReset() {
        self.timer.invalidate()
        seconds = 60
    }
    
    @IBAction func lossBtnPress(_ sender: Any) {
        ifOrderIncorrect()
        loadNextRound()
    }
    
    @IBAction func successBtnPress(_ sender: Any) {
        ifOrderCorrect()
        loadNextRound()
    }
    
    // Ordering Button
    
    @IBAction func buttonPressed(_ sender: Any) {
        
        guard let button = sender as? UIButton else {
            return
        }
        
        switch button.tag {
        case 0:
            swap (&currentIndex, &currentIndex1)
            let presidentObject = presidentsArray[presidentIndexes[currentIndex]]
            labelOne.text = presidentObject.name
            
            let presidentObject1 = presidentsArray[presidentIndexes[currentIndex1]]
            labelTwo.text = presidentObject1.name

            break
            
        case 1:
            swap (&currentIndex, &currentIndex1)
            let presidentObject = presidentsArray[presidentIndexes[currentIndex]]
            labelOne.text = presidentObject.name
            
            let presidentObject1 = presidentsArray[presidentIndexes[currentIndex1]]
            labelTwo.text = presidentObject1.name
            
            break
            
        case 2:
            swap (&currentIndex1, &currentIndex2)
            let presidentObject1 = presidentsArray[presidentIndexes[currentIndex1]]
            labelTwo.text = presidentObject1.name
            
            let presidentObject2 = presidentsArray[presidentIndexes[currentIndex2]]
            labelThree.text = presidentObject2.name
            
            break
            
        case 3:
            swap (&currentIndex1, &currentIndex2)
            let presidentObject1 = presidentsArray[presidentIndexes[currentIndex1]]
            labelTwo.text = presidentObject1.name
            
            let presidentObject2 = presidentsArray[presidentIndexes[currentIndex2]]
            labelThree.text = presidentObject2.name
            
            break
            
        case 4:
            swap (&currentIndex2, &currentIndex3)
            let presidentObject2 = presidentsArray[presidentIndexes[currentIndex2]]
            labelThree.text = presidentObject2.name
            
            let presidentObject3 = presidentsArray[presidentIndexes[currentIndex3]]
            labelFour.text = presidentObject3.name
            
            break
            
        case 5:
            swap (&currentIndex2, &currentIndex3)
            let presidentObject2 = presidentsArray[presidentIndexes[currentIndex2]]
            labelThree.text = presidentObject2.name
            
            let presidentObject3 = presidentsArray[presidentIndexes[currentIndex3]]
            labelFour.text = presidentObject3.name
            
            break
            
        default:
            print("An error has occured")
            return
        }
    }

    
}

extension MutableCollection where Indices.Iterator.Element == Index {
    /// Shuffles the contents of this collection.
    mutating func shuffle() {
        let c = count
        guard c > 1 else { return }
        
        for (firstUnshuffled , unshuffledCount) in zip(indices, stride(from: c, to: 1, by: -1)) {
            let d: IndexDistance = numericCast(arc4random_uniform(numericCast(unshuffledCount)))
            guard d != 0 else { continue }
            let i = index(firstUnshuffled, offsetBy: d)
            swap(&self[firstUnshuffled], &self[i])
        }
    }
}

extension Sequence {
    /// Returns an array with the contents of this sequence, shuffled.
    func shuffled() -> [Iterator.Element] {
        var result = Array(self)
        result.shuffle()
        return result
    }
}
