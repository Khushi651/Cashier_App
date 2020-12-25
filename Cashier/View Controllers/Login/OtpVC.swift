//
//  OtpVC.swift
//  Cashier
//
//  Created by Appic Softwares on 23/12/20.
//

import UIKit

class OtpVC: UIViewController {
    
    static func getObject()-> OtpVC {
        let storyboard = UIStoryboard(name: "Login", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: String.className(OtpVC.self)) as? OtpVC
        if let vc = vc {
            return vc
        }
        return OtpVC()
    }
    
    //MARK:- OUTLETS
    
    @IBOutlet weak var vwFirst: UIView!
    @IBOutlet weak var vwForth: UIView!
    @IBOutlet weak var vwThird: UIView!
    @IBOutlet weak var vwSecond: UIView!
    
    @IBOutlet weak var cntrlFirst: UIControl!
    @IBOutlet weak var cntrlSecond: UIControl!
    @IBOutlet weak var cntrlThird: UIControl!
    @IBOutlet weak var cntrlForth: UIControl!
    @IBOutlet weak var cntrlFifth: UIControl!
    @IBOutlet weak var cntrlSixth: UIControl!
    @IBOutlet weak var cntrlSeven: UIControl!
    @IBOutlet weak var cntrlEight: UIControl!
    @IBOutlet weak var cntrlNine: UIControl!
    @IBOutlet weak var cntrlzero: UIControl!
    @IBOutlet weak var cntrlCancel: UIControl!
    @IBOutlet weak var cntrlClear: UIControl!
    @IBOutlet weak var lblFirst: UILabel!
    @IBOutlet weak var lblCancel: UILabel!
    @IBOutlet weak var lblZero: UILabel!
    @IBOutlet weak var lblClear: UILabel!
    @IBOutlet weak var lblNine: UILabel!
    @IBOutlet weak var lblEight: UILabel!
    @IBOutlet weak var lblSeven: UILabel!
    @IBOutlet weak var lblSix: UILabel!
    @IBOutlet weak var lblFifth: UILabel!
    @IBOutlet weak var lblForth: UILabel!
    @IBOutlet weak var lblThird: UILabel!
    @IBOutlet weak var lblSecond: UILabel!
    @IBOutlet weak var btnLogin: UIButton!
    
    
    //MARK:- LOCAL VARIABLES
    var value0:Bool = Bool()
    var value1:Bool = Bool()
    var value2:Bool = Bool()
    var value3:Bool = Bool()
    var value4:Bool = Bool()
    var value5:Bool = Bool()
    var value6:Bool = Bool()
    var value7:Bool = Bool()
    var value8:Bool = Bool()
    var value9:Bool = Bool()
    var valueCancel:Bool = Bool()
    var valueClear:Bool = Bool()
    var totalValue:Int = Int()
    
    //MARK:- PROPERTY OBSERVERS
    
    //MARK:- LIFE CYCLE METHODS
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        // Do any additional setup after loading the view.
    }
    
    
    //MARK:- BUSINESS LOGIC METHODS
    
    //MARK:- SETUP METHODS
    
    func setUI()
    {
        totalValue = 0
        vwFirst.backgroundColor = UIColor.orange
        
    }
    
    func setValue()
    {
        if value1 == true
        {
            cntrlFirst.backgroundColor = UIColor.orange
            lblFirst.textColor = UIColor.white
            cntrlSecond.backgroundColor = UIColor.white
            lblSecond.textColor = UIColor.black
            cntrlThird.backgroundColor = UIColor.white
            lblThird.textColor = UIColor.black
            cntrlForth.backgroundColor = UIColor.white
            lblForth.textColor = UIColor.black
            cntrlFifth.backgroundColor = UIColor.white
            lblFifth.textColor = UIColor.black
            cntrlSixth.backgroundColor = UIColor.white
            lblSix.textColor = UIColor.black
            cntrlSeven.backgroundColor = UIColor.white
            lblSeven.textColor = UIColor.black
            cntrlEight.backgroundColor = UIColor.white
            lblEight.textColor = UIColor.black
            cntrlNine.backgroundColor = UIColor.white
            lblNine.textColor = UIColor.black
            cntrlzero.backgroundColor = UIColor.white
            lblZero.textColor = UIColor.black
            cntrlClear.backgroundColor = UIColor.white
            lblClear.textColor = UIColor.black
            cntrlCancel.backgroundColor = UIColor.white
            lblCancel.textColor = UIColor.black
        }
        else if value2 == true
        {
            cntrlFirst.backgroundColor = UIColor.white
            lblFirst.textColor = UIColor.black
            cntrlSecond.backgroundColor = UIColor.orange
            lblSecond.textColor = UIColor.white
            cntrlThird.backgroundColor = UIColor.white
            lblThird.textColor = UIColor.black
            cntrlForth.backgroundColor = UIColor.white
            lblForth.textColor = UIColor.black
            cntrlFifth.backgroundColor = UIColor.white
            lblFifth.textColor = UIColor.black
            cntrlSixth.backgroundColor = UIColor.white
            lblSix.textColor = UIColor.black
            cntrlSeven.backgroundColor = UIColor.white
            lblSeven.textColor = UIColor.black
            cntrlEight.backgroundColor = UIColor.white
            lblEight.textColor = UIColor.black
            cntrlNine.backgroundColor = UIColor.white
            lblNine.textColor = UIColor.black
            cntrlzero.backgroundColor = UIColor.white
            lblZero.textColor = UIColor.black
            cntrlClear.backgroundColor = UIColor.white
            lblClear.textColor = UIColor.black
            cntrlCancel.backgroundColor = UIColor.white
            lblCancel.textColor = UIColor.black
        }
        else if value3 == true
        {
            cntrlFirst.backgroundColor = UIColor.white
            lblFirst.textColor = UIColor.black
            cntrlSecond.backgroundColor = UIColor.white
            lblSecond.textColor = UIColor.black
            cntrlThird.backgroundColor = UIColor.orange
            lblThird.textColor = UIColor.white
            cntrlForth.backgroundColor = UIColor.white
            lblForth.textColor = UIColor.black
            cntrlFifth.backgroundColor = UIColor.white
            lblFifth.textColor = UIColor.black
            cntrlSixth.backgroundColor = UIColor.white
            lblSix.textColor = UIColor.black
            cntrlSeven.backgroundColor = UIColor.white
            lblSeven.textColor = UIColor.black
            cntrlEight.backgroundColor = UIColor.white
            lblEight.textColor = UIColor.black
            cntrlNine.backgroundColor = UIColor.white
            lblNine.textColor = UIColor.black
            cntrlzero.backgroundColor = UIColor.white
            lblZero.textColor = UIColor.black
            cntrlClear.backgroundColor = UIColor.white
            lblClear.textColor = UIColor.black
            cntrlCancel.backgroundColor = UIColor.white
            lblCancel.textColor = UIColor.black
        }
        else if value4 == true
        {
            cntrlFirst.backgroundColor = UIColor.white
            lblFirst.textColor = UIColor.black
            cntrlSecond.backgroundColor = UIColor.white
            lblSecond.textColor = UIColor.black
            cntrlThird.backgroundColor = UIColor.white
            lblThird.textColor = UIColor.black
            cntrlForth.backgroundColor = UIColor.orange
            lblForth.textColor = UIColor.white
            cntrlFifth.backgroundColor = UIColor.white
            lblFifth.textColor = UIColor.black
            cntrlSixth.backgroundColor = UIColor.white
            lblSix.textColor = UIColor.black
            cntrlSeven.backgroundColor = UIColor.white
            lblSeven.textColor = UIColor.black
            cntrlEight.backgroundColor = UIColor.white
            lblEight.textColor = UIColor.black
            cntrlNine.backgroundColor = UIColor.white
            lblNine.textColor = UIColor.black
            cntrlzero.backgroundColor = UIColor.white
            lblZero.textColor = UIColor.black
            cntrlClear.backgroundColor = UIColor.white
            lblClear.textColor = UIColor.black
            cntrlCancel.backgroundColor = UIColor.white
            lblCancel.textColor = UIColor.black
        }
        else if value5 == true
        {
            cntrlFirst.backgroundColor = UIColor.white
            lblFirst.textColor = UIColor.black
            cntrlSecond.backgroundColor = UIColor.white
            lblSecond.textColor = UIColor.black
            cntrlThird.backgroundColor = UIColor.white
            lblThird.textColor = UIColor.black
            cntrlForth.backgroundColor = UIColor.white
            lblForth.textColor = UIColor.black
            cntrlFifth.backgroundColor = UIColor.orange
            lblFifth.textColor = UIColor.white
            cntrlSixth.backgroundColor = UIColor.white
            lblSix.textColor = UIColor.black
            cntrlSeven.backgroundColor = UIColor.white
            lblSeven.textColor = UIColor.black
            cntrlEight.backgroundColor = UIColor.white
            lblEight.textColor = UIColor.black
            cntrlNine.backgroundColor = UIColor.white
            lblNine.textColor = UIColor.black
            cntrlzero.backgroundColor = UIColor.white
            lblZero.textColor = UIColor.black
            cntrlClear.backgroundColor = UIColor.white
            lblClear.textColor = UIColor.black
            cntrlCancel.backgroundColor = UIColor.white
            lblCancel.textColor = UIColor.black
        }
        else if value6 == true
        {
            cntrlFirst.backgroundColor = UIColor.white
            lblFirst.textColor = UIColor.black
            cntrlSecond.backgroundColor = UIColor.white
            lblSecond.textColor = UIColor.black
            cntrlThird.backgroundColor = UIColor.white
            lblThird.textColor = UIColor.black
            cntrlForth.backgroundColor = UIColor.white
            lblForth.textColor = UIColor.black
            cntrlFifth.backgroundColor = UIColor.white
            lblFifth.textColor = UIColor.black
            cntrlSixth.backgroundColor = UIColor.orange
            lblSix.textColor = UIColor.white
            cntrlSeven.backgroundColor = UIColor.white
            lblSeven.textColor = UIColor.black
            cntrlEight.backgroundColor = UIColor.white
            lblEight.textColor = UIColor.black
            cntrlNine.backgroundColor = UIColor.white
            lblNine.textColor = UIColor.black
            cntrlzero.backgroundColor = UIColor.white
            lblZero.textColor = UIColor.black
            cntrlClear.backgroundColor = UIColor.white
            lblClear.textColor = UIColor.black
            cntrlCancel.backgroundColor = UIColor.white
            lblCancel.textColor = UIColor.black
        }
        else if value7 == true
        {
            cntrlFirst.backgroundColor = UIColor.white
            lblFirst.textColor = UIColor.black
            cntrlSecond.backgroundColor = UIColor.white
            lblSecond.textColor = UIColor.black
            cntrlThird.backgroundColor = UIColor.white
            lblThird.textColor = UIColor.black
            cntrlForth.backgroundColor = UIColor.white
            lblForth.textColor = UIColor.black
            cntrlFifth.backgroundColor = UIColor.white
            lblFifth.textColor = UIColor.black
            cntrlSixth.backgroundColor = UIColor.white
            lblSix.textColor = UIColor.black
            cntrlSeven.backgroundColor = UIColor.orange
            lblSeven.textColor = UIColor.white
            cntrlEight.backgroundColor = UIColor.white
            lblEight.textColor = UIColor.black
            cntrlNine.backgroundColor = UIColor.white
            lblNine.textColor = UIColor.black
            cntrlzero.backgroundColor = UIColor.white
            lblZero.textColor = UIColor.black
            cntrlClear.backgroundColor = UIColor.white
            lblClear.textColor = UIColor.black
            cntrlCancel.backgroundColor = UIColor.white
            lblCancel.textColor = UIColor.black
        }
        else if value8 == true
        {
            cntrlFirst.backgroundColor = UIColor.white
            lblFirst.textColor = UIColor.black
            cntrlSecond.backgroundColor = UIColor.white
            lblSecond.textColor = UIColor.black
            cntrlThird.backgroundColor = UIColor.white
            lblThird.textColor = UIColor.black
            cntrlForth.backgroundColor = UIColor.white
            lblForth.textColor = UIColor.black
            cntrlFifth.backgroundColor = UIColor.white
            lblFifth.textColor = UIColor.black
            cntrlSixth.backgroundColor = UIColor.white
            lblSix.textColor = UIColor.black
            cntrlSeven.backgroundColor = UIColor.white
            lblSeven.textColor = UIColor.black
            cntrlEight.backgroundColor = UIColor.orange
            lblEight.textColor = UIColor.white
            cntrlNine.backgroundColor = UIColor.white
            lblNine.textColor = UIColor.black
            cntrlzero.backgroundColor = UIColor.white
            lblZero.textColor = UIColor.black
            cntrlClear.backgroundColor = UIColor.white
            lblClear.textColor = UIColor.black
            cntrlCancel.backgroundColor = UIColor.white
            lblCancel.textColor = UIColor.black
        }
        else if value9 == true
        {
            cntrlFirst.backgroundColor = UIColor.white
            lblFirst.textColor = UIColor.black
            cntrlSecond.backgroundColor = UIColor.white
            lblSecond.textColor = UIColor.black
            cntrlThird.backgroundColor = UIColor.white
            lblThird.textColor = UIColor.black
            cntrlForth.backgroundColor = UIColor.white
            lblForth.textColor = UIColor.black
            cntrlFifth.backgroundColor = UIColor.white
            lblFifth.textColor = UIColor.black
            cntrlSixth.backgroundColor = UIColor.white
            lblSix.textColor = UIColor.black
            cntrlSeven.backgroundColor = UIColor.white
            lblSeven.textColor = UIColor.black
            cntrlEight.backgroundColor = UIColor.white
            lblEight.textColor = UIColor.black
            cntrlNine.backgroundColor = UIColor.orange
            lblNine.textColor = UIColor.white
            cntrlzero.backgroundColor = UIColor.white
            lblZero.textColor = UIColor.black
            cntrlClear.backgroundColor = UIColor.white
            lblClear.textColor = UIColor.black
            cntrlCancel.backgroundColor = UIColor.white
            lblCancel.textColor = UIColor.black
        }
        else if value0 == true
        {
            cntrlFirst.backgroundColor = UIColor.white
            lblFirst.textColor = UIColor.black
            cntrlSecond.backgroundColor = UIColor.white
            lblSecond.textColor = UIColor.black
            cntrlThird.backgroundColor = UIColor.white
            lblThird.textColor = UIColor.black
            cntrlForth.backgroundColor = UIColor.white
            lblForth.textColor = UIColor.black
            cntrlFifth.backgroundColor = UIColor.white
            lblFifth.textColor = UIColor.black
            cntrlSixth.backgroundColor = UIColor.white
            lblSix.textColor = UIColor.black
            cntrlSeven.backgroundColor = UIColor.white
            lblSeven.textColor = UIColor.black
            cntrlEight.backgroundColor = UIColor.white
            lblEight.textColor = UIColor.black
            cntrlNine.backgroundColor = UIColor.white
            lblNine.textColor = UIColor.black
            cntrlzero.backgroundColor = UIColor.orange
            lblZero.textColor = UIColor.white
            cntrlClear.backgroundColor = UIColor.white
            lblClear.textColor = UIColor.black
            cntrlCancel.backgroundColor = UIColor.white
            lblCancel.textColor = UIColor.black
        }
        else if valueClear == true
        {
            cntrlFirst.backgroundColor = UIColor.white
            lblFirst.textColor = UIColor.black
            cntrlSecond.backgroundColor = UIColor.white
            lblSecond.textColor = UIColor.black
            cntrlThird.backgroundColor = UIColor.white
            lblThird.textColor = UIColor.black
            cntrlForth.backgroundColor = UIColor.white
            lblForth.textColor = UIColor.black
            cntrlFifth.backgroundColor = UIColor.white
            lblFifth.textColor = UIColor.black
            cntrlSixth.backgroundColor = UIColor.white
            lblSix.textColor = UIColor.black
            cntrlSeven.backgroundColor = UIColor.white
            lblSeven.textColor = UIColor.black
            cntrlEight.backgroundColor = UIColor.white
            lblEight.textColor = UIColor.black
            cntrlNine.backgroundColor = UIColor.white
            lblNine.textColor = UIColor.black
            lblZero.textColor = UIColor.black
            cntrlzero.backgroundColor = UIColor.white
            lblClear.textColor = UIColor.white
            cntrlClear.backgroundColor = UIColor.orange
            lblCancel.textColor = UIColor.black
            cntrlCancel.backgroundColor = UIColor.white
        }
        else if valueCancel == true
        {
            cntrlFirst.backgroundColor = UIColor.white
            lblFirst.textColor = UIColor.black
            cntrlSecond.backgroundColor = UIColor.white
            lblSecond.textColor = UIColor.black
            cntrlThird.backgroundColor = UIColor.white
            lblThird.textColor = UIColor.black
            cntrlForth.backgroundColor = UIColor.white
            lblForth.textColor = UIColor.black
            cntrlFifth.backgroundColor = UIColor.white
            lblFifth.textColor = UIColor.black
            cntrlSixth.backgroundColor = UIColor.white
            lblSix.textColor = UIColor.black
            cntrlSeven.backgroundColor = UIColor.white
            lblSeven.textColor = UIColor.black
            cntrlEight.backgroundColor = UIColor.white
            lblEight.textColor = UIColor.black
            cntrlNine.backgroundColor = UIColor.white
            lblNine.textColor = UIColor.black
            lblZero.textColor = UIColor.black
            cntrlzero.backgroundColor = UIColor.white
            lblClear.textColor = UIColor.black
            cntrlClear.backgroundColor = UIColor.white
            lblCancel.textColor = UIColor.white
            cntrlCancel.backgroundColor = UIColor.orange
        }
    }
    
    //MARK:- IBACTIONS
    
    
    @IBAction func btnLoginClicked(_ sender: UIButton) {
        var vc = HomeVC.getObject()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func oneClicked(_ sender: UIControl) {
        value0 = false
        value1 = true
        value2 = false
        value3 = false
        value4 = false
        value5 = false
        value6 = false
        value7 = false
        value8 = false
        value9 = false
        valueClear = false
        valueCancel = false
        self.setValue()
    }
    
    
    @IBAction func twoClicked(_ sender: UIControl) {
        value0 = false
        value1 = false
        value2 = true
        value3 = false
        value4 = false
        value5 = false
        value6 = false
        value7 = false
        value8 = false
        value9 = false
        valueClear = false
        valueCancel = false
        self.setValue()
    }
    
    
    @IBAction func threeClicked(_ sender: UIControl) {
        value0 = false
        value1 = false
        value2 = false
        value3 = true
        value4 = false
        value5 = false
        value6 = false
        value7 = false
        value8 = false
        value9 = false
        valueClear = false
        valueCancel = false
        self.setValue()
    }
    
    
    @IBAction func fourClicked(_ sender: UIControl) {
        value0 = false
        value1 = false
        value2 = false
        value3 = false
        value4 = true
        value5 = false
        value6 = false
        value7 = false
        value8 = false
        value9 = false
        valueClear = false
        valueCancel = false
        self.setValue()
    }
    
    @IBAction func fiveClicked(_ sender: UIControl) {
        value0 = false
        value1 = false
        value2 = false
        value3 = false
        value4 = false
        value5 = true
        value6 = false
        value7 = false
        value8 = false
        value9 = false
        valueClear = false
        valueCancel = false
        self.setValue()
    }
    
    @IBAction func sixClicked(_ sender: UIControl) {
        value0 = false
        value1 = false
        value2 = false
        value3 = false
        value4 = false
        value5 = false
        value6 = true
        value7 = false
        value8 = false
        value9 = false
        valueClear = false
        valueCancel = false
        self.setValue()
    }
    
    
    @IBAction func sevenClicked(_ sender: UIControl) {
        value0 = false
        value1 = false
        value2 = false
        value3 = false
        value4 = false
        value5 = false
        value6 = false
        value7 = true
        value8 = false
        value9 = false
        valueClear = false
        valueCancel = false
        self.setValue()
    }
    
    
    @IBAction func eightClicked(_ sender: UIControl) {
        value0 = false
        value1 = false
        value2 = false
        value3 = false
        value4 = false
        value5 = false
        value6 = false
        value7 = false
        value8 = true
        value9 = false
        valueClear = false
        valueCancel = false
        self.setValue()
    }
    
    @IBAction func nineClicked(_ sender: UIControl) {
        value0 = false
        value1 = false
        value2 = false
        value3 = false
        value4 = false
        value5 = false
        value6 = false
        value7 = false
        value8 = false
        value9 = true
        valueClear = false
        valueCancel = false
        self.setValue()
    }
    
    
    @IBAction func zeroClicked(_ sender: UIControl) {
        value0 = true
        value1 = false
        value2 = false
        value3 = false
        value4 = false
        value5 = false
        value6 = false
        value7 = false
        value8 = false
        value9 = false
        valueClear = false
        valueCancel = false
        self.setValue()
    }
    
    @IBAction func cancelClicked(_ sender: UIControl) {
        value0 = false
        value1 = false
        value2 = false
        value3 = false
        value4 = false
        value5 = false
        value6 = false
        value7 = false
        value8 = false
        value9 = false
        valueClear = false
        valueCancel = true
        self.setValue()
    }
    
    
    @IBAction func clearClicked(_ sender: UIControl) {
        value0 = false
        value1 = false
        value2 = false
        value3 = false
        value4 = false
        value5 = false
        value6 = false
        value7 = false
        value8 = false
        value9 = false
        valueClear = true
        valueCancel = false
        self.setValue()
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
