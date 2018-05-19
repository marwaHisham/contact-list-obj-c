//
//  mapController.m
//  Design
//
//  Created by JETS on 2/13/18.
//  Copyright (c) 2018 JETS. All rights reserved.
//

#import "mapController.h"

@interface mapController ()

@end

@implementation mapController
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

- (IBAction)clicked:(id)sender {
    CGPoint touchedPoint=[sender locationInView:_mapView];
//    printf("x= %f y=%f",touchedPoint.x,touchedPoint.y);
    CLLocationCoordinate2D touchedLocation=[_mapView convertPoint:touchedPoint toCoordinateFromView:_mapView];
//    printf("lat= %f lon=%f",touchedLocation.latitude,touchedLocation.longitude);
    Annotation *myAnnotation=[Annotation new];
    [myAnnotation setCoordinate:touchedLocation];
    [_mapView addAnnotation:myAnnotation];
    [_n addNew:touchedLocation.latitude :touchedLocation.longitude];
    [self.navigationController popViewControllerAnimated:YES];
}
@end
