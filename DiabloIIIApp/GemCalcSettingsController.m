//
//  GemCalcSettingsController.m
//  DiabloIIIApp
//
//  Created by Vesela Popova on 24.08.12.
//  Copyright (c) 2012 г. Vesela Popova. All rights reserved.
//

#import "GemCalcSettingsController.h"
#import "GemCalcMainController.h"
#import "GemBean.h"
#import "KeyboardBar.h"
#import "GemCalcResults.h"
#import "AppDelegate.h"

@interface GemCalcSettingsController ()

@end

@implementation GemCalcSettingsController

NSMutableArray *gemTypes;

NSString *startingGem;
NSString *desiredGem;
NSMutableDictionary *beans;
int amount;
int pageOfJewelcraftingAvailable;
int pageOfJewelcraftingPrice;
int tomeOfJewelcraftingAvailable;
int tomeOfJewelcraftingPrice;
int tomeOfSecretsAvailable;
int tomeOfSecretsPrice;
bool useMineFirst;
KeyboardBar *bar;


- (id)init {
    self = [super init];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    GemCalcMainController *sharedInstance = GemCalcMainController.sharedInstance;
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    gemTypes = [[NSMutableArray alloc] initWithArray:appDelegate.gemTypes];
    beans = appDelegate.beans;
    startingGem = sharedInstance.startingGem.text;
    desiredGem = sharedInstance.desiredGem.text;
    int i;
    for (i = 0; i < gemTypes.count; i ++) {
        NSString * current = [gemTypes objectAtIndex:i];
        if (![current caseInsensitiveCompare:startingGem] == NSOrderedSame) {
            [gemTypes removeObjectAtIndex:0];
        } else {
            break;
        }
    }
    
    for (i = gemTypes.count - 1; i >= 0; i --) {
        if (![[gemTypes objectAtIndex:i] caseInsensitiveCompare:desiredGem] == NSOrderedSame) {
            [gemTypes removeObjectAtIndex:i];
        } else {
            break;
        }
    }
    
    bar = [KeyboardBar new];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [self setView:nil];
    [super viewDidUnload];
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [gemTypes count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"GemRow";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"GemCalcRow" owner:self options:nil];
        // Grab a pointer to the first object (presumably the custom cell, as that's all the XIB should contain).
        cell = [topLevelObjects objectAtIndex:0];
    }
    UILabel *myLabel = (UILabel *)[cell viewWithTag:300];
    UITextField *available = (UITextField *) [cell viewWithTag:100];
    UITextField *price = (UITextField *) [cell viewWithTag:200];
    available.inputAccessoryView = bar;
    available.delegate = self;
    price.inputAccessoryView = bar;
    price.delegate = self;
    NSString * tmp = [gemTypes objectAtIndex:indexPath.row];
    GemBean *bean = [beans objectForKey:tmp];
    if (bean) {
        price.text = [NSString stringWithFormat:@"%ld", bean.AHPrice];
        available.text = [NSString stringWithFormat:@"%ld", bean.available];
    } else {
        price.text = @"";
        available.text = @"";;
    }
    NSLog(tmp);
    NSLog(@"%d", indexPath.row);
    myLabel.text = tmp;
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}


- (void)textFieldDidBeginEditing:(UITextField *)textField {
    bar.field = textField;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    UITableViewCell *cell = (UITableViewCell *)textField.superview;
    UILabel *gemType = (UILabel *)[cell viewWithTag:300];
    GemBean *bean = [beans objectForKey:gemType.text];
    if (!bean) {
        bean = [[GemBean alloc] init];
    }
    if (textField.tag == 100) {
        bean.available = [textField.text integerValue];
    } else if (textField.tag == 200) {
        bean.AHPrice = [textField.text integerValue];
    }
    NSLog(gemType.text);
    [beans setValue:bean forKey:gemType.text];
}

@end
