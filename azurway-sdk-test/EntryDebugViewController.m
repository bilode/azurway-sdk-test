//
//  EntryDebugViewController.m
//  AW-PI-demo
//
//  Created by Timothée Bilodeau on 16/06/16.
//  Copyright © 2016 Timothée Bilodeau. All rights reserved.
//

#import "EntryDebugViewController.h"
#import "ShipmentViewController.h"
#import "MyOrderViewController.h"
#import "Order.h"

#define kButtonNow 0
#define kButtonBooking 1
#define kButtonActivity 2
#define kButtonMyOrder 3

@interface EntryDebugViewController ()

@end

@implementation EntryDebugViewController

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
    AWPIViewController *destinationVC;
    Order *order;
    Activity *activity;

    switch (sender.tag) {
        case kButtonNow:
            order = [[Order alloc] init];
            order.vehicleAsap = YES;
            order.startingLocation = [[Place alloc] initWithAddress:@"45 Rue Barbès 94200 Ivry-sur-Seine" latitude:48.816528 longitude:2.370457];
            destinationVC = [[ShipmentViewController alloc] initWithOrder:order];
            break;
        case kButtonBooking:
            order = [[Order alloc] init];
            order.startingLocation = [[Place alloc] initWithAddress:@"45 Rue Barbès 94200 Ivry-sur-Seine" latitude:48.816528 longitude:2.370457];
            destinationVC = [[ShipmentViewController alloc] initWithOrder:order];
            break;
        case kButtonActivity:
            activity = [[Activity alloc] init];
            activity.startDate = [NSDate dateWithTimeIntervalSinceNow:2 * 3600];
//            activity.place = [[Place alloc] initWithAddress:@"71 rue Jean Jacques Rousseau 92150 Suresnes"];
            activity.place = [[Place alloc] initWithLatitude:48.866120 longitude:2.222973];
            order = [[Order alloc] initWithActivity:activity];
            order.startingLocation = [[Place alloc] initWithAddress:@"45 Rue Barbès 94200 Ivry-sur-Seine" latitude:48.816528 longitude:2.370457];
            destinationVC = [[ShipmentViewController alloc] initWithOrder:order];
            break;
        case kButtonMyOrder:
            destinationVC = [[MyOrderViewController alloc] init];
            break;
        default:
            @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                           reason:[NSString stringWithFormat:@"%@ : You must set the button tag to the VehicleType enum", NSStringFromSelector(_cmd)]
                                         userInfo:nil];
            break;
    }
    [self.navigationController pushViewController:destinationVC animated:YES];
}

@end
