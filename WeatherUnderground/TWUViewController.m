//
//  TWUViewController.m
//  WeatherUnderground
//
//  Created by Christopher Trevarthen on 4/18/14.
//  Copyright (c) 2014 Christopher + Apprenti. All rights reserved.
//

#import "TWUViewController.h"
#import <AFNetworking.h>
@interface TWUViewController ()

@end

@implementation TWUViewController

- (void)fetchCurrentTemperature
{
    NSURL *URL = [NSURL URLWithString:@"http://api.wunderground.com/api/9ceac7e6eae5cd1e/conditions/q/MI/Detroit.json"];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    AFHTTPRequestOperation *op = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    op.responseSerializer = [AFJSONResponseSerializer serializer];
    [op setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        self.temperature = responseObject[@"current_observation"][@"temperature_string"];
        self.tempLabel.text = responseObject[@"current_observation"][@"temperature_string"];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    [[NSOperationQueue mainQueue] addOperation:op];

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
