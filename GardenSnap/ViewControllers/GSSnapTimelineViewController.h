//
//  GSSnapTimelineViewController.h
//  GardenSnap
//
//  Created by Christopher Martin on 11/23/13.
//  Copyright (c) 2013 GardenSnap. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GSSnapTimelineViewController : UICollectionViewController

@property (nonatomic, strong) NSString *timelinePlantName;

-(IBAction)newSnap:(id)sender;
@end
