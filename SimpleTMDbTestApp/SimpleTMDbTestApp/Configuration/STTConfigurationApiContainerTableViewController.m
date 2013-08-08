//
//  STTConfigurationApiContainerTableViewController.m
//  SimpleTMDbTestApp
//
//  Created by Peter Hood on 8/7/13.
//  Copyright (c) 2013 Bridge Thirteen. All rights reserved.
//

#import "STTConfigurationApiContainerTableViewController.h"

@interface STTConfigurationApiContainerTableViewController ()

@end

@implementation STTConfigurationApiContainerTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        [self setTitle:@"Configuration API"];
        
        UITabBarItem *tbi = [self tabBarItem];
        [tbi setTitle:@"Configuration"];
        
        UIImage *i = [UIImage imageNamed:@"20-gear2.png"];
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
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = @"Configuration";
    
    return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [[SimpleTMDb sharedInstance] configurationWithCompletionHandler:^(NSDictionary *dict)
    {
        STTResponseViewController *responseView = [[STTResponseViewController alloc] init];
        [[self navigationController] pushViewController:responseView animated:YES];
        [[responseView responseTextView] setText:[dict description]];
    }];
}

@end
