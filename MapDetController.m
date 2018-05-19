//
//  MapDetController.m
//  Design
//
//  Created by JETS on 2/14/18.
//  Copyright (c) 2018 JETS. All rights reserved.
//

#import "MapDetController.h"

@interface MapDetController ()

@end

@implementation MapDetController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    CLLocationCoordinate2D touchedLocation=CLLocationCoordinate2DMake(_mapLat, _mapLon);
    //    printf("lat= %f lon=%f",touchedLocation.latitude,touchedLocation.longitude);
    Annotation *myAnnotation=[Annotation new];
    [myAnnotation setCoordinate:touchedLocation];
    MKCoordinateRegion mk=MKCoordinateRegionMakeWithDistance(touchedLocation, 500, 500) ;
    [_mapView setRegion:mk animated:YES];
    [_mapView addAnnotation:myAnnotation];
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

@end
