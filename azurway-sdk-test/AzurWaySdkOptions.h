//
//  AzurWaySdkOptions.h
//  azurway-sdk-test
//
//  Created by Timothée Bilodeau on 01/07/16.
//  Copyright © 2016 Timothée Bilodeau. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

typedef enum OrderTypes
{
    e_order_placeholder,
    e_booking,
    e_activity,
    e_airport
} OrderType;

@interface AzurWaySdkOptions : NSObject

@property (strong, nonatomic) CLLocation *destination;
@property (strong, nonatomic) NSDate *arrivalDate;
@property (assign, nonatomic) BOOL now;
@property (assign, nonatomic) OrderType type;

@end