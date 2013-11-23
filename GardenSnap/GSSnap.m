//
//  GSSnap.m
//  GardenSnap
//
//  Created by Christopher Martin on 11/23/13.
//  Copyright (c) 2013 GardenSnap. All rights reserved.
//

#import "GSSnap.h"

@implementation GSSnap
-(instancetype)init{
    self = [super init];
    if (self) {
        _dateStamp = [NSDate date];
    }
    return self;
}

-(NSString*)description{
    NSString *desc = [NSString stringWithFormat:@"Snap %@ created %@", self.plantName, self.dateStamp];
    return desc;
}
@end
