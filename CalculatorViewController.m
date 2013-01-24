//
//  CalculatorViewController.m
//  CaratCalculator
//
//  Created by Bobby Koczon on 1/19/13.
//  Copyright (c) 2013 Bobby Koczon. All rights reserved.
//

#import "CalculatorViewController.h"
#import "ResultsViewController.h"

@interface CalculatorViewController ()

@end

@implementation CalculatorViewController

@synthesize ringSizePicker = _ringSizePicker, stoneDiameterPicker = _stoneDiameterPicker;
@synthesize ringSizesArray = _ringSizesArray, stoneDiameterArray = _stoneDiameterArray;
@synthesize calculateButton = _calculateButton;
@synthesize calculationsResults = _calculationsResults;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _ringSizesArray = [[NSArray alloc] initWithObjects:@"3", @"3.5", @"4", @"4.5", @"5", @"5.5", @"6", @"6.5", @"7", @"7.5", @"8", @"8.5", nil];
    _stoneDiameterArray = [[NSArray alloc] initWithObjects:@"1.0 mm", @"1.2 mm", @"1.3mm", @"1.5 mm", @"1.7 mm", @"1.8 mm", @"2.0 mm", @"2.1 mm", @"2.2 mm", @"2.4 mm", @"2.5 mm", @"2.7 mm", @"2.8 mm", @"3.0 mm", @"3.1 mm", @"3.2 mm", @"3.4 mm", @"3.6 mm", @"3.8 mm", @"4.1 mm", nil];
	// Do any additional setup after loading the view.
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark picker view methods
#pragma mark -

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView;
{
    if([pickerView isEqual: _ringSizePicker])
    {
        // return the appropriate number of components, for instance
        return 1;
    }
       
    if([pickerView isEqual: _stoneDiameterPicker])
    {
        // return the appropriate number of components, for instance
        return 1;
    }
    
    else {
        return 0;
    }
}

#pragma mark -
#pragma mark PickerView Delegate
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    float ringSizeNumber = [[_ringSizesArray objectAtIndex:row] floatValue];
    float stoneDiameterNumber = [[_stoneDiameterArray objectAtIndex:row] floatValue];
    
    NSString *calculationsFile = [[NSBundle mainBundle] pathForResource:@"calculations" ofType:@"plist"];
    _calculationsResults = [NSDictionary dictionaryWithContentsOfFile:calculationsFile];
    
    NSString *stoneNumberResults = [_calculationsResults objectForKey:@"stones"];
    NSString *caratNumberResults = [_calculationsResults objectForKey:@"carats"];
    
    

}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component;
{
    if([pickerView isEqual: _ringSizePicker])
    {
        // return the appropriate number of components, for instance
        return _ringSizesArray.count;
    }
    
    if([pickerView isEqual: _stoneDiameterPicker])
    {
        // return the appropriate number of components, for instance
        return _stoneDiameterArray.count;
    }
    
    else {
        return 0;
    }

}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component;
{
    if([pickerView isEqual: _ringSizePicker])
    {
        // return the appropriate number of components, for instance
        return [_ringSizesArray objectAtIndex:row];
    }
    
    if([pickerView isEqual: _stoneDiameterPicker])
    {
        // return the appropriate number of components, for instance
        return [_stoneDiameterArray objectAtIndex:row];
    }
    
    else {
        return 0;
    }
}


@end
