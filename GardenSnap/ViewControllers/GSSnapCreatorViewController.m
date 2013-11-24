//
//  GSSnapCreatorViewController.m
//  GardenSnap
//
//  Created by Christopher Martin on 11/23/13.
//  Copyright (c) 2013 GardenSnap. All rights reserved.
//

@import CoreLocation;
#import "GSSnapCreatorViewController.h"
#import "GSSnap.h"

@interface GSSnapCreatorViewController ()
@property (nonatomic, strong) UIImagePickerController *imagePicker;
@property (nonatomic, readonly) CLLocationManager *locationManager;
@property (nonatomic, strong) CLLocation *lastLocationReading;
@property (nonatomic, assign) BOOL didCaptureImage;

-(void)showImagePicker;
@end

@implementation GSSnapCreatorViewController

@synthesize plantName = _plantName;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.didCaptureImage = NO;
        _locationManager = [[CLLocationManager alloc] init];
        [_locationManager startMonitoringSignificantLocationChanges];
    }
    return self;
}

-(void)viewDidLoad{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

-(void)viewDidAppear:(BOOL)animated{
    if (NO == self.didCaptureImage) {
        [self showImagePicker];
    }

}

-(void)showImagePicker{
    if (NO == [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Camera Required"
                                                        message:@"This application requres a camera."
                                                       delegate:self cancelButtonTitle:@"Cancel"
                                              otherButtonTitles:nil];
        [alert show];
        return;
    }
    
    self.imagePicker = [[UIImagePickerController alloc] init];
    [self.imagePicker setSourceType: UIImagePickerControllerSourceTypeCamera];
    [self.imagePicker setDelegate:self];
    [self presentViewController:self.imagePicker animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

-(void)setPlantName:(NSString *)plantName{
    _plantName = plantName;
    self.nameField.text = plantName;
}

-(NSString*)plantName{
    return _plantName;
}

#pragma mark - IBAction
-(IBAction)saveSnap:(id)sender {
    GSSnap *newSnap = [[GSSnap alloc] init];
    newSnap.image = self.snapImage.image;
    newSnap.location = self.lastLocationReading.coordinate;
    newSnap.plantName = self.nameField.text;
    newSnap.notes = self.notesField.text;
    
    NSLog(@"Created snap: %@", newSnap);
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}

#pragma mark - UIImagePickerControllerDelegate
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    [self.snapImage setImage:info[UIImagePickerControllerOriginalImage]];
    
    [self.imagePicker dismissViewControllerAnimated:YES completion:nil];
    self.didCaptureImage = YES;
}

#pragma mark - CLLocationManagerDelegate
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
    self.lastLocationReading = [locations firstObject];
}

#pragma mark - UITextFieldDelegate
-(void)textFieldDidEndEditing:(UITextField *)textField{
    _plantName = textField.text;
    [textField resignFirstResponder];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return NO;
}

#pragma mark - UITextViewDelegate
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
    }
    return YES;
}
@end
