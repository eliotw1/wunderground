//
//  TWUViewController.m
//  WeatherUnderground
//
//  Created by Christopher Trevarthen on 4/18/14.
//  Copyright (c) 2014 Christopher + Apprenti. All rights reserved.
//

#import "TWUViewController.h"

@interface TWUViewController ()

@end

@implementation TWUViewController

- (void)fetchCurrentTemperature
{
    self.temperature = @"30";
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.temperature = @"57";
    self.tempLabel.text = self.temperature;
    self.city = @"Detroit";
    self.state = @"MI";
    [self fetchCurrentTemperature];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
