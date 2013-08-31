//
//  STTSelectPersonsApiViewController.m
//  SimpleTMDbTestApp
//
//  Created by Peter Hood on 5/19/13.
//  Copyright (c) 2013 Bridge Thirteen. All rights reserved.
//

#import "STTSelectPersonsApiViewController.h"
#import "STTBaseApiViewController.h"

#import "STTPersonApiSearchViewController.h"


typedef NS_ENUM(NSInteger, STTPersonApiIndex)
{
    STTPersonApiIndexSearch = 0,
};


@interface STTSelectPersonsApiViewController ()
{
    NSArray* _apiList;
}
@end

@implementation STTSelectPersonsApiViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {

        _apiList = @[@"Search"];
        
        self.title = @"Person API";
        
        // Setup tab bar item
        UITabBarItem *tbi = [self tabBarItem];
        [tbi setTitle:@"Persons"];
        
        UIImage *i = [UIImage imageNamed:@"111-user.png"];
        [tbi setImage:i];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    return [_apiList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    cell.textLabel.text = _apiList[indexPath.row];
    
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
    STTBaseApiViewController *baseViewController = nil;
    NSArray *paramArray = nil;
    
    switch (indexPath.row)
    {
        case STTPersonApiIndexSearch:
        {
            paramArray = [NSArray arrayWithObjects:@[@"query", @"will"],
                          @[@"page", @1],
                          @[@"includeAdult", @0],
                          @[@"searchType", @"phrase"],
                          nil];
            baseViewController = [[STTPersonApiSearchViewController alloc] init];
            break;
        }
            
        default:
            NSLog(@"WARNING: Unknown row selected: %d", [indexPath row]);
            break;
    }
    
    if(baseViewController)
    {
        [baseViewController setParameters:paramArray];
        [self.navigationController pushViewController:baseViewController animated:YES];
    }
    
}

@end
