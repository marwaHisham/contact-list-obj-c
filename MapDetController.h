//
//  MapDetController.h
//  Design
//
//  Created by JETS on 2/14/18.
//  Copyright (c) 2018 JETS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "Annotation.h"
@interface MapDetController : UIViewController<MKMapViewDelegate>
@property (strong, nonatomic) IBOutlet MKMapView *mapView;
@property float mapLat,mapLon;
@end
