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
#import "UIView+FormScroll.h"
#import "GemCalcSettingsController.h"
#import "UseMineSettings.h"

@interface GemCalcMainController ()

@end

@implementation GemCalcMainController
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

KeyboardBar * bar;

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
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    _gemTypes = [[NSMutableArray alloc] initWithArray:appDelegate.gemTypes];
    [_gemPicker setHidden:YES];
    [_gemPicker selectRow:0 inComponent:0 animated:NO];
    [_startingGem setInputView:_gemPicker];
    [_desiredGem setInputView:_gemPicker];
    [self initKeyboardBar];
    _amount.enabled = NO;
    _button.hidden = YES;
}

-(void) initKeyboardBar {
    bar = [KeyboardBar new];
    if (_amount.enabled) {
        _fields = [[NSMutableArray alloc] initWithObjects:_startingGem, _desiredGem, _amount, _pageOfJewelcraftingAvailable, _pageOfJewelcraftingPrice, _tomeOfJewelcraftingAvailable, _tomeOfJewelcraftingPrice, _tomeOfSecretsAvailable, _tomeOfSecretsPrice, nil];
    } else {
       _fields = [[NSMutableArray alloc] initWithObjects:_startingGem, _desiredGem, _pageOfJewelcraftingAvailable, _pageOfJewelcraftingPrice, _tomeOfJewelcraftingAvailable, _tomeOfJewelcraftingPrice, _tomeOfSecretsAvailable, _tomeOfSecretsPrice, nil]; 
    }
    [bar setFields:_fields];
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
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)changeCurrentTextField:(UITextField *)sender {
    
    [self.view scrollToView:sender];
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
    [self.view scrollToY:0];
}

- (IBAction)useMineSwitch:(UISwitch *)sender {
    if (sender.on) {
        _mineButton.hidden = NO;
        _mineButton.enabled = YES;
        _button.hidden = YES;
        _button.enabled = NO;
        _amount.enabled = NO;
        [self initKeyboardBar];
    } else {
        _mineButton.hidden = YES;
        _mineButton.enabled = NO;
        _button.hidden = NO;
        _button.enabled = YES;
        _amount.enabled = YES;
        [self initKeyboardBar];
    }
}

- (IBAction)changeDropDown:(UITextField *)sender {
    [self initKeyboardBar];
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
}
@end
