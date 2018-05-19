//
//  Database.h
//  Design
//
//  Created by JETS on 2/12/18.
//  Copyright (c) 2018 JETS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "JETSFriend.h"
@interface Database : NSObject
+(Database*)sharedInstance;
@property (strong , nonatomic) NSString *uName;
@property int uAge;
@property (strong , nonatomic) NSString *uEmail;
@property (strong , nonatomic) NSString *uImg;
@property (strong , nonatomic) NSString *status;
@property (strong , nonatomic) NSString *uLat;
@property (strong , nonatomic) NSString *uLon;



@property (strong , nonatomic) NSString *databasePath;
@property (nonatomic) sqlite3 *contactDB;


-(void)saveData;
-(void)findContact;
-(NSMutableArray*)getAll;
-(void)deleteFriend:(NSString*)userName;

@end
