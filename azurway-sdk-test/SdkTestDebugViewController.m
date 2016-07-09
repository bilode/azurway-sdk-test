//
//  EntryDebugViewController.m
//  AW-PI-demo
//
//  Created by Timothée Bilodeau on 16/06/16.
//  Copyright © 2016 Timothée Bilodeau. All rights reserved.
//

#import <AzurWaySdk/AzurWaySdkOptions.h>

#import "SdkTestDebugViewController.h"
#import "AzurWaySdk/AzurWaySdk.h"

#define kButtonNow 0
#define kButtonBooking 1
#define kButtonActivity 2
#define kButtonMyOrder 3

@interface SdkTestDebugViewController ()

@end

@implementation SdkTestDebugViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
} 

#pragma mark - Navigation

- (IBAction)goToNextScreen:(UIButton*)sender {
    [AzurWaySdk setToken:@"QSVVQzJf7KW1j4PDp8ek6gc8DkSaR9dC" userId:@"38" andDepartureLocation:[[CLLocation alloc] initWithLatitude:48.816528 longitude:2.370457]];
    
    self.containerVC = [[UIViewController alloc] init];
    self.containerVC.view.frame = CGRectMake(0, 0,
                                             CGRectGetWidth(self.view.bounds),
                                             CGRectGetHeight(self.view.bounds));
    self.containerVC.view.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.containerVC.view];
    [self addChildViewController:self.containerVC];
    [self.containerVC didMoveToParentViewController:self];
    
    AzurWaySdkOptions *options = [[AzurWaySdkOptions alloc] init];
    
    switch (sender.tag) {
        case kButtonNow:
            options.now = YES;
            [AzurWaySdk launchBookingFrom:self.containerVC withOptions:options];
            break;
        case kButtonBooking:
            options.type = e_booking;
            [AzurWaySdk launchBookingFrom:self.containerVC withOptions:options];
            break;
        case kButtonActivity:
            options.type = e_activity;
            options.destination = [[CLLocation alloc] initWithLatitude:48.845095
                                                             longitude:2.374549];
            options.arrivalDate = [NSDate dateWithTimeIntervalSinceNow:2 * 3600];
            [AzurWaySdk launchBookingFrom:self.containerVC withOptions:options];
            break;
        case kButtonMyOrder:
            [AzurWaySdk launchMyOrderFrom:self.containerVC withOptions:options];
            break;
        default:
            break;
    }
}

@end
