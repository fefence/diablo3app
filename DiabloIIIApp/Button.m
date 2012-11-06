//
//  Button.m
//  DiabloIIIApp
//
//  Created by Vesela Popova on 21.09.12.
//  Copyright (c) 2012 г. Vesela Popova. All rights reserved.
//

#import "Button.h"
#import "PopoverView.h"

@implementation Button

@synthesize stringArrays = _stringArrays;

- (id)initWithCoder:(NSCoder *)aDecoder{
    if ((self = [super initWithCoder:aDecoder])) {
        
        [self setImage:[UIImage imageNamed:@"0271@2x rotated.png"] forState:UIControlStateNormal];
        [super layoutSubviews];
        
        UIImageView *imageView = [self imageView];
        UILabel *label = [self titleLabel];
        
        CGRect imageFrame = imageView.frame;
        CGRect labelFrame = label.frame;
        
        labelFrame.origin.x = imageFrame.origin.x;
        imageFrame.origin.x = labelFrame.origin.x + CGRectGetWidth(labelFrame);
        
        imageView.frame = imageFrame;
        label.frame = labelFrame;

    }
    return self;
}

- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event
{
    [super layoutSubviews];
    
    UIImageView *imageView = [self imageView];
    UILabel *label = [self titleLabel];
    
    CGRect imageFrame = imageView.frame;
    CGRect labelFrame = label.frame;
    
    labelFrame.origin.x = imageFrame.origin.x;
    imageFrame.origin.x = labelFrame.origin.x + CGRectGetWidth(labelFrame);
    
    imageView.frame = imageFrame;
    label.frame = labelFrame;

    [super touchesEnded:touches withEvent:event];
}

- (void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event
{
    CGPoint point = CGPointMake(self.frame.origin.x + 40, self.frame.origin.y + 80);
    
    [PopoverView showPopoverAtPoint:point inView:self.superview withStringArray:_stringArrays delegate:self];
    [super layoutSubviews];
    UIImageView *imageView = [self imageView];
    UILabel *label = [self titleLabel];
    
    CGRect imageFrame = imageView.frame;
    CGRect labelFrame = label.frame;
    
    labelFrame.origin.x = imageFrame.origin.x;
    imageFrame.origin.x = labelFrame.origin.x + CGRectGetWidth(labelFrame);
    
    imageView.frame = imageFrame;
    label.frame = labelFrame;
    
    [super touchesEnded:touches withEvent:event];
}

- (void)popoverView:(PopoverView *)popoverView didSelectItemAtIndex:(NSInteger)index {
    [super layoutSubviews];
    
    UIImageView *imageView = [self imageView];
    UILabel *label = [self titleLabel];
    
    CGRect imageFrame = imageView.frame;
    CGRect labelFrame = label.frame;
    
    labelFrame.origin.x = imageFrame.origin.x;
    imageFrame.origin.x = labelFrame.origin.x + CGRectGetWidth(labelFrame);
    
    imageView.frame = imageFrame;
    label.frame = labelFrame;

    self.titleLabel.text = [_stringArrays objectAtIndex:index];
    [popoverView dismiss];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
