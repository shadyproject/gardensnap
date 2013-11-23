//
//  GSRootViewController.h
//  GardenSnap
//
//  Created by Christopher Martin on 11/23/13.
//  Copyright (c) 2013 GardenSnap. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GSRootViewController : UITableViewController <UINavigationControllerDelegate,
                                                         UIImagePickerControllerDelegate,
                                                         CLLocationManagerDelegate>

-(IBAction)newSnap:(id)sender;

@end
