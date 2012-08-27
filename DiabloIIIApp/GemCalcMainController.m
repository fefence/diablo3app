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
    if (bar.field.tag == 0) {
        int i;
        for (i = 0; i <= row; i ++) {
            [_gemTypes removeObjectAtIndex:0];
        }
    }
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
    NSMutableArray *fields = [[NSMutableArray alloc] initWithObjects:_startingGem, _desiredGem, _amount, _pageOfJewelcraftingAvailable, _pageOfJewelcraftingPrice, _tomeOfJewelcraftingAvailable, _tomeOfJewelcraftingPrice, _tomeOfSecretsAvailable, _tomeOfSecretsPrice, nil];
    [bar setFields:fields];
    int i;
    for (i = 0; i < [fields count]; i ++) {
        [[fields objectAtIndex:i] setInputAccessoryView: bar];
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
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)changeCurrentTextField:(UITextField *)sender {
    [self.view scrollToView:sender];
    [_gemPicker selectRow:0 inComponent:0 animated:NO];
    [_gemPicker setHidden:YES];
    [bar setField:sender];
    if (sender.tag == 0) {
        AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        [_gemTypes removeAllObjects];
        [_gemTypes addObjectsFromArray:appDelegate.gemTypes];
        _startingGem.text = [_gemTypes objectAtIndex:0];
        [_gemPicker setHidden:NO];
    } else if (sender.tag == 1) {
        _desiredGem.text = [_gemTypes objectAtIndex:0];
        [_gemPicker setHidden:NO];
    }
    [_gemPicker reloadAllComponents];
}

- (IBAction)scrollBack:(id)sender {
    [self.view scrollToY:0];
}



+ (GemCalcMainController *)sharedInstance
{
    if (!sharedInstance)
        sharedInstance = [[self alloc] init]; // will be retained inside the init method
    return sharedInstance;
}
@end
