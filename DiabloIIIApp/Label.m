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
        [self setFont:[UIFont fontWithName:@"Optima" size:17]];
    }
    return self;
}


@end
