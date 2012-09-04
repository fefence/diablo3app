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

@interface GemCalcMainController ()

@end

@implementation GemCalcMainController
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
static GemCalcMainController *sharedInstance;

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
    sharedInstance = self;
}

-(void) initKeyboardBar {
    bar = [KeyboardBar new];
    _fields = [[NSMutableArray alloc] initWithObjects:_startingGem, _desiredGem, _amount, _pageOfJewelcraftingAvailable, _pageOfJewelcraftingPrice, _tomeOfJewelcraftingAvailable, _tomeOfJewelcraftingPrice, _tomeOfSecretsAvailable, _tomeOfSecretsPrice, nil];
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
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)changeCurrentTextField:(UITextField *)sender {
    
    [self.view scrollToView:sender];
    [_gemPicker setHidden:YES];
    [self initKeyboardBar];
    [bar setField:sender];
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [_gemTypes removeAllObjects];
    [_gemTypes addObjectsFromArray:appDelegate.gemTypes];
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
}

- (IBAction)scrollBack:(id)sender {
    if (_desiredGem.text.length > 0 && _startingGem.text.length >0) {
        [_button setEnabled:YES];
    }
    [self.view scrollToY:0];
}



+ (GemCalcMainController *)sharedInstance
{
    if (!sharedInstance)
        sharedInstance = [[self alloc] init]; // will be retained inside the init method
    return sharedInstance;
}
@end
