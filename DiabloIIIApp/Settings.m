//
//  Settings.m
//  DiabloIIIApp
//
//  Created by Vesela Popova on 21.10.12.
//  Copyright (c) 2012 г. Vesela Popova. All rights reserved.
//

#import "Settings.h"
#import "AppDelegate.h"

@interface Settings ()

@end

@implementation Settings
@synthesize currency = _currency;
@synthesize bNetTag = _bNetTag;

NSMutableArray *currencies;

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
    currencies = [NSMutableArray arrayWithObjects:@"EUR", @"USD", @"AUD", @"MXN", @"BRL", @"CLP", @"ARS", @"GBP", @"RUB", nil];
    [_currency setStringArray:currencies];
    [_currency setDelegate:self];
    self.view.backgroundColor = [UIColor clearColor];
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
        _bNetTag.text = [matches valueForKey:@"userId"];
        [_currency setString: [matches valueForKey:@"currency"]];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setCurrency:nil];
    [self setBNetTag:nil];
    [super viewDidUnload];
}
- (void)saveSettings {
    AppDelegate *delegate =[[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [delegate managedObjectContext];
    NSEntityDescription *entityDesc = [NSEntityDescription entityForName:@"User" inManagedObjectContext:context];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDesc];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"userId == %@", [delegate currentUser]];
    [request setPredicate:predicate];
    NSError *error;
    NSArray *objects = [context executeFetchRequest:request error:&error];
    NSManagedObject *settings;
    if ([objects count] == 0) {
        //settings = [NSEntityDescription insertNewObjectForEntityForName:@"User"
          //                                       inManagedObjectContext:context];
    } else {
        settings = [objects objectAtIndex:0];
    }
    [settings setValue:[_currency getString] forKey:@"currency"];
    [context save:&error];
    
}


- (void)dropDown:(DropDown *)dropDown didSelectItem:(NSString *)item {
    [self saveSettings];
}

@end
