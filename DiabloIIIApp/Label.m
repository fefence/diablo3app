//
//  Label.m
//  DiabloIIIApp
//
//  Created by Vesela Popova on 17.09.12.
//  Copyright (c) 2012 г. Vesela Popova. All rights reserved.
//

#import "Label.h"

@implementation Label

- (id)initWithCoder:(NSCoder *)aDecoder{
    if ((self = [super initWithCoder:aDecoder])) {
        [self setTextColor:[UIColor colorWithRed:(59.0f/225.0f) green:(25.0f/225.0f) blue:(27.0f/225.0f) alpha:1.0f]];
        [self setFont:[UIFont fontWithName:@"Gill Sans" size:17]];
    }
    return self;
}


@end
