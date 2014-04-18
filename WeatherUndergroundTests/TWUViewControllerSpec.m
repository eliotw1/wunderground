//
//  TWUViewControllerSpec.m
//  WeatherUnderground
//
//  Created by Christopher Trevarthen on 4/18/14.
//  Copyright (c) 2014 Christopher + Apprenti. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "TWUViewController.h"
#import <AFNetworking.h>


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
            it(@"sets current city", ^{
                [[viewController.city shouldNot] beNil];
            });
            it(@"sets current state", ^{
                [[viewController.state shouldNot] beNil];
            });
        });
        context(@"when we call FetchCurrentTemperature", ^{
            context(@"when the network call succeeds", ^{
                __block void (^successBlock) (AFHTTPRequestOperation *operation, id responseObject);
                __block KWCaptureSpy *successBlockSpy;
                __block NSDictionary *mockJSON;
                
                beforeEach(^{
                    NSURL *mockUrl = [NSURL nullMock];
                    [NSURL stub:@selector(URLWithString:) andReturn:mockUrl];
                    
                    NSURLRequest *mockRequest = [NSURLRequest nullMock];
                    [NSURLRequest stub:@selector(requestWithURL:) andReturn:mockRequest withArguments:mockUrl];
                    AFHTTPRequestOperation *mockOp = [AFHTTPRequestOperation nullMock];
                    [AFHTTPRequestOperation stub:@selector(alloc) andReturn:mockOp];
                    [mockOp stub:@selector(initWithRequest:) andReturn:mockOp withArguments:mockRequest];
                    
                    [AFJSONRequestSerializer stub:@selector(serializer) andReturn:[AFJSONRequestSerializer nullMock]];
                    
                    mockJSON = @{@"current_observation":@{@"temperature_string": @"67"}};
                    
                    NSOperationQueue *mockOperationQueue = [NSOperationQueue nullMock];
                    [NSOperationQueue stub:@selector(mainQueue) andReturn:mockOperationQueue];
                    [mockOperationQueue stub:@selector(addOperation:) withArguments:any()];
                    
                    successBlockSpy = [mockOp captureArgument:@selector(setCompletionBlockWithSuccess:failure:) atIndex:0];
                    
                    [viewController fetchCurrentTemperature];
                });
                it(@"parses the JSON from Wunderground", ^{
                    [[viewController should] receive:@selector(setTemperature:) withArguments:@"67"];
                    
                    successBlock = successBlockSpy.argument;
                    successBlock(nil, mockJSON);
                });
                it(@"should display the temperature in the view", ^{
                    viewController.tempLabel = [[UILabel alloc]init];
                    [[viewController.tempLabel should] receive:@selector(setText:) withArguments:@"67"];
                    
                    successBlock = successBlockSpy.argument;
                    successBlock(nil, mockJSON);
                });
            });
        });
    });


SPEC_END
