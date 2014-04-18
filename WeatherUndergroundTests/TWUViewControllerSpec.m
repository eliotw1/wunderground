//
//  TWUViewControllerSpec.m
//  WeatherUnderground
//
//  Created by Christopher Trevarthen on 4/18/14.
//  Copyright (c) 2014 Christopher + Apprenti. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "TWUViewController.h"

//@interface TWUViewController ()
//
//- (void)fetchCurrentTemperature;
//
//@end


SPEC_BEGIN(TWUViewControllerSpec)

    describe(@"TWUViewController", ^{
        __block TWUViewController *viewController;
		beforeEach(^{
            viewController = [[TWUViewController alloc] init];
        });
        context(@"user opens app", ^{
            beforeEach(^{
                 [viewController viewDidLoad];
            });
           it(@"sets a current temp", ^{
               [[viewController.temperature shouldNot] beNil];
           });
            xit(@"displays the current temp", ^{
                [[viewController.tempLabel.text should] equal:viewController.temperature];
            });
            it(@"sets current city", ^{
                [[viewController.city shouldNot] beNil];
            });
            it(@"sets current state", ^{
                [[viewController.state shouldNot] beNil];
            });
        });
        context(@"when we call FetchCurrentTemperature", ^{
            it(@"Sets a different temperature from current temp", ^{
                viewController.temperature = @"300000";
                [viewController fetchCurrentTemperature];
                [[viewController.temperature shouldNot] equal:@"300000"];
            });
        });
    
    });
	
SPEC_END
