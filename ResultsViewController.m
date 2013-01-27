//
//  ResultsViewController.m
//  CaratCalculator
//
//  Created by Bobby Koczon on 1/19/13.
//  Copyright (c) 2013 Bobby Koczon. All rights reserved.
//

#import "ResultsViewController.h"

@interface ResultsViewController ()

@end

@implementation ResultsViewController

//@synthesize stoneResultsLabel = _stoneResultsLabel, caratResultsLabel = _caratResultsLabel;

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
	// Do any additional setup after loading the view.
    self.stoneResultsLabel.text = [NSString stringWithFormat:@"%d stones", self.stoneResults];
    self.caratResultsLabel.text = [NSString stringWithFormat:@"%.3f", self.caratResults];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
