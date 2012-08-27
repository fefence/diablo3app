//
//  KeyboardBar.m
//  firstSteps
//
//  Created by Vesela Popova on 13.08.12.
//
//

#import "KeyboardBar.h"

@implementation KeyboardBar
@synthesize field;
@synthesize fields = _fields;

UIBarButtonItem *previous;
UIBarButtonItem *next;
UIBarButtonItem *done;

-(void) setField:(UITextField *)selectedField {
    field = selectedField;
    if (selectedField.tag == 0) {
        [previous setEnabled:NO];
        [next setEnabled:YES];
    } else if (selectedField.tag == [_fields count] - 1) {
        [next setEnabled:NO];
        [previous setEnabled:YES];
    } else {
        [next setEnabled:YES];
        [previous setEnabled:YES];
    }
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.barStyle = UIBarStyleDefault;
        [self sizeToFit];
        
        previous =[[UIBarButtonItem alloc] initWithTitle:@"Previous" style:UIBarButtonItemStyleBordered target:self action:@selector(didTapButtonBarItemPrevious:)];
        next =[[UIBarButtonItem alloc] initWithTitle:@"Next" style:UIBarButtonItemStyleBordered target:self action:@selector(didTapButtonBarItemNext:)];
        done =[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(didTapButtonBarItemDone:)];
        NSArray *array = [NSArray arrayWithObjects:previous, next, done, nil];
        [self setItems:array];
        if (self.field.tag == 0) {
            [previous setEnabled:NO];
            [next setEnabled:YES];
        } else if (self.field.tag == [_fields count] - 1) {
            [next setEnabled:NO];
            [previous setEnabled:YES];
        } else {
            [next setEnabled:YES];
            [previous setEnabled:YES];
        }
    }
        
    return self;
}

- (IBAction)didTapButtonBarItemPrevious:(UIButton *)sender{
    long currentField = self.field.tag;
    if (currentField > 0) {
        UIResponder* nextResponder = [_fields objectAtIndex: currentField - 1];
        [self.field resignFirstResponder];
        [nextResponder becomeFirstResponder];
        [self setField:(UITextField *)[_fields objectAtIndex: currentField - 1]];
    }
    

}

- (void)didTapButtonBarItemNext:(UIButton *)sender{
    long currentField = self.field.tag;
    if (currentField < [_fields count] - 1) {
        UIResponder* nextResponder = [_fields objectAtIndex: currentField + 1];
        [self.field resignFirstResponder];
        [nextResponder becomeFirstResponder];
        [self setField:(UITextField *) [_fields objectAtIndex: currentField + 1]];
    }
}

- (void)didTapButtonBarItemDone:(UIButton *)sender{
    [self.field resignFirstResponder];
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
