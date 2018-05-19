//
//  details.m
//  Design
//
//  Created by JETS on 2/13/18.
//  Copyright (c) 2018 JETS. All rights reserved.
//

#import "details.h"

@interface details ()

@end

@implementation details

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
    [_uName setText:_tName];
    [_uAge setText:[NSString stringWithFormat:@"%d",_tAge]];
    printf("%d" , _tAge);
    [_uEmail setText:_tEmail];
    [_uImg setText:_tImg];
    [_uLat setText:_tLat];
    [_uLon setText:_tLon];
    
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

- (IBAction)show:(id)sender {
    
    MapDetController* mc=[self.storyboard instantiateViewControllerWithIdentifier:@"mdc"];
    [mc setMapLat:[_tLat floatValue]];
    [mc setMapLon:[_tLon floatValue]];
      [self.navigationController pushViewController:mc animated:YES];
}
@end
