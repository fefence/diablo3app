//
//  MainViewController.m
//  DiabloIIIApp
//
//  Created by Vesela Popova on 20.08.12.
//  Copyright (c) 2012 г. Vesela Popova. All rights reserved.
//

#import "MainViewController.h" 
#import "AppDelegate.h"

@interface MainViewController ()

@end

@implementation MainViewController
@synthesize bTag = _bTag;

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
    
    [_bTag setTextColor:[UIColor colorWithRed:(139.0f/225.0f) green:(69.0f/225.0f) blue:(19.0f/225.0f) alpha:1.0f]];
    [_bTag setFont:[UIFont fontWithName:@"Gill Sans" size:18.0]];
    [_bTag setTextAlignment:NSTextAlignmentCenter];
    
    AppDelegate *delegate =[[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [delegate managedObjectContext];
    NSEntityDescription *entityDesc =
    [NSEntityDescription entityForName:@"User"
                inManagedObjectContext:context];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"userId == %@", [delegate currentUser]];
    [request setPredicate:predicate];
    
    [request setEntity:entityDesc];
    NSError *error;
    NSArray *objects = [context executeFetchRequest:request
                                              error:&error];
    if ([objects count] == 0) {
        //[_currency setString: @"EUR"];
    } else {
        NSManagedObject *matches = [objects objectAtIndex:0];
        _bTag.text = [matches valueForKey:@"userId"];
    }
   // self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"cartographer.png"]];
}

- (void)viewDidUnload
{
    [self setBTag:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
