//
//  GSSnap.h
//  GardenSnap
//
//  Created by Christopher Martin on 11/23/13.
//  Copyright (c) 2013 GardenSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
@import CoreLocation;

@interface GSSnap : NSObject
@property (nonatomic, strong) NSDate *dateStamp;
@property (nonatomic, assign) CLLocationCoordinate2D location;
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, copy) NSString *plantName;
@property (nonatomic, copy) NSString *notes;
@end
