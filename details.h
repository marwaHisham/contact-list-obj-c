//
//  details.h
//  Design
//
//  Created by JETS on 2/13/18.
//  Copyright (c) 2018 JETS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MapDetController.h"
@interface details : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *uName;
@property (strong, nonatomic) IBOutlet UILabel *uAge;
@property (strong, nonatomic) IBOutlet UILabel *uEmail;
@property (strong, nonatomic) IBOutlet UILabel *uImg;
@property (strong, nonatomic) IBOutlet UILabel *uLat;
@property (strong, nonatomic) IBOutlet UILabel *uLon;

- (IBAction)show:(id)sender;
@property NSString* tName;
@property int tAge;
@property NSString* tEmail;
@property NSString* tImg;
@property NSString* tLat;
@property NSString* tLon;

@end
