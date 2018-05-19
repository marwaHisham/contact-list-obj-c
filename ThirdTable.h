//
//  ThirdTable.h
//  Design
//
//  Created by JETS on 2/11/18.
//  Copyright (c) 2018 JETS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "newProtocol.h"
@interface ThirdTable : UITableViewController<newProtocol>
@property NSMutableArray *mArr;
//@property (strong, nonatomic) IBOutlet UIImageView *img;
@property id <newProtocol> n;
@end
