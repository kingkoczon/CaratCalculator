//
//  CalculatorViewController.h
//  CaratCalculator
//
//  Created by Bobby Koczon on 1/19/13.
//  Copyright (c) 2013 Bobby Koczon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CalculatorViewController : UIViewController

@property (nonatomic, retain) IBOutlet UIPickerView *ringSizePicker;
@property (nonatomic, retain) IBOutlet UIPickerView *stoneDiameterPicker;

@property (nonatomic, strong) NSMutableArray *ringSizesArray;
@property (nonatomic, strong) NSMutableArray *stoneDiameterArray;

@property (nonatomic, strong) NSDictionary *calculationsResults;

@property (weak, nonatomic) IBOutlet UIButton *calculateButton;

@end
