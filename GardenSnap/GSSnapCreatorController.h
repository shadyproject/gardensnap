//
//  GSSnapCreatorController.h
//  GardenSnap
//
//  Created by Christopher Martin on 11/23/13.
//  Copyright (c) 2013 GardenSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
@import CoreLocation;

@class GSSnap;

typedef void (^GSSnapCreatedBlock)(GSSnap*);

@interface GSSnapCreatorController : NSObject <UINavigationControllerDelegate,
                                                UIImagePickerControllerDelegate,
                                                CLLocationManagerDelegate>

-(instancetype)initWithViewController:(UIViewController*)viewController;

-(void)showSnapCreatorWithCompletion:(GSSnapCreatedBlock)completion;

@end
