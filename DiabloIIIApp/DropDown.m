//
//  DropDown.m
//  DiabloIIIApp
//
//  Created by Vesela Popova on 31.10.12.
//  Copyright (c) 2012 г. Vesela Popova. All rights reserved.
//

#import "DropDown.h"
#import "PopoverView.h"

@implementation DropDown

UITextField * text;
UIButton *button;
NSMutableArray *stringArray;

- (id)initWithCoder:(NSCoder *)aDecoder{
    if ((self = [super initWithCoder:aDecoder])) {
        [self setBackgroundColor:[UIColor clearColor]];
        [self setUserInteractionEnabled:YES];
        
        text = [[UITextField alloc]  initWithFrame:CGRectMake(0, 0, 100, 25)];
        [text setEnabled:NO];
        [text setBackground:[UIImage imageNamed:@"images.jpeg"]];
        [self addSubview:text];
        
        button = [[UIButton alloc] initWithFrame:CGRectMake(100, 0, 40, 25)];
        [button addTarget:self action:@selector(showPopOver) forControlEvents:UIControlEventTouchUpInside];
        [button setImage:[UIImage imageNamed:@"0271@2x rotated.png"] forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageNamed:@"images.jpeg"] forState:UIControlStateNormal];

        [self addSubview:button];
    }
    return self;
}


-(void) showPopOver {
    CGPoint point = CGPointMake(50, 25);
    [PopoverView showPopoverAtPoint:point inView:self withStringArray:stringArray delegate:self];

}

-(void) setStringArray:(NSMutableArray *)array {
    stringArray = array;
}

- (void)popoverView:(PopoverView *)popoverView didSelectItemAtIndex:(NSInteger)index {
    text.text = [stringArray objectAtIndex:index];
    [popoverView dismiss];
}

-(NSString *)getString {
    return text.text;
}

-(void)setString:(NSString *)string {
    text.text = string;
}

@end
