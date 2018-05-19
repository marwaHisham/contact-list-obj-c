//
//  SecondView.h
//  Design
//
//  Created by JETS on 2/11/18.
//  Copyright (c) 2018 JETS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "newProtocol.h"
#import "Database.h"
#import "MyLocation.h"
@interface SecondView : UIViewController<newProtocol,MyLocation>
@property NSString * iName;
@property (strong, nonatomic) IBOutlet UITextField *myImg;
@property (strong, nonatomic) IBOutlet UITextField *fName;
@property (strong, nonatomic) IBOutlet UITextField *fAge;
@property (strong, nonatomic) IBOutlet UITextField *fEmail;
@property (strong, nonatomic) IBOutlet UITextField *fLat;
@property (strong, nonatomic) IBOutlet UITextField *fLon;

- (IBAction)save:(id)sender;

@end
