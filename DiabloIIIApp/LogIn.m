//
//  LogIn.m
//  DiabloIIIApp
//
//  Created by Vesela Popova on 27.10.12.
//  Copyright (c) 2012 г. Vesela Popova. All rights reserved.
//

#import "LogIn.h"

@interface LogIn ()

@end

@implementation LogIn
@synthesize bnetTag = _bnetTag;

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
    self.view.backgroundColor = [UIColor clearColor];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setBnetTag:nil];
    [super viewDidUnload];
}
- (IBAction)logInUser:(id)sender {
    
}

- (IBAction)logInGuest:(id)sender {
}
@end
