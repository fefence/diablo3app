//
//  GemCalcMainController.m
//  DiabloIIIApp
//
//  Created by Vesela Popova on 20.08.12.
//  Copyright (c) 2012 г. Vesela Popova. All rights reserved.
//

#import "GemCalcMainController.h"
#import "AppDelegate.h"
#import "KeyboardBar.h"
#import "GemCalcSettingsController.h"
#import "UseMineSettings.h"
#import "QuartzCore/QuartzCore.h"

@interface GemCalcMainController ()

@end

@implementation GemCalcMainController
@synthesize tomeOfSecretsLabel = _tomeOfSecretsLabel;
@synthesize tomeOfJewelcraftingLabel = _tomeOfJewelcraftingLabel;
@synthesize mineButton = _mineButton;
@synthesize startingGem = _startingGem;
@synthesize desiredGem = _desiredGem;
@synthesize amount = _amount;
@synthesize pageOfJewelcraftingAvailable = _pageOfJewelcraftingAvailable;
@synthesize pageOfJewelcraftingPrice = _pageOfJewelcraftingPrice;
@synthesize tomeOfJewelcraftingAvailable = _tomeOfJewelcraftingAvailable;
@synthesize tomeOfJewelcraftingPrice = _tomeOfJewelcraftingPrice;
@synthesize tomeOfSecretsAvailable = _tomeOfSecretsAvailable;
@synthesize tomeOfSecretsPrice = _tomeOfSecretsPrice;
@synthesize gemTypes = _gemTypes;
@synthesize gemPicker = _gemPicker;
@synthesize useMineFirst = _useMineFirst;
@synthesize fields = _fields;
@synthesize button = _button;
@synthesize pageOfJewelcraftingLabel = _pageOfJewelcraftingLabel;

KeyboardBar * bar;
int animatedDis;

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [_gemTypes count];
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [self.gemTypes objectAtIndex:row];
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row
      inComponent:(NSInteger)component {
        bar.field.text = [_gemTypes objectAtIndex:row];
}


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
    animatedDis = 0;
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    _gemTypes = [[NSMutableArray alloc] initWithArray:appDelegate.gemTypes];
    [_gemPicker setHidden:YES];
    [_gemPicker selectRow:0 inComponent:0 animated:NO];
    [_startingGem setInputView:_gemPicker];
    [_desiredGem setInputView:_gemPicker];
    [self initKeyboardBar];
    [_pageOfJewelcraftingLabel.layer setBorderColor: [[UIColor colorWithRed: 59/255 green: 25/255 blue: 29/255 alpha:1.0] CGColor]];
    [_pageOfJewelcraftingLabel.layer setBorderWidth: 1.0];
    [_tomeOfSecretsLabel.layer setBorderColor: [[UIColor colorWithRed: 59/255 green: 25/255 blue: 29/255 alpha:1.0] CGColor]];
    [_tomeOfSecretsLabel.layer setBorderWidth: 1.0];
    [_tomeOfJewelcraftingLabel.layer setBorderColor: [[UIColor colorWithRed: 59/255 green: 25/255 blue: 29/255 alpha:1.0] CGColor]];
    [_tomeOfJewelcraftingLabel.layer setBorderWidth: 1.0];
    _amount.enabled = NO;
    _button.hidden = YES;
    self.view.backgroundColor = [UIColor clearColor];
}

-(void) initKeyboardBar {
    bar = [KeyboardBar new];
    if (_amount.enabled) {
        _fields = [[NSMutableArray alloc] initWithObjects:_startingGem, _desiredGem, _amount, _pageOfJewelcraftingAvailable, _pageOfJewelcraftingPrice, _tomeOfJewelcraftingAvailable, _tomeOfJewelcraftingPrice, _tomeOfSecretsAvailable, _tomeOfSecretsPrice, nil];
    } else {
       _fields = [[NSMutableArray alloc] initWithObjects:_startingGem, _desiredGem, _pageOfJewelcraftingAvailable, _pageOfJewelcraftingPrice, _tomeOfJewelcraftingAvailable, _tomeOfJewelcraftingPrice, _tomeOfSecretsAvailable, _tomeOfSecretsPrice, nil]; 
    }
    [bar setFields:_fields];
    bar.index = -1;
    int i;
    for (i = 0; i < [_fields count]; i ++) {
        [[_fields objectAtIndex:i] setInputAccessoryView: bar];
    }
}

- (void)viewDidUnload
{
    [self setStartingGem:nil];
    [self setDesiredGem:nil];
    [self setAmount:nil];
    [self setPageOfJewelcraftingAvailable:nil];
    [self setPageOfJewelcraftingPrice:nil];
    [self setTomeOfJewelcraftingAvailable:nil];
    [self setTomeOfJewelcraftingPrice:nil];
    [self setTomeOfSecretsAvailable:nil];
    [self setTomeOfSecretsPrice:nil];
    [self setGemPicker:nil];
    [self setUseMineFirst:nil];
    [self setButton:nil];
    [self setMineButton:nil];
    [self setPageOfJewelcraftingLabel:nil];
    [self setTomeOfSecretsLabel:nil];
    [self setTomeOfJewelcraftingLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)changeCurrentTextField:(UITextField *)sender {
    [self animateTextField:sender up:YES];
    [self initKeyboardBar];
    [_gemPicker setHidden:YES];
    [bar setField:sender];
    }



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UITableViewCell *)sender {
    if ([[segue identifier] isEqualToString:@"useMine"]) {
        UseMineSettings *next = [segue destinationViewController];
        next.startingGem = _startingGem.text;
        next.desiredGem = _desiredGem.text;
        next.pageOfJewelcraftingAvailable = [_pageOfJewelcraftingAvailable.text integerValue];
        next.pageOfJewelcraftingPrice = [_pageOfJewelcraftingPrice.text integerValue];
        next.tomeOfJewelcraftingAvailable = [_tomeOfJewelcraftingAvailable.text integerValue];
        next.tomeOfJewelcraftingPrice = [_tomeOfJewelcraftingPrice.text integerValue];
        next.tomeOfSecretsAvailable = [_tomeOfSecretsAvailable.text integerValue];
        next.tomeOfSecretsPrice = [_tomeOfSecretsPrice.text integerValue];
    } else {
        GemCalcSettingsController *next = [segue destinationViewController];
        next.startingGem = _startingGem.text;
        next.desiredGem = _desiredGem.text;
        next.amount = [_amount.text integerValue];
        next.pageOfJewelcraftingAvailable = [_pageOfJewelcraftingAvailable.text integerValue];
        next.pageOfJewelcraftingPrice = [_pageOfJewelcraftingPrice.text integerValue];
        next.tomeOfJewelcraftingAvailable = [_tomeOfJewelcraftingAvailable.text integerValue];
        next.tomeOfJewelcraftingPrice = [_tomeOfJewelcraftingPrice.text integerValue];
        next.tomeOfSecretsAvailable = [_tomeOfSecretsAvailable.text integerValue];
        next.tomeOfSecretsPrice = [_tomeOfSecretsPrice.text integerValue];
    }
    
}

- (IBAction)scrollBack:(id)sender {
    if (_desiredGem.text.length > 0 && _startingGem.text.length >0) {
        [_button setEnabled:YES];
    }
    [self animateTextField:sender up:NO];
}

- (IBAction)useMineSwitch:(UISwitch *)sender {
    if (sender.on) {
        _mineButton.hidden = NO;
        _mineButton.enabled = YES;
        _button.hidden = YES;
        _button.enabled = NO;
        _amount.enabled = NO;
        _amount.alpha = 0.4;
        [self initKeyboardBar];
    } else {
        _mineButton.hidden = YES;
        _mineButton.enabled = NO;
        _button.hidden = NO;
        _button.enabled = YES;
        _amount.enabled = YES;
        _amount.alpha = 1.0;
        [self initKeyboardBar];
    }
}

- (IBAction)changeDropDown:(UITextField *)sender {
    [self initKeyboardBar];
    [self animateTextField:sender up:YES];
    [bar setField:sender];
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [_gemTypes removeAllObjects];
    [_gemTypes addObjectsFromArray:appDelegate.gemTypes];
    [_gemPicker reloadAllComponents];
    [_gemPicker selectRow:0 inComponent:0 animated:NO];
    if (sender.tag == 0) {
        _startingGem.text = [_gemTypes objectAtIndex:0];
        [_gemPicker setHidden:NO];
    } else if (sender.tag == 1) {
        if (_startingGem.text.length > 0) {
            int i;
            for (i = 0; i < _gemTypes.count; i ++) {
                NSString * current = [_gemTypes objectAtIndex:0];
                if (![current caseInsensitiveCompare:_startingGem.text] == NSOrderedSame) {
                    [_gemTypes removeObjectAtIndex:0];
                } else {
                    [_gemTypes removeObjectAtIndex:0];
                    break;
                }
            }
        }
        _desiredGem.text = [_gemTypes objectAtIndex:0];
        [_gemPicker setHidden:NO];
    }
    [_gemPicker reloadAllComponents];
    [appDelegate.beans removeAllObjects];
    if (_startingGem.text.length > 0 && _desiredGem.text.length > 0) {
        _button.enabled = YES;
        _mineButton.enabled = YES;
    }
}


- (void) animateTextField: (UITextField*) textField up: (BOOL) up
{
    CGPoint temp = [self.view convertPoint:textField.frame.origin toView:nil];
    UIInterfaceOrientation orientation =
    [[UIApplication sharedApplication] statusBarOrientation];
    if (orientation == UIInterfaceOrientationPortrait){
        
        if(up) {
            int moveUpValue = temp.y+textField.frame.size.height;
            animatedDis = 264-(480-moveUpValue-5);
        }
    }
    else if(orientation == UIInterfaceOrientationPortraitUpsideDown) {
        if(up) {
            int moveUpValue = 1004-temp.y+textField.frame.size.height;
            animatedDis = 264-(1004-moveUpValue-5);
        }
    }
    else if(orientation == UIInterfaceOrientationLandscapeLeft) {
        if(up) {
            int moveUpValue = temp.x+textField.frame.size.height;
            animatedDis = 352-(768-moveUpValue-5);
        }
    }
    else
    {
        if(up) {
            int moveUpValue = 768-temp.x+textField.frame.size.height;
            animatedDis = 352-(768-moveUpValue-5);
        }
        
    }
    if(animatedDis>0) {
        const int movementDistance = animatedDis;
        const float movementDuration = 0.3f;
        int movement = (up ? -movementDistance : movementDistance);
        [UIView beginAnimations: nil context: nil];
        [UIView setAnimationBeginsFromCurrentState: YES];
        [UIView setAnimationDuration: movementDuration];
        if (orientation == UIInterfaceOrientationPortrait){
            self.view.frame = CGRectOffset(self.view.frame, 0, movement);
        }
        else if(orientation == UIInterfaceOrientationPortraitUpsideDown) {
            
            self.view.frame = CGRectOffset(self.view.frame, 0, movement);
        }
        else if(orientation == UIInterfaceOrientationLandscapeLeft) {
            
            self.view.frame = CGRectOffset(self.view.frame, 0, movement);
        }
        else {
            self.view.frame = CGRectOffset(self.view.frame, 0, movement);
        }
        
        [UIView commitAnimations];
    }
}

@end
