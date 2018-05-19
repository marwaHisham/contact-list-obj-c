//
//  FirstTable.m
//  Design
//
//  Created by JETS on 2/11/18.
//  Copyright (c) 2018 JETS. All rights reserved.
//

#import "FirstTable.h"
#import "details.h"
@interface FirstTable (){

    NSMutableArray *myFriends;
    JETSFriend *friend;
    Database *data;
}

@end

@implementation FirstTable

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (IBAction)add:(id)sender {
    
    SecondView  *sv=[self.storyboard instantiateViewControllerWithIdentifier:@"scv"];
    [self.navigationController pushViewController:sv animated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    data=[Database sharedInstance];
    myFriends=[data getAll];

    printf("\n%d\n",[myFriends count]);
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    NSString *name=[[myFriends objectAtIndex:indexPath.row] name];
    NSString *email=[[myFriends objectAtIndex:indexPath.row] email];
    int age=[[myFriends objectAtIndex:indexPath.row] age];
    NSString *img=[[myFriends objectAtIndex:indexPath.row] img];
    NSString* lon=[[myFriends objectAtIndex:indexPath.row] lon];
    NSString* lat=[[myFriends objectAtIndex:indexPath.row] lat];
    details *dv=[self.storyboard instantiateViewControllerWithIdentifier:@"dc"];
    dv.tName=name;
    dv.tEmail=email;
    dv.tAge=age;
    dv.tImg=img;
    dv.tLat=lat;
    dv.tLon=lon;
    [self.navigationController pushViewController:dv animated:YES];
}
-(void)viewWillAppear:(BOOL)animated{
    myFriends=[data getAll];
    printf("%d asdasd",[myFriends count]);
    [self loadView];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [myFriends count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text=[[myFriends objectAtIndex:indexPath.row] name];
    UIImage *image=[UIImage imageNamed:[[myFriends objectAtIndex:indexPath.row] img]
];

    [cell.imageView setImage:image];

    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [myFriends removeObjectAtIndex:indexPath.row];
        [data deleteFriend:[[myFriends objectAtIndex:indexPath.row] name]];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];

    }
    
}

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
