//
//  GSRootViewController.m
//  GardenSnap
//
//  Created by Christopher Martin on 11/23/13.
//  Copyright (c) 2013 GardenSnap. All rights reserved.
//

#import "GSRootViewController.h"
#import "GSSnap.h"

static NSString *const kGSRootViewCellId = @"RootTableViewCell";

@interface GSRootViewController ()
@property (nonatomic, readonly) CLLocationManager *locationManager;
@property (nonatomic, strong) CLLocation *lastLocationReading;
@end

@implementation GSRootViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        _locationManager = [[CLLocationManager alloc] init];
        [_locationManager startMonitoringSignificantLocationChanges];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    // Return the number of sections.
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kGSRootViewCellId
                                                            forIndexPath:indexPath];
    
    cell.textLabel.text = [NSString stringWithFormat:@"Plant %d", indexPath.row];
    [cell.imageView setImage:[UIImage imageNamed:@"placeholder"]];
    
    return cell;
}

#pragma mark - IBActions
-(IBAction)newSnap:(id)sender{
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Camera Required"
                                                        message:@"This application requres a camera."
                                                       delegate:self cancelButtonTitle:@"Cancel"
                                              otherButtonTitles:nil];
        [alert show];
        return;
    }
    
    UIImagePickerController *imgPicker = [[UIImagePickerController alloc] init];
    [imgPicker setSourceType: UIImagePickerControllerSourceTypeCamera];
    [imgPicker setDelegate:self];
    [self presentViewController:imgPicker animated:YES completion:nil];
   
}

#pragma mark - CLLocationManagerDelegate
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
    self.lastLocationReading = [locations firstObject];
}

#pragma mark - UIImagePickerController
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    GSSnap *snap = [[GSSnap alloc] init];
    
    snap.image = info[UIImagePickerControllerOriginalImage];
    snap.location = self.lastLocationReading.coordinate;
}

#pragma mark - Navigation
// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

@end
