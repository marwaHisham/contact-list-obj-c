//
//  SecondView.m
//  Design
//
//  Created by JETS on 2/11/18.
//  Copyright (c) 2018 JETS. All rights reserved.
//

#import "SecondView.h"
#import "mapController.h"
#import "ThirdTable.h"
@interface SecondView (){
    Database *data;
}

@end

@implementation SecondView
- (IBAction)addImg:(id)sender {

    ThirdTable *tt=[self.storyboard instantiateViewControllerWithIdentifier:@"tb"];
    [tt setN:self];
    [self.navigationController pushViewController:tt animated:YES];
}
-(void)imgName:(NSString *)i{
    [_myImg setText:i];
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)even{
    
    [self.view endEditing:YES];
}
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
    data=[Database sharedInstance];
    
}
- (IBAction)detMap:(id)sender {
    mapController *mac=[self.storyboard instantiateViewControllerWithIdentifier:@"mc"];
    [mac setN:self];
    [self.navigationController pushViewController:mac animated:YES];
  
}
-(void)addNew:(float)myLat :(float)myLon{
    [_fLat setText:[NSString stringWithFormat:@"%f",myLat]];
    [_fLon setText:[NSString stringWithFormat:@"%f",myLon]];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)save:(id)sender {
    [data setUName:[_fName text]];
    [data setUAge:(int)[_fAge text]];
    printf("==============%d",(int)[_fAge text]);
    [data setUEmail:[_fEmail text]];
    [data setUImg:[_myImg text]];
    [data setULat:[_fLat text]];
    [data setULon:[_fLon text]];
    [data saveData];
    [self.navigationController popToRootViewControllerAnimated:YES];
}
@end
