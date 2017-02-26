//
//  QuizViewController.swift
//  Gapminder
//
//  Created by Maks on 2017-02-17.
//  Copyright © 2017 Maks. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController
{
    // "Where do people live is missing
    // because this question presented as a image map
    // and will need to be implemented later.
    let questions = [
        "How many children will there be in 2100?",
        "What’s the worldwide average life expectancy?",
        "What percent of adults in the world today are literate – can read and write?",
        "What is the proportion of all one-year-old children in the world that have got the measels vaccine?",
        "During the last 20 years the porportion of the world's population that are desperately poor has:"
    ]
    // first item in each inner array is correct
    let answers = [
        // children
        ["2 billion ", "3 billion", "4 billion"],
        // expectancy
        ["70 years", "60 years", "50 years"],
        // literate
        ["80% are literate", "60% are literate", "40% are literate"],
        // vaccine
        ["8/10", "5/10", "2/10"],
        // poor
        ["Halved", "Remained the same", "Doubled"]
    ]
    // keeps results of user's answers
    var results = [[String]]()
    // current question
    var currentQuestion = 0
    // right answer
    var correctAnswerIndex:UInt32 = 0
    // results index
    var resultsIndex = 0
    
    // consider using textKit instead
    @IBOutlet weak var questionLabel: UILabel!

    override func viewDidLoad()
    {
        super.viewDidLoad()
        getQuestion()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func quessAction(_ sender: UIButton)
    {
        if (sender.tag) == Int(correctAnswerIndex)
        {
            print("right for question \(currentQuestion)")
            results[resultsIndex][2] = sender.currentTitle!
            print("___________________")
            dump(results)
        }
        else
        {
            print("wrong for question \(currentQuestion)")
            results[resultsIndex][2] = sender.currentTitle!
            print("___________________")
            dump(results)
        }
        if (currentQuestion != questions.count)
        {
            resultsIndex+=1
            getQuestion()
        }
        else
        {
            print("no more questions")
            //MARK: TODO pass results array to results view controller
            //performSegue(withIdentifier: "make a new one first", sender: self)
        }
    }
    
    func getQuestion()
    {
        // set the question label to the current question
        questionLabel.text = questions[currentQuestion]
        // get location of correct answer
        correctAnswerIndex = arc4random_uniform(3) + 1
        // create a button variable
        var button:UIButton = UIButton()
        // holds the button being set
        var currentButton = 1
        
        // question, right answer, user guess
        var newRow = [String]()
        newRow.append(questions[currentQuestion])
        
        // assign the button to each storyboard button
        for i in 1...3
        {
            button = view.viewWithTag(i) as! UIButton
            if(i == Int(correctAnswerIndex)){
                button.setTitle(answers[currentQuestion][0], for: .normal)
                newRow.append(answers[currentQuestion][0])
            }
            else
            {
                button.setTitle(answers[currentQuestion][currentButton], for: .normal)
                currentButton += 1
            }
        }
        newRow.append("User Guess Placeholder")
        results.append(newRow)
        currentQuestion += 1
        print("__getQuestion()__")
        dump(results)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
