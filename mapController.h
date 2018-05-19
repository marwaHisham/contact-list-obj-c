//
//  mapController.h
//  Design
//
//  Created by JETS on 2/13/18.
//  Copyright (c) 2018 JETS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "Annotation.h"
#import "MyLocation.h"
@interface mapController : UIViewController<MKMapViewDelegate,MyLocation>
@property (strong, nonatomic) IBOutlet MKMapView *mapView;
- (IBAction)clicked:(id)sender;
@property id<MyLocation>n;
@end
