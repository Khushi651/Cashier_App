//
//  HourMinuteSecondPicker.swift
//  Ridalyze
//
//  Created by Krishan Kumar on 25/06/18.
//  Copyright © 2018 Krishan Kumar. All rights reserved.
//

import UIKit

@IBDesignable
class HourMinuteSecondPicker: UITextField
{
	//MARK:- TableVIew section identify
	var section:Int?

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
			case .StringPicker:
				stringPicker = UIPickerView()
			case .HourMinuteSecond:
				 hour=0; minutes=0 ; seconds=0
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
	var hour:Int?
	var minutes:Int?
	var seconds:Int?
	open var stringDidChange: ((_ index:Int,_ textField:UITextField) -> Void)?
	
	
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
			let row = stringPicker!.selectedRow(inComponent: 0)
			if let hr=hour,let min=minutes,let sec=seconds{ //Hour/Minute/seconds picker
				let str_HR=hr<10 ? "0\(hr)" : "\(hr)"
				let str_MIN=min<10 ? "0\(min)" : "\(min)"
				let str_SEC=sec<10 ? "0\(sec)" : "\(sec)"
				
				self.text=str_HR+":"+str_MIN+":"+str_SEC
				stringDidChange?(row,self)
			}
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
			dateDidChange?(Date(),self)
			break
		case .StringPicker, .HourMinuteSecond:
			break
		}
	}
	//MARK:- Initializer methods
	// Only override drawRect: if you perform custom drawing.
	// An empty implementation adversely affects performance during animation.
	override func draw(_ rect: CGRect) {
		// Drawing code
		super.draw(rect)
		let bottom_view=UIView(frame: CGRect(x: 0, y: self.bounds.size.height-1, width:self.bounds.size.width , height: 0.5))
		bottom_view.backgroundColor=UIColor.lightGray
		
		self.addSubview(bottom_view)
		
	}
	required init(coder aDecoder: NSCoder) {
		
		super.init(coder: aDecoder)!
	}
	override init(frame: CGRect) {
		super.init(frame: frame)
	}
}

extension HourMinuteSecondPicker
{
	
	func canPerformAction(action: Selector, withSender sender: AnyObject?) -> Bool {
		UIMenuController.shared.isMenuVisible = false
		//#selector(UIResponderStandardEditActions.copy(_:))
		if action == #selector(UIResponderStandardEditActions.paste(_:)) {
			
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
	/*
	override func textRect(forBounds bounds: CGRect) -> CGRect {
	
	return UIEdgeInsetsInsetRect(bounds, UIEdgeInsetsMake(0, leftEdge, 0, rightEdge))
	}
	
	override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
	
	return UIEdgeInsetsInsetRect(bounds, UIEdgeInsetsMake(0, leftEdge, 0, rightEdge))
	}
	
	override func editingRect(forBounds bounds: CGRect) -> CGRect {
	
	return UIEdgeInsetsInsetRect(bounds, UIEdgeInsetsMake(0, leftEdge, 0, rightEdge))
	}
	*/
}
//MARK: UIPickerViewDelegate
extension HourMinuteSecondPicker: UIPickerViewDelegate, UIPickerViewDataSource
{
	/*
	*    Below methods are delegate methods of picker view .
	*	 These are used to know how much data to be shown and which data to be shown at which row.
	*/
	public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
		if let _=hour,let _=minutes,let _=seconds{ //Hour/Minute/seconds picker
			switch component {
			case 0:
				return 25
			case 1:
				return 60
				
			default:
				return 1000
			}
		}
		return stringPickerData?.count ?? 0
	}
	
	public func numberOfComponents(in pickerView: UIPickerView) -> Int {
		if let _=hour,let _=minutes,let _=seconds{ //Hour/Minute/seconds picker
			return 3
		}
		return 1
	}
	func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
		if let _=hour,let _=minutes,let _=seconds{ //Hour/Minute/seconds picker
			switch component {
			case 0:
				if row<10{
					return "0\(row) Min"
				}
				return "\(row) Min"
			case 1:
				if row<10{
					return "0\(row) Sec"
				}
				return "\(row) Sec"
			case 2:
				if row<10{
					return "0\(row) Mili"
				}
				return "\(row) Mili"
			default:
				return ""
			}
		}
		return stringPickerData![row]
	}
	func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
		if let _=hour,let _=minutes,let _=seconds{ //Hour/Minute/seconds picker
			switch component {
			case 0:
				hour = row
			case 1:
				minutes = row
			case 2:
				seconds = row
			default:
				break;
			}
		}
	}
}
