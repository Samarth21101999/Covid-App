//
//  ViewController.swift
//  Covid
//
//  Created by FabFour Group on 12/6/22.
//
import UIKit
import Charts
struct CovidData: Codable {
    var totalConfirmed: Int?    //Total Confirmed cases for global
    var totalDeaths:Int?        //Global total Deaths
    var totalRecovered:Int?     //Global total Recovered
    var areas=[Areas]()         //Areas to get the closest country
}
struct Areas:Codable{
    var displayName:String?     //Display name of country
    var totalConfirmed:Int?     //Total confirmed cases for closest country
    var totalDeaths:Int?        //Total deaths cases for closest country
    var totalRecovered:Int?     //Total Recovered cases for closest country
}

//var covidDataJson = [CovidData]();
class ViewController: UIViewController,ChartViewDelegate {
    
    @IBOutlet weak var closestCountryView: UIView!  //Closest Country View
    @IBOutlet weak var totalCasesLabel: UILabel!    //Total Cases Label
    @IBOutlet weak var graphView: UIView!           //graph view
    @IBOutlet weak var totalDeaths: UILabel!        //Total Death cases label
    @IBOutlet weak var totalRecLabel: UILabel!      //Total Recovered cases Label
    @IBOutlet weak var mortalityRate: UILabel!      //Mortality rate
    @IBOutlet weak var recoveryRate: UILabel!       //Recovery rate
    @IBOutlet weak var closestTotal: UILabel!       //Closest Country total cases
    @IBOutlet weak var closestRecovered: UILabel!   //Closest country total recovered
    @IBOutlet weak var closestDeaths: UILabel!      //Closest country total deaths
    var covidDataJson = CovidData()                 //To get the Covid Data struct values
    var barChart=(BarChartView)()                   //Bar chart
    override func viewDidLoad() {
        barChart.delegate=self
        super.viewDidLoad()
       
        closestCountryView.layer.cornerRadius=10       //View border radius 10
       
        if let data = getData(filename: "covid_data") {
            do {
                // ***** This the data for covid 19 that you read from bing site url *****
                // Do whatever you like here
                
                print(data)
                
                // For example you can decode it:
                
                let jsonDecoder = JSONDecoder()
                let covidData = try jsonDecoder.decode(CovidData.self, from: data)
//               //World data
                 covidDataJson = covidData
//                print("Total Confirmed:\(covidData.totalConfirmed!)")
//                print("Total Deaths:\(covidData.totalDeaths!)")
//                print("Total Recovered: \(covidData.totalRecovered!)")
//
//                // Closest Country Data
//                print("Data of \(covidData.areas[0].displayName!)")
//                print("Total Confirmed:\(covidData.areas[0].totalConfirmed!)")
//                print("Total Deaths:\(covidData.areas[0].totalDeaths!)")
//                print("Total Recovered:\(covidData.areas[0].totalRecovered!)")
                
                //To update UI
                DispatchQueue.main.async {
                    self.totalCasesLabel.text="Total\n \(covidData.totalConfirmed!)"  //Label for total cases
                    self.totalRecLabel.text="Recovered\n \(covidData .totalRecovered!)" //Label for total recovered cases
                    self.totalDeaths.text="Deaths\n \(covidData.totalDeaths!)"  //Label for total death cases
                    
                    let mortality=Double(covidData.totalDeaths!)/Double(covidData.totalConfirmed!)*100  //Mortality rate
                    let recovered=Double(covidData.totalRecovered!)/Double(covidData.totalConfirmed!)*100   //Recovered rate
                    self.mortalityRate.text="Mortality "+String(format:"%.2f",mortality)+"%"    //Label for Mortality rate
                    self.recoveryRate.text="Recovered "+String(format:"%.2f",recovered)+"%" //Label for recovery rate
                    
                    self.closestTotal.text="Total \n\(covidData.areas[0].totalConfirmed!)"  //Label for Closest country total cases
                    self.closestRecovered.text="Recovered\n\(covidData.areas[0].totalRecovered!)"   //Label for Closest country total recovered
                    self.closestDeaths.text="Deaths\n\(covidData.areas[0].totalDeaths!)"    //Label for Closest country total deaths
                }
            } catch {   //If any error then catch will execute
                print("Cannot decode your data")
                print(error)
            }
        }
    }
    //Function to get Data from covid-data.json file
    func getData(filename fileName: String) -> Data? {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                return data 
            } catch { //Catch executes when no file found
                print("I can not read your file \(fileName).json")
                print(error)
            }
        }
        print("I can not read the file \(fileName).json")
        return nil
    }
    
    //Bar chart view
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        //Bar chart size
        barChart.frame=CGRect(x: 0, y: 0, width: graphView.frame.width, height: graphView.frame.height)
        
        //Bar chart background color
        barChart.backgroundColor = .systemBackground
        
        //Bar chard added inside graphView
        graphView.addSubview(barChart)
        
        //Var entries to print the entries in bar chart
        var entries=[BarChartDataEntry]();
       
        //Legend of Bar chart
        let legend=barChart.legend
        legend.enabled=true
        
        //Total Confirmed cases entry in bar chart
        entries.append(BarChartDataEntry(x:Double(1),y:Double(covidDataJson.totalConfirmed!)))
        
        //Total Deaths  entry in bar chart
        entries.append(BarChartDataEntry(x:Double(2),y:Double(covidDataJson.totalDeaths!)))
        
        //Total Recovered entry in bar chart
        entries.append(BarChartDataEntry(x:Double(3),y:Double(covidDataJson.totalRecovered!)))
        
        //To get the entries into bar chart
        let  set=BarChartDataSet(entries: entries)
        set.colors=ChartColorTemplates.joyful() //Bar chart style
        let data=BarChartData(dataSet: set)
        barChart.data=data  //Data set the entries into bar chart
       
        
    }
}


