//
//  Stats.m
//  DiabloIIIApp
//
//  Created by Vesela Popova on 15.11.12.
//  Copyright (c) 2012 г. Vesela Popova. All rights reserved.
//

#import "Stats.h"
#import "AppDelegate.h"

@interface Stats ()

@end

@implementation Stats
@synthesize heroIndex = _heroIndex;
@synthesize tmp = _tmp;
NSDictionary *json;

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
    NSString *userId = [delegate currentUser];
    userId = [userId stringByReplacingOccurrencesOfString:@"#" withString:@"-"];
    NSString * url = [NSString stringWithFormat:@"http://eu.battle.net/api/d3/profile/%@/hero/%@", userId, _heroIndex];
    NSData* data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
    NSError* error;
    json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    _tmp.text = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setTmp:nil];
    [super viewDidUnload];
}
@end
