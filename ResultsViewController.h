//
//  ResultsViewController.h
//  CaratCalculator
//
//  Created by Bobby Koczon on 1/19/13.
//  Copyright (c) 2013 Bobby Koczon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ResultsViewController : UIViewController

@property (assign, nonatomic) NSInteger stoneResults;
@property (assign, nonatomic) float caratResults;
@property (weak, nonatomic) IBOutlet UILabel *stoneResultsLabel;
@property (weak, nonatomic) IBOutlet UILabel *caratResultsLabel;

@end
