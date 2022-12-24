//
//  AssessmentViewController.swift
//  Covid
//
//  Created by FabFour Group on 12/7/22.
//

import UIKit

class AssessmentViewController: UIViewController {

    @IBOutlet weak var isFeverSwitch: UISwitch! //Fever toggle
    @IBOutlet weak var isShortBreathSwitch: UISwitch!   //Short Breath toggle
    @IBOutlet weak var isMuscleAcheSwitch: UISwitch!    //Muscule Acne toggle
    @IBOutlet weak var isLossTasteSmellSwitch: UISwitch!    //Loss of Taste and smell toggle
    @IBOutlet weak var isChestPainSwitch: UISwitch! //Chest Pain toggle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var AssessmentResultLabel: UILabel!
    
    @IBAction func checkButton(_ sender: Any) {
        
        var assessmentResult = ""
        
        if(isLossTasteSmellSwitch.isOn)
        {
            if(isFeverSwitch.isOn)
            {
                if(isMuscleAcheSwitch.isOn)
                {
                    if(isShortBreathSwitch.isOn)
                    {
                        if(isChestPainSwitch.isOn)
                        {
                            assessmentResult = "SEVERE"                          // all symptoms
                            
                            //Alert box will pop up when User have selected all symptoms
                            let alert = UIAlertController(title: "CRITICAL !!", message: "You are having SEVERE symptoms of COVID. Refer to a doctor immediately!!", preferredStyle: .alert)  //alert box creation
                            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: {(_) in}))
                            self.present(alert, animated: true, completion: nil)
                        }
                        else { assessmentResult = "STRONG" }                      //No chest Pain
                    }else
                    {
                        if(isChestPainSwitch.isOn)                    //no short breath, chest pain
                        {
                            assessmentResult = "SEVERE"
                            
                        }else { assessmentResult = "STRONG" }                    //no short breath, chest pain
                    }
                }else
                {
                    if(isShortBreathSwitch.isOn)
                    {
                        if(isChestPainSwitch.isOn){       //no muscle pain chest pain
                            assessmentResult = "SEVERE"
                            
                        }else
                        {
                            assessmentResult = "STRONG"     // no muscle pain & no chest pain
                        }
                    }else
                    {
                        if(isChestPainSwitch.isOn){       // no muscle pain, no short breath chest pain
                            assessmentResult = "SEVERE"

                        }else
                        {
                            assessmentResult = "MILD"     // no muscle pain, no short breath no chest pain
                        }
                    }
                }
            }else
            {
                if(isMuscleAcheSwitch.isOn)
                {
                   if(isShortBreathSwitch.isOn)
                   {
                       if(isChestPainSwitch.isOn)
                       {
                           assessmentResult = "SEVERE"      //no feverChills chest pain
                           
                       }else
                       {
                            assessmentResult = "STRONG"     //no feverChills no chest pain
                       }
                  }else
                  {
                      if(isChestPainSwitch.isOn)
                      {
                           assessmentResult = "SEVERE"      // no feverchills, no short breath chest pain
                           
                      }else
                      {
                           assessmentResult = "STRONG"      // no feverchills, no short breath nochest pain
                      }
                  }
              }else
              {
                  if(isShortBreathSwitch.isOn)
                  {
                      if(isChestPainSwitch.isOn)
                      {
                          assessmentResult = "SEVERE"    // no fever chills, no muscle pain, chest pain
                         
                      }else
                      {
                          assessmentResult = "STRONG"  // no fever chills, no muscle pain, no chest pain
                      }
                  }else
                  {
                      if(isChestPainSwitch.isOn)
                      {
                          assessmentResult = "SEVERE"   // no fever chills, no muscle pain, no short breath, chest pain
                         
                      }else
                      {
                          assessmentResult = "LIGHT (Might not be COVID)"   // no fever chills, no muscle pain, no short breath, no chest pain
                      }
                  }
             }
            }
        }else{
            if(isFeverSwitch.isOn)
            {
                if(isMuscleAcheSwitch.isOn)
                {
                    if(isShortBreathSwitch.isOn)
                    {
                        if(isChestPainSwitch.isOn)
                        {
                            assessmentResult = "SEVERE"     //no tasteSmellLoss, chest pain
                        }
                        else { assessmentResult = "STRONG" }        //no tasteSmellLoss, no chest pain
                    }
                    else
                    {
                        if(isChestPainSwitch.isOn)
                        {
                            assessmentResult = "SEVERE"     //no tasteSmellLoss, no short breath, chest pain
                            
                        }else { assessmentResult = "MILD" }   //no tasteSmellLoss, no short breath, no chest pain
                    }
                }else
                {
                    if(isShortBreathSwitch.isOn)
                    {
                        if(isChestPainSwitch.isOn){
                            assessmentResult = "SEVERE"     //no tasteSmellLoss, no musclebodyache, chest pain

                        }else
                        {
                            assessmentResult = "MILD"      //no tasteSmellLoss, no musclebodyache, no chest pain
                        }
                    }else
                    {
                        if(isChestPainSwitch.isOn){
                            assessmentResult = "SEVERE"     //no tasteSmellLoss, no musclebodyache, no short breath, chest pain
                            
                        }else
                        {
                            assessmentResult = "LIGHT (Might not be COVID)"     //no tasteSmellLoss, no musclebodyache, no short breath, no chest pain
                        }
                    }
                }
            }else
            {
                if(isMuscleAcheSwitch.isOn)
                {
                   if(isShortBreathSwitch.isOn)
                   {
                       if(isChestPainSwitch.isOn)
                       {
                           assessmentResult = "SEVERE"  //no tasteSmellLoss, no feverchills chest pain
                        
                        //Alert box pop up to notify user if selected symptoms may be of Heart Stroke
                        let alert = UIAlertController(title: "Alert !!", message: "This CAN BE a Heart Stroke!! Shortness of Breath, Muscle ache and Chest pain are also symptoms for Heart Stroke. Refer to a doctor Immediately!!", preferredStyle: .alert)  //alert box creation
                        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: {(_) in}))
                        self.present(alert, animated: true, completion: nil)
                       }else
                       {
                            assessmentResult = "MILD"     //no tasteSmellLoss, no feverchills, no chest pain
                       }
                  }else
                  {
                      if(isChestPainSwitch.isOn)
                      {
                           assessmentResult = "MILD"  //no tasteSmellLoss, no feverchills, no short breath, chest pain
                           
                      }else
                      {
                           assessmentResult = "LIGHT (Might not be COVID)"  //no tasteSmellLoss, no feverchills, no short breath, no chest pain
                      }
                  }
              }else
              {
                  if(isShortBreathSwitch.isOn)
                  {
                      if(isChestPainSwitch.isOn)
                      {
                          assessmentResult = "STRONG"   //no tasteSmellLoss, no feverchills, no muscleBodyAche, chest pain
                        
                        //Alert box pop up to notify user if selected symptoms may be of Heart Stroke
                        let alert = UIAlertController(title: "Alert !!", message: "This CAN BE a Heart Stroke!! Shortness of Breath, Muscle ache and Chest pain are also symptoms for Heart Stroke. Refer to a doctor Immediately!!", preferredStyle: .alert)  //alert box creation
                        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: {(_) in}))
                        self.present(alert, animated: true, completion: nil)
                          
                      }else
                      {
                          assessmentResult = "LIGHT (Might not be COVID)"      //no tasteSmellLoss, no feverchills, no muscleBodyAche, no chest pain
                      }
                  }else
                  {
                      if(isChestPainSwitch.isOn)
                      {
                          assessmentResult = "LIGHT (Might not be COVID)"       //no tasteSmellLoss, no feverchills, no muscleBodyAche, no shortBreath, chest pain
                       
                        //Alert box pop up to notify user if selected symptoms may be of Heart Stroke
                        let alert = UIAlertController(title: "Alert !!", message: "This CAN BE a Heart Stroke!! Chest pain is also a symptom for Heart Stroke. Refer to a doctor Immediately!!", preferredStyle: .alert)  //alert box creation
                        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: {(_) in}))
                        self.present(alert, animated: true, completion: nil)
                          
                      }else
                      {
                          assessmentResult = "NO"       //no tasteSmellLoss, no feverchills, no muscleBodyAche, no shortBreath, no chest pain
                      }
                  }
             }
            }
        }
        //Setting of background color of result label according to assessment result
        if(assessmentResult == "SEVERE")
        {
            AssessmentResultLabel.backgroundColor = UIColor.red //Red when SEVERE
        }else if(assessmentResult == "STRONG"){
            AssessmentResultLabel.backgroundColor = UIColor.orange  //Orange when STRONG
        }else if(assessmentResult == "MILD"){
            AssessmentResultLabel.backgroundColor = UIColor.yellow //Yellow when MILD
        }else{
            AssessmentResultLabel.backgroundColor = UIColor.green   //Else Green
        }
        let string = "You are having " + assessmentResult + " symptoms of Covid.\nKindly avoid going public places and isolate yourself from others."
        AssessmentResultLabel.text = string;
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
