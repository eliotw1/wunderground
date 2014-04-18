//
//  TWUViewController.h
//  WeatherUnderground
//
//  Created by Christopher Trevarthen on 4/18/14.
//  Copyright (c) 2014 Christopher + Apprenti. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TWUViewController : UIViewController

@property (nonatomic, strong) NSString *temperature;
@property (nonatomic, strong) IBOutlet UILabel *tempLabel;
@property (nonatomic, strong) NSString *city;
@property (nonatomic, strong) NSString *state;

- (void)fetchCurrentTemperature;

@end
