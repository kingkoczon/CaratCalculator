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

//@synthesize ringSizePicker = _ringSizePicker, stoneDiameterPicker = _stoneDiameterPicker;
//@synthesize ringSizesArray = _ringSizesArray, stoneDiameterArray = _stoneDiameterArray;
//@synthesize calculateButton = _calculateButton;
//@synthesize calculationsResults = _calculationsResults;

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
    
    NSString *calculationsFile = [[NSBundle mainBundle] pathForResource:@"calculations" ofType:@"plist"];
    _calculationsResults = [NSArray arrayWithContentsOfFile:calculationsFile];
    
    for (NSDictionary *mainDict in _calculationsResults) {
        //for (NSDictionary *subDict in mainDict) {
            for (NSString *items in mainDict) {
                NSLog(@"Item found.");
                [_ringSizesArray addObject:items];
                 NSLog(@"Array is: %@", _ringSizesArray);
            }
       
        
        for (NSDictionary *subDict in mainDict) {
            for (NSDictionary *nextDict in subDict) {
                for (NSString *specs in nextDict) {
                    if ([specs isEqualToString:@"diameter"]) {
                        [_stoneDiameterArray addObject:specs];
                    }
                    //[nextDict valueForKey:specs];
               }
                
            }
        }
        //}
    }
    
    
       
                       
                       
    //initWithObjects:@"3", @"3.5", @"4", @"4.5", @"5", @"5.5", @"6", @"6.5", @"7", @"7.5", @"8", @"8.5", nil];
   //_stoneDiameterArray = [[NSArray alloc] initWithObjects:@"1.0 mm", @"1.2 mm", @"1.3mm", @"1.5 mm", @"1.7 mm", @"1.8 mm", @"2.0 mm", @"2.1 mm", @"2.2 mm", @"2.4 mm", @"2.5 mm", @"2.7 mm", @"2.8 mm", @"3.0 mm", @"3.1 mm", @"3.2 mm", @"3.4 mm", @"3.6 mm", @"3.8 mm", @"4.1 mm", nil];
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
    
    //    float ringSizeNumber = [[_ringSizesArray objectAtIndex:row] floatValue];
    //    float stoneDiameterNumber = [[_stoneDiameterArray objectAtIndex:row] floatValue];
    //
    
    //
    //    NSString *stoneNumberResults = [_calculationsResults objectForKey:@"stones"];
    //    NSString *caratNumberResults = [_calculationsResults objectForKey:@"carats"];
    //
    //
    //
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

#pragma mark - Segue method

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue destinationViewController] isKindOfClass:[ResultsViewController class]]) {
        
        // The calculate button was tapped.
        // Before the results view controller appears, do the calculation, then set the labels on the destination view controller.
        
        // Figure out which row indexes are currently selected in the two pickers.
        NSInteger selectedRingSizeIndex = [self.ringSizePicker selectedRowInComponent:0];
        NSInteger selectedStoneDiameterIndex = [self.stoneDiameterPicker selectedRowInComponent:0];
        
        // Get the corresponding values from your arrays.
        float ringSize = [[self.ringSizesArray objectAtIndex:selectedRingSizeIndex] floatValue];
        float stoneDiameter = [[self.stoneDiameterArray objectAtIndex:selectedStoneDiameterIndex] floatValue];
        
        NSLog(@"Ring size at selected index %d: %.3f", selectedRingSizeIndex, ringSize);
        NSLog(@"Stone diameter at selected index %d: %.3f", selectedStoneDiameterIndex, stoneDiameter);
        
        // Then you need to do your calculation (or lookup) here based on the ringSize and stone diameter:
        // ...
        // ...
        // ...
        
        // Suppose this is the result of your calculation.
        NSInteger numberOfStones = 42;
        float numberOfCarats = 0.456;
        
        // Then set the properties on the ResultsViewController so when it gets pushed, it will have the data it needs to show the right thing.
        // You can't just set the labels directly, because the view objects won't have been loaded yet at this point, so you need to create properties to hold the data, and then set the labels in the ResultsViewController viewDidLoad:.
        
        // Typecast the destinationViewController, which will let the compiler know it's a ResultsViewController and will allow you to set the properties on it.
        ResultsViewController *resultsViewController = (ResultsViewController *)[segue destinationViewController];
        
        // Set the results properties.
        resultsViewController.stoneResults = numberOfStones;
        resultsViewController.caratResults = numberOfCarats;
        
        // The labels will be set in -[ResultsViewController viewDidLoad:].
    }
}



@end
