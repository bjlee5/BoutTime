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
    
    var currentRound = 0
    var correctAnswer = 0
    var roundsPlayed = 0
    
    // For Timer
    var seconds = 60
    var timer = Timer()
    var timerIsOn = false
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
                                        President(name: "Zachary Taylor", swornIn: 1849),
                                        President(name: "Millard Fillmore", swornIn: 1850),
                                        President(name: "Franklin Pierce", swornIn: 1853),
                                        President(name: "James Buchanan", swornIn: 1857),
                                        President(name: "Abraham Lincoln", swornIn: 1861),
                                        President(name: "Andrew Johnson", swornIn: 1865),
                                        President(name: "Ulysses S Grant", swornIn: 1869),
                                        President(name: "Rutherford B Hayes", swornIn: 1877),
                                        President(name: "Chester Arthur", swornIn: 1881),
                                        President(name: "Grover Cleveland", swornIn: 1885),
                                        President(name: "Benjamin Harrison", swornIn: 1889),
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func updateTimer() {
        seconds -= 1
        timerLabel.text = String(seconds)
        
        if seconds == 0 {
            self.timer.invalidate()
            seconds = 60
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
