//
//  Guesser.swift
//  GuesingApp
//
//  Created by Nalivela,Saikumar on 2/26/19.
//  Copyright © 2019 Nalivela,Saikumar. All rights reserved.
//

import Foundation

class Guesser{
     private static var _shared:Guesser!
     static var shared: Guesser {
       
        if _shared == nil {
            _shared = Guesser()
        }
        return _shared
      
        
    }
    
    private var correctAnswer:Int
    private var _numAttempts:Int
    private var guesses: [Guess]
    struct Guess{
        var correctAnswer:Int
        var numAttempts:Int
    }
    
    var numAttempts:Int{
        return _numAttempts
    }
    func createNewProblem(){
        correctAnswer = Int.random(in: 1..<10)
        _numAttempts = 0
        
    }
    
    func amIRight(guess:Int) -> String{
        _numAttempts = _numAttempts + 1
        if guess == correctAnswer{
            guesses.append(Guesser.Guess.init(correctAnswer: correctAnswer, numAttempts: _numAttempts))
            //createNewProblem()
            return Result.correct.rawValue
            
        }else if guess < correctAnswer{
            return Result.tooLow.rawValue
        }else{
            return Result.tooHigh.rawValue
        }
    }
    private init(){
        self.correctAnswer = 0
        self._numAttempts = 0
        self.guesses = []
        createNewProblem()
    }
    
    
    func clearStatistics(){
        guesses = []
        _numAttempts = 0
    }
    
    
    subscript(guess:Int) -> Guess{
        return guesses[guess]
    }
    func numGuesses() -> Int{
        return guesses.count
    }
    
    func minimunAttempts() -> Int{
        var k = guesses[0].numAttempts
        for i in guesses{
            if k > i.numAttempts{
                k = i.numAttempts
            }
        }
        return k
    }
    
    func maximumAttempts() -> Int{
        var k = guesses[0].numAttempts
        for i in guesses{
            if k < i.numAttempts{
                k = i.numAttempts
            }
        }
        return k
    }
    
    func mean() -> Int{
        var value = 0
        for i in guesses{
            value += i.numAttempts
        }
        return value/guesses.count
    }
    func dev() -> Int{
        var sum = 0
        for i in guesses{
            sum += (mean() - i.numAttempts) * (mean() - i.numAttempts)
        }
        return Int(sqrt(Double(sum)))
    }
    
    
    
    
}
enum Result:String{
    case tooLow = "TooLow", tooHigh = "TooHigh",correct = "Correct"
}

