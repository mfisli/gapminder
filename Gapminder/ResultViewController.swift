//
//  ResultViewController.swift
//  Gapminder
//
//  Created by Maks on 2017-02-26.
//  Copyright © 2017 Maks. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController
{
    var results = [[String]]()
    
    var resultsIndex = 0;
    
    @IBOutlet weak var resultLabel: UILabel!
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

//        if(results.count != 0){
//            print(results)
//        } else {
//            print("no results")
//        }
        getResult()
        
    }

    @IBAction func nextResultAction(_ sender: Any)
    {
       getResult()
        
    }
    
    func getResult(){
        if (resultsIndex != results.count){
            var isCorrect = ""
            if (results[resultsIndex][1] == results[resultsIndex][2]){
                isCorrect = "Well done."
            } else {
                isCorrect = "You got it wrong."
            }
            resultLabel.text =
                "Question #\(resultsIndex+1)\n" +
                "\(results[resultsIndex][0])\n\n" +
                isCorrect + "\n" +
                "Correct Answer: \(results[resultsIndex][1]) \n" +
                "Your Answer: \(results[resultsIndex][2])"
            resultsIndex += 1
        } else {
            performSegue(withIdentifier: "resultToHomeSegue", sender: self)
        }

    }
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
