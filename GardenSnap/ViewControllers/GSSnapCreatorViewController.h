//
//  GSSnapCreatorViewController.h
//  GardenSnap
//
//  Created by Christopher Martin on 11/23/13.
//  Copyright (c) 2013 GardenSnap. All rights reserved.
//

#import <UIKit/UIKit.h>
@import CoreLocation;

@interface GSSnapCreatorViewController : UIViewController <UINavigationControllerDelegate,
                                                           UIImagePickerControllerDelegate,
                                                           CLLocationManagerDelegate,
                                                           UITextFieldDelegate,
                                                           UITextViewDelegate>

@property (nonatomic, weak) IBOutlet UITextField *nameField;
@property (nonatomic, weak) IBOutlet UITextView *notesField;
@property (nonatomic, weak) IBOutlet UIImageView *snapImage;

@property (nonatomic, strong) NSString *plantName;

-(IBAction)saveSnap:(id)sender;
@end
