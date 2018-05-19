//
//  Database.m
//  Design
//
//  Created by JETS on 2/12/18.
//  Copyright (c) 2018 JETS. All rights reserved.
//

#import "Database.h"
@implementation Database
+(Database *)sharedInstance{
    static Database * sharedInstance=nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate,^{
        sharedInstance=[[Database alloc] init];
    });
    return sharedInstance;
}
- (id)init
{
    self = [super init];
    if (self) {
        NSString *docsDir;
        NSArray *dirPaths;
        
        // Get the documents directory
        dirPaths = NSSearchPathForDirectoriesInDomains(
                                                       NSDocumentDirectory, NSUserDomainMask, YES);
        
        docsDir = dirPaths[0];
        
        // Build the path to the database file
        _databasePath = [[NSString alloc]
                         initWithString: [docsDir stringByAppendingPathComponent:
                                          @"contacts2.db"]];
        
        
        const char *dbpath = [_databasePath UTF8String];
        
        if (sqlite3_open(dbpath, &_contactDB) == SQLITE_OK)
        {
            char *errMsg;
            const char *sql_stmt =
            "CREATE TABLE IF NOT EXISTS CONTACTS2 (ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT, AGE INTEGER,EMAIL TEXT, IMG TEXT,LAT TEXT,LON TEXT)";
            printf("1");
            
            if (sqlite3_exec(_contactDB, sql_stmt, NULL, NULL, &errMsg) != SQLITE_OK)
            {
                _status = @"Failed to create table";
                printf("%s",[_status UTF8String]);
            }
            sqlite3_close(_contactDB);
        } else {
            _status = @"Failed to open/create database";
            printf("%s",[_status UTF8String]);
        }
    }
    return self;
}
-(void)saveData{
    
    
    sqlite3_stmt    *statement;
    const char *dbpath = [_databasePath UTF8String];
    
    if (sqlite3_open(dbpath, &_contactDB) == SQLITE_OK)
    {
        
        NSString *insertSQL = [NSString stringWithFormat:
                               @"INSERT INTO CONTACTS2 (name, age, email,img,lat,lon) VALUES (\"%@\", %d, \"%@\", \"%@\", \"%@\", \"%@\")",
                               _uName,_uAge, _uEmail,_uImg,_uLat,_uLon];
        printf("%s",[insertSQL UTF8String]);
        const char *insert_stmt = [insertSQL UTF8String];
        sqlite3_prepare_v2(_contactDB, insert_stmt,
                           -1, &statement, NULL);
        if (sqlite3_step(statement) == SQLITE_DONE)
        {
            _status = @"Contact added";
            printf("%s",[_status UTF8String]);
        } else {
            _status = @"Failed to add contact";
            printf("%s",[_status UTF8String]);
        }
        sqlite3_finalize(statement);
        sqlite3_close(_contactDB);
    }
    
    
}
-(void)findContact{
    
    
    const char *dbpath = [_databasePath UTF8String];
    sqlite3_stmt    *statement;
    
    if (sqlite3_open(dbpath, &_contactDB) == SQLITE_OK)
    {
        NSString *querySQL = [NSString stringWithFormat:
                              @"SELECT age, email,img FROM contacts2 WHERE name=\"%@\"",
                              _uName];
        
        const char *query_stmt = [querySQL UTF8String];
        
        if (sqlite3_prepare_v2(_contactDB,
                               query_stmt, -1, &statement, NULL) == SQLITE_OK)
        {
            if (sqlite3_step(statement) == SQLITE_ROW)
            {
                int age =  (int)sqlite3_column_text(statement, 1);
                _uAge=age;
                NSString *email = [[NSString alloc]
                                        initWithUTF8String:(const char *)
                                        sqlite3_column_text(statement, 1)];
                _uEmail=email;
                NSString *img = [[NSString alloc]
                                   initWithUTF8String:(const char *)
                                   sqlite3_column_text(statement, 2)];
                _uImg=img;
                _status = @"Match found";
            } else {
                _status = @"Match not found";
            }
            sqlite3_finalize(statement);
        }
        sqlite3_close(_contactDB);
    }
    
    
}
-(void)deleteFriend:(NSString*)userName{
    const char *dbpath = [_databasePath UTF8String];
    sqlite3_stmt    *statement;
    if (sqlite3_open(dbpath, &_contactDB) == SQLITE_OK)
    {
        NSString *querySQL = [NSString stringWithFormat:
                              @"DELETE FROM contacts2 WHERE name=\"%@\"",
                              userName];
            
        const char *query_stmt = [querySQL UTF8String];
        
        if (sqlite3_prepare_v2(_contactDB,
                               query_stmt, -1, &statement, NULL) == SQLITE_OK)
        {
            if (sqlite3_step(statement) == SQLITE_ROW)
            {
            }
            sqlite3_finalize(statement);
        }
        sqlite3_close(_contactDB);
    }
}
-(NSMutableArray *)getAll{
    NSMutableArray *allRows = [[NSMutableArray alloc] init];
    const char *dbpath = [_databasePath UTF8String];
    sqlite3_stmt    *statement;
    
    if (sqlite3_open(dbpath, &_contactDB) == SQLITE_OK)
    {
        NSString *querySQL = [NSString stringWithFormat:
                              @"SELECT name,age, email,img,lat,lon FROM contacts2"];
        
        const char *query_stmt = [querySQL UTF8String];
        
        if (sqlite3_prepare_v2(_contactDB,
                               query_stmt, -1, &statement, NULL) == SQLITE_OK)
        {

         while(sqlite3_step(statement) == SQLITE_ROW){
             JETSFriend *friend=[JETSFriend new];

             NSString *name = [[NSString alloc]
                                initWithUTF8String:(const char *)
                                sqlite3_column_text(statement, 0)];
             int age =  (int)sqlite3_column_text(
                                                 statement, 1);
             NSString *email = [[NSString alloc]
                                initWithUTF8String:(const char *)
                                sqlite3_column_text(statement, 2)];
             NSString *img = [[NSString alloc]
                              initWithUTF8String:(const char *)
                              sqlite3_column_text(statement, 3)];
             NSString *lat = [[NSString alloc]
                              initWithUTF8String:(const char *)
                              sqlite3_column_text(statement, 4)];
             NSString *lon = [[NSString alloc]
                              initWithUTF8String:(const char *)
                              sqlite3_column_text(statement, 5)];
             [friend setName:name];
             [friend setAge:age];
             [friend setEmail:email];
             [friend setImg:img];
             [friend setLat:lat];
             [friend setLon:lon];
             [allRows addObject:friend];
             printf("%s","done");
    
          }
            sqlite3_finalize(statement);
        }
        sqlite3_close(_contactDB);
    }
    
    
    return allRows;
}

@end
