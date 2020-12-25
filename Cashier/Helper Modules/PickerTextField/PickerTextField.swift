//
//  PickerTextField.swift
//  TextFieldPicker
//
//  Created by Krishan Kumar on 23/03/18.
//  Copyright © 2018 DotSquares. All rights reserved.
//

import UIKit

/// Picker View type
///
/// - StringPicker: string picker
/// - DatePicker: date picker
public enum TextFieldPickerType {
	case StringPicker
	case DatePicker
	case TimePicker
	case DateTimePicker
	case HourMinuteSecond
}

@IBDesignable
class PickerTextField: UITextField
{
	//MARK:- TableVIew section identify
	var section:Int?
	let padding: CGFloat = 10.0
	
	@IBInspectable
	var leftImage: UIImage? {
		get{
			return (self.leftView as? UIImageView)?.image
		}
		set {
			guard let image=newValue else {return}
			self.setLeftImage(image: image)
		}
	}
	@IBInspectable
	var rightImage: UIImage? {
		get{
			return (self.rightView as? UIImageView)?.image
		}
		set {
			guard let image=newValue else {return}
			self.setRightImage(image: image)
		}
	}
	
	@IBInspectable
	var rightImageWidth: CGFloat = 0.0 {
		willSet{
			setRightImage(image: rightImage, width: newValue)
		}
	}
	@IBInspectable
	var leftImageWidth: CGFloat = 0.0 {
		willSet{
			setLeftImage(image: leftImage, width: newValue)
		}
	}
	
	open var pickerType: TextFieldPickerType? {
		
		didSet {
			guard let type = pickerType else {
				inputView=nil
				return
			}
			
			
			switch type {
			case .DatePicker :
				datePicker = UIDatePicker()
				datePicker?.datePickerMode = .date
				dateFormatter.dateFormat = "dd/MM/yyyy"
			case .TimePicker :
				datePicker = UIDatePicker()
				datePicker?.datePickerMode = .time
				dateFormatter.dateFormat = "HH:mm"
			case .DateTimePicker :
				datePicker = UIDatePicker()
				datePicker?.datePickerMode = .dateAndTime
				dateFormatter.dateFormat = "dd/MM/YYYY HH:mm"
			case .StringPicker, .HourMinuteSecond:
				stringPicker = UIPickerView()
				break
			}
			
			inputAccessoryView = toolbar
		}
	}
	
	// For DatePicker
	open var dateFormatter = DateFormatter()
	open var dateDidChange: ((_ date:Date,_ textField:UITextField) -> Void)?

    open var date : Date?{
        didSet{
            if date != nil{
                text = date!.toString(dateFormat: dateFormatter.dateFormat)
                datePicker?.date = date!
            }
        }
    }
	
	open var datePicker: UIDatePicker? {
		get {
			return self.inputView as? UIDatePicker
		}
		set {
			inputView = newValue
		}
	}
	
	// For String Picker
	
	open var stringPickerData: [String]?
	open var stringDidChange: ((_ index:Int,_ textField:UITextField) -> Void)?
	open var cancelBtnPressd: (() -> Void)?
	
	open var stringPicker: UIPickerView? {
		get {
			return self.inputView as? UIPickerView
		}
		set(picker) {
			picker?.delegate = self
			inputView = picker
		}
	}
	
	
	// Configurations
	/*
	*    Below method is used to initialze toolbar located above keyboard.
	*
	*/
	open var toolbar: UIToolbar {
		
		let toolBar = UIToolbar()
		toolBar.barStyle = .default
		toolBar.isTranslucent = true
		toolBar.tintColor = UIColor.blue
		toolBar.sizeToFit()
		
		let doneButton = UIBarButtonItem(barButtonSystemItem: .done,
										 target: self,
										 action: #selector(PickerTextField.doneAction))
		
		let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
										  target: nil,
										  action: nil)
		
		let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel,
										   target: self,
										   action: #selector(PickerTextField.cancelAction))
		
		toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
		toolBar.isUserInteractionEnabled = true
		inputAccessoryView = toolBar
		return toolBar
	}
	/*
	*    Below method is action of Done button of toolbar located above keyboard.
	*    This method will call back to controller according picker type of text field.
	*/
	@objc func doneAction() {
		
		guard let type = pickerType else {
			return
		}
		
		switch type {
			case .DatePicker , .TimePicker , .DateTimePicker:
				
				let date = datePicker!.date
				self.text = dateFormatter.string(from: date)
				
				dateDidChange?(date,self)
				
				break
			case .StringPicker:
				let row = stringPicker!.selectedRow(inComponent: 0)
				
				if let arr=stringPickerData, arr.count > row{
				self.text = arr[row]
				}
				stringDidChange?(row,self)
				
				break
			
		case .HourMinuteSecond:
			break
		}
		
		resignFirstResponder()
	}
	
	@objc func cancelAction() {
		resignFirstResponder()
		text=""
		
		guard let type = pickerType else {
			return
		}
		
		switch type {
		case .DatePicker , .TimePicker , .DateTimePicker:
			cancelBtnPressd?()
			break
		case .StringPicker:
            cancelBtnPressd?()
			break
		case .HourMinuteSecond:
			break
		}
	}
	//MARK:- Initializer methods
	// Only override drawRect: if you perform custom drawing.
	// An empty implementation adversely affects performance during animation.
	override func draw(_ rect: CGRect) {
		// Drawing code
		super.draw(rect)
		/*let bottom_view=UIView(frame: CGRect(x: 0, y: self.bounds.size.height-1, width:self.bounds.size.width , height: 0.5))
		bottom_view.backgroundColor=UIColor.lightGray
		bottom_view.tag=1000
		self.addSubview(bottom_view)*/
        //self.tintColor = UIColor.blue
		setupPlaceHolderColor()
	}
	required init(coder aDecoder: NSCoder) {
		
		super.init(coder: aDecoder)!
	}
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		setupPlaceHolderColor()
	}
	func setupPlaceHolderColor(){
		self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: UIColor.darkGray])
	}
}

extension PickerTextField
{
	
	func canPerformAction(action: Selector, withSender sender: AnyObject?) -> Bool {
		UIMenuController.shared.isMenuVisible = false
		//#selector(UIResponderStandardEditActions.copy(_:))
		
		if action == #selector(UIResponderStandardEditActions.paste(_:)) {
			
			return false
		}

		return super.canPerformAction(action, withSender:sender)
	}
	override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
		if action == #selector(UIResponderStandardEditActions.paste(_:)) {
			return false
        }else if action == #selector(UIResponderStandardEditActions.copy(_:)) {
            return false
        }else if action == #selector(UIResponderStandardEditActions.cut(_:)) {
            return false
        }else if action == #selector(UIResponderStandardEditActions.select(_:)) {
            return false
        }else if action == #selector(UIResponderStandardEditActions.selectAll(_:)) {
            return false
        }
		
		return super.canPerformAction(action, withSender:sender)
	}
    
	//MARK:- override methods
	
	override func leftViewRect(forBounds bounds: CGRect) -> CGRect
	{
		var textRect = super.leftViewRect(forBounds: bounds)
		textRect.origin.x  += 0
		return textRect
	}
	
	//FIXME: Use Below code as per your requirements.
	/*
	*   Uncomment below methods to provide custom edge insets.
	*/
	
	    override func textRect(forBounds bounds: CGRect) -> CGRect {
			
			return CGRect(x: bounds.origin.x + padding, y: bounds.origin.y, width: bounds.width - padding * 2, height: bounds.height)
	    }
	
	    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
			
			return CGRect(x: bounds.origin.x + padding, y: bounds.origin.y, width: bounds.width - padding * 2, height: bounds.height)
	    }
	
	    override func editingRect(forBounds bounds: CGRect) -> CGRect {
			
			return CGRect(x: bounds.origin.x + padding, y: bounds.origin.y, width: bounds.width - padding * 2, height: bounds.height)
	    }

}
//MARK: UIPickerViewDelegate
extension PickerTextField: UIPickerViewDelegate, UIPickerViewDataSource
{
	/*
	*    Below methods are delegate methods of picker view .
	*	 These are used to know how much data to be shown and which data to be shown at which row.
	*/
	public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
		return stringPickerData?.count ?? 0
	}
	
	public func numberOfComponents(in pickerView: UIPickerView) -> Int {
		return 1
	}
	func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
		return stringPickerData![row]
	}
	
}












/// New  Picker View type copy of previous PickerTextField class

@IBDesignable
class PickerTextFieldWithNext: UITextField
{
    //MARK:- TableVIew section identify
    var section:Int?
    let padding: CGFloat = 5.0
    
    var cancelTitle:String?
    var DoneTitle:String?

    @IBInspectable
    var leftImage: UIImage? {
        get{
            return (self.leftView as? UIImageView)?.image
        }
        set {
            guard let image=newValue else {return}
            self.setLeftImage(image: image)
        }
    }
    @IBInspectable
    var rightImage: UIImage? {
        get{
            return (self.rightView as? UIImageView)?.image
        }
        set {
            guard let image=newValue else {return}
            self.setRightImage(image: image)
        }
    }
    
    @IBInspectable
    var rightImageWidth: CGFloat = 0.0 {
        willSet{
            setRightImage(image: rightImage, width: newValue)
        }
    }
    @IBInspectable
    var leftImageWidth: CGFloat = 0.0 {
        willSet{
            setLeftImage(image: leftImage, width: newValue)
        }
    }
    
    open var pickerType: TextFieldPickerType? {
        
        didSet {
            guard let type = pickerType else {
                inputView=nil
                return
            }
            
            
            switch type {
            case .DatePicker :
                datePicker = UIDatePicker()
                datePicker?.datePickerMode = .date
                dateFormatter.dateFormat = "dd/MM/yyyy"
            case .TimePicker :
                datePicker = UIDatePicker()
                datePicker?.datePickerMode = .time
                dateFormatter.dateFormat = "HH:mm"
            case .DateTimePicker :
                datePicker = UIDatePicker()
                datePicker?.datePickerMode = .dateAndTime
                dateFormatter.dateFormat = "dd/MM/YYYY HH:mm"
            case .StringPicker, .HourMinuteSecond:
                stringPicker = UIPickerView()
                break
            }
            
            inputAccessoryView = toolbar
        }
    }
    
    // For DatePicker
    open var dateFormatter = DateFormatter()
    open var dateDidChange: ((_ date:Date,_ textField:UITextField) -> Void)?
    
    
    open var datePicker: UIDatePicker? {
        get {
            return self.inputView as? UIDatePicker
        }
        set {
            inputView = newValue
        }
    }
    
    // For String Picker
    
    open var stringPickerData: [String]?
    open var stringDidChange: ((_ index:Int,_ textField:UITextField) -> Void)?
    open var cancelBtnPressd: (() -> Void)?
    open var DoneBtnPressd: ((_ textField:UITextField) -> Void)?
    
    open var stringPicker: UIPickerView? {
        get {
            return self.inputView as? UIPickerView
        }
        set(picker) {
            picker?.delegate = self
            inputView = picker
        }
    }
    
    
    // Configurations
    /*
     *    Below method is used to initialze toolbar located above keyboard.
     *
     */
    open var toolbar: UIToolbar {
        
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor.blue
        toolBar.sizeToFit()
        
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                          target: nil,
                                          action: nil)
        // set Custome Title
        if let next = self.cancelTitle, let done = DoneTitle{
            let nextButton = UIBarButtonItem.init(title:next, style: .plain, target: self, action: #selector(PickerTextField.cancelAction))
            let doneButton = UIBarButtonItem.init(title:done, style: .plain, target: self, action: #selector(PickerTextField.doneAction))
            
         
            
            toolBar.setItems([nextButton, spaceButton, doneButton], animated: false)
            
        }
        else{
            
            let doneButton = UIBarButtonItem(barButtonSystemItem: .done,
                                             target: self,
                                             action: #selector(PickerTextField.doneAction))
            
            let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel,
                                               target: self,
                                               action: #selector(PickerTextField.cancelAction))
            
 
            toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        }
        
        
      
        toolBar.isUserInteractionEnabled = true
        inputAccessoryView = toolBar
        return toolBar
    }
    /*
     *    Below method is action of Done button of toolbar located above keyboard.
     *    This method will call back to controller according picker type of text field.
     */
    @objc func doneAction() {
        
        guard let type = pickerType else {
            return
        }
        
        switch type {
        case .DatePicker , .TimePicker , .DateTimePicker:
            
            let date = datePicker!.date
            self.text = dateFormatter.string(from: date)
            
            dateDidChange?(date,self)
            
            break
        case .StringPicker:
            let row = stringPicker!.selectedRow(inComponent: 0)
            
            if let arr=stringPickerData, arr.count > row{
                self.text = arr[row]
            }
            stringDidChange?(row,self)
            
            break
            
        case .HourMinuteSecond:
            break
        }
        
        resignFirstResponder()
        DoneBtnPressd?(self)
    }
    
    @objc func cancelAction() {
        resignFirstResponder()
        text=""
        
        guard let type = pickerType else {
            return
        }
        
        switch type {
        case .DatePicker , .TimePicker , .DateTimePicker:
            dateDidChange?(Date(),self)
            break
        case .StringPicker:
            cancelBtnPressd?()
            break
        case .HourMinuteSecond:
            break
        }
    }
    //MARK:- Initializer methods
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        super.draw(rect)
        /*let bottom_view=UIView(frame: CGRect(x: 0, y: self.bounds.size.height-1, width:self.bounds.size.width , height: 0.5))
         bottom_view.backgroundColor=UIColor.lightGray
         bottom_view.tag=1000
         self.addSubview(bottom_view)*/
//        self.tintColor = UIColor.blue
		setupPlaceHolderColor()
    }
    required init(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)!
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
		setupPlaceHolderColor()
    }
	func setupPlaceHolderColor(){
		self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: UIColor.darkGray])
	}
}

extension PickerTextFieldWithNext
{
    
    func canPerformAction(action: Selector, withSender sender: AnyObject?) -> Bool {
        UIMenuController.shared.isMenuVisible = false
        //#selector(UIResponderStandardEditActions.copy(_:))
        
        if action == #selector(UIResponderStandardEditActions.paste(_:)) {
            
            return false
        }
        
        return super.canPerformAction(action, withSender:sender)
    }
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        if action == #selector(UIResponderStandardEditActions.paste(_:)) {
            return false
        }else if action == #selector(UIResponderStandardEditActions.copy(_:)) {
            return false
        }else if action == #selector(UIResponderStandardEditActions.cut(_:)) {
            return false
        }else if action == #selector(UIResponderStandardEditActions.select(_:)) {
            return false
        }else if action == #selector(UIResponderStandardEditActions.selectAll(_:)) {
            return false
        }
        
        return super.canPerformAction(action, withSender:sender)
    }
    
    //MARK:- override methods
    
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect
    {
        var textRect = super.leftViewRect(forBounds: bounds)
        textRect.origin.x  += 0
        return textRect
    }
    
    //FIXME: Use Below code as per your requirements.
    /*
     *   Uncomment below methods to provide custom edge insets.
     */
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        
        return CGRect(x: bounds.origin.x + padding, y: bounds.origin.y, width: bounds.width - padding * 2, height: bounds.height)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        
        return CGRect(x: bounds.origin.x + padding, y: bounds.origin.y, width: bounds.width - padding * 2, height: bounds.height)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        
        return CGRect(x: bounds.origin.x + padding, y: bounds.origin.y, width: bounds.width - padding * 2, height: bounds.height)
    }
    
}
//MARK: UIPickerViewDelegate
extension PickerTextFieldWithNext: UIPickerViewDelegate, UIPickerViewDataSource
{
    /*
     *    Below methods are delegate methods of picker view .
     *     These are used to know how much data to be shown and which data to be shown at which row.
     */
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return stringPickerData?.count ?? 0
    }
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return stringPickerData![row]
    }
    
}





