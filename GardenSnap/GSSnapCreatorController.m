//
//  GSSnapCreatorController.m
//  GardenSnap
//
//  Created by Christopher Martin on 11/23/13.
//  Copyright (c) 2013 GardenSnap. All rights reserved.
//

#import "GSSnapCreatorController.h"
#import "GSSnap.h"

@interface GSSnapCreatorController ()
@property (nonatomic, strong) UIViewController *parentViewController;
@property (nonatomic, copy) GSSnapCreatedBlock snapCompletedBlock;
@property (nonatomic, readonly) CLLocationManager *locationManager;
@property (nonatomic, strong) CLLocation *lastLocationReading;
@end

@implementation GSSnapCreatorController

-(instancetype)initWithViewController:(UIViewController *)viewController{
    self = [super init];
    if (self) {
        self.parentViewController = viewController;
        _locationManager = [[CLLocationManager alloc] init];
        //we dont' really care about huge precision for location
        [_locationManager startMonitoringSignificantLocationChanges];
    }
    
    return self;
}

-(void)showSnapCreatorWithCompletion:(GSSnapCreatedBlock)completion{
    self.snapCompletedBlock = completion;
    
    //todo csm make sure to specify in info plist that a camera is needed
    if (NO == [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"No Camera Detected" message:@"This app requires a camera to function." delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:nil];
        [alert show];
        
        return;
    }
    
    UIImagePickerController *imgPicker = [[UIImagePickerController alloc] init];
    [imgPicker setSourceType:UIImagePickerControllerSourceTypeCamera];
    [imgPicker setDelegate:self];
    
    [self.parentViewController presentViewController:imgPicker animated:YES completion:nil];
}

#pragma mark - UIImagePickerDelegate
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    GSSnap *newSnap = [[GSSnap alloc] init];
    
    UIImage *img = info[UIImagePickerControllerOriginalImage];
    newSnap.image = img;
    newSnap.location = self.lastLocationReading.coordinate;
    
    [self.parentViewController dismissViewControllerAnimated:YES completion:^{
        if (self.snapCompletedBlock) {
            self.snapCompletedBlock(newSnap);
        }
    }];
}

#pragma mark - CLLocationManager delegate
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
    self.lastLocationReading = [locations firstObject];
}
@end
