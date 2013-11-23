//
//  GSSnapTimelineViewController.m
//  GardenSnap
//
//  Created by Christopher Martin on 11/23/13.
//  Copyright (c) 2013 GardenSnap. All rights reserved.
//

#import "GSSnapTimelineViewController.h"

static NSString *const kONCSnapTimelineCellId = @"SnapTimelineCell";

@interface GSSnapTimelineViewController ()

@end

@implementation GSSnapTimelineViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UICollectionView
-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView
                cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kONCSnapTimelineCellId
                                                                           forIndexPath:indexPath];
    
    return cell;
}

#pragma mark - IBActions
-(IBAction)newSnap:(id)sender{
    NSLog(@"Pre populated snap here");
}

@end
