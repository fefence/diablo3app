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

@synthesize gemTypes = _gemTypes;

NSString *startingGem;
NSString *desiredGem;
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
    _gemTypes = sharedInstance.gemTypes;
    startingGem = sharedInstance.startingGem.text;
    desiredGem = sharedInstance.desiredGem.text;
        
    int i;
    for (i = [_gemTypes count] - 1; i >= 1; i --) {
        if ([[_gemTypes objectAtIndex:i] caseInsensitiveCompare:desiredGem]) {
            [_gemTypes removeObjectAtIndex:i];
        } else {
            [_gemTypes removeObjectAtIndex:i];
            return;
        }
    }
    
    [[_gemTypes objectAtIndex:0] startingGem];
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
    return [_gemTypes count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"GemRow";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        UINib *theNib = [UINib nibWithNibName:@"GemCalcRow" bundle:nil];
        cell = [[theNib instantiateWithOwner:self options:nil] objectAtIndex:0];
    }
    UILabel *myLabel = (UILabel *)[cell viewWithTag:300];
    UITextField *available = (UITextField *) [cell viewWithTag:100];
    UITextField *price = (UITextField *) [cell viewWithTag:200];
    [bar.fields addObject:available];
    [bar.fields addObject:price];
    available.inputAccessoryView = bar;
    available.delegate = self;
    price.inputAccessoryView = bar;
    price.delegate = self;
    myLabel.text = [_gemTypes objectAtIndex:indexPath.row];
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

- (IBAction)calculate:(id)sender {
    int i, count = _gemTypes.count;
    NSMutableArray *beans = [[NSMutableArray alloc] initWithCapacity:count];
    [_gemTypes removeAllObjects];
    for (i = 0; i < count - 1; i ++) {
        NSIndexPath *path = [NSIndexPath indexPathForRow:i inSection:0];;
        UITableView *tableView = (UITableView*)[self.view viewWithTag:1000];
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:path];
        UITextField *available = (UITextField *)[cell viewWithTag:100];
        UITextField *price = (UITextField *)[cell viewWithTag:200];
        UILabel *gemType = (UILabel *)[cell viewWithTag:300];
        GemBean *bean = [[GemBean alloc] init];
        bean.AHPrice = [price.text integerValue];
        bean.available = [available.text integerValue];
        bean.type = gemType.text;
        [beans addObject:bean];
    }
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    appDelegate.beans = beans;

}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    bar.field = textField;
}
@end
