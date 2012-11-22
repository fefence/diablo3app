//
//  LogIn.m
//  DiabloIIIApp
//
//  Created by Vesela Popova on 27.10.12.
//  Copyright (c) 2012 г. Vesela Popova. All rights reserved.
//

#import "LogIn.h"
#import "AppDelegate.h"

@interface LogIn ()

@end

@implementation LogIn
@synthesize userId = _userId;

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
    AppDelegate *delegate =[[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [delegate managedObjectContext];
    NSEntityDescription *entityDesc =
    [NSEntityDescription entityForName:@"User"
                inManagedObjectContext:context];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDesc];
    NSError *error;
    NSArray *objects = [context executeFetchRequest:request
                                              error:&error];
    if ([objects count] == 0) {
        
    } else {
        int i;
        for (i = 0; i < objects.count; i ++) {
            NSManagedObject *matches = [objects objectAtIndex:i];
            if ((bool)[matches valueForKey:@"lastUser"] == YES){
                _userId.text = [matches valueForKey:@"userId"];
                [delegate setCurrentUser:_userId.text];
            }
        }
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setUserId:nil];
    [super viewDidUnload];
}
- (IBAction)logIn:(id)sender {
    AppDelegate *delegate =[[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [delegate managedObjectContext];
    NSEntityDescription *entityDesc =
    [NSEntityDescription entityForName :@"User"
                inManagedObjectContext:context];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDesc];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"userId == %@", _userId.text];
    [request setPredicate:predicate];
    NSError *error;
    NSArray *objects = [context executeFetchRequest:request
                                              error:&error];
    NSManagedObject *user;
    if ([objects count] == 0) {
        user = [NSEntityDescription insertNewObjectForEntityForName:@"User"
                                             inManagedObjectContext:context];
        [user setValue:_userId.text forKey:@"userId"];
        [user setValue:@"EUR" forKey:@"currency"];
    } else {
        user = [objects objectAtIndex:0];
    }
    [user setValue:@"YES" forKey:@"lastUser"];
    [context save:&error];
    [delegate setCurrentUser:_userId.text];

}
@end
