//
//  STTBaseApiViewController.m
//  SimpleTMDbTestApp
//
//  Created by Peter Hood on 5/20/13.
//  Copyright (c) 2013 Bridge Thirteen. All rights reserved.
//

#import "STTBaseApiViewController.h"
#import "STTParamEntryViewController.h"
#import "STTParamEntryDelegate.h"
#import <SimpleTMDb/SimpleTMDb.h>

typedef NS_ENUM(NSInteger, STTBaseApiFieldIndex)
{
    STTBaseApiFieldIndexTitle = 0,
    STTBaseApiFieldIndexValue
};


@interface STTBaseApiViewController ()<STTParamEntryDelegate>
{
//    NSMutableArray *_paramArray;
}
//@property (nonatomic, strong) NSMutableArray *paramArray;
@property (nonatomic, strong) IBOutlet UIView *footerView;
- (IBAction)executeClicked:(id)sender;


@end

@implementation STTBaseApiViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:UITableViewStyleGrouped];
    if (self) {
        // Custom initialization
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


- (void)setParameters:(NSArray *)params
{
    _paramArray = [params mutableCopy];
}

- (UIView *)footerView
{
    // If we haven't loaded the headerView yet...
    if (!_footerView) {
        // Load HeaderView.xib
        [[NSBundle mainBundle] loadNibNamed:@"STTBaseApiViewFooter"
                                      owner:self
                                    options:nil];
    }
    
    return _footerView;
}

- (IBAction)executeClicked:(id)sender {
    NSLog(@"execute!");
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
    return [_paramArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    NSArray *param = _paramArray[[indexPath row]];
    NSString *text = [NSString stringWithFormat:@"%@: %@", param[0], param[1]];
    [[cell textLabel] setText:text];
    
    return cell;
}



- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"";
}


- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return [self footerView];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return [[self footerView] bounds].size.height;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    STTParamEntryViewController *v = [[STTParamEntryViewController alloc] init];
    [v setDelegate:self];
    
    [self.navigationController pushViewController:v animated:YES];

    [[v paramNameLabel] setText:_paramArray[[indexPath row]][0]];
    [[v paramValueTextField] setText:_paramArray[[indexPath row]][1]];

}

- (void)parameterUpdated:(NSArray *)parameter
{
    NSLog(@"param updated! %@", parameter);
    
    NSIndexPath *indexPath = [[self tableView] indexPathForSelectedRow];
//    _paramArray[[indexPath row]] = parameter;
    
    [_paramArray replaceObjectAtIndex:[indexPath row] withObject:parameter];
    
    [[self tableView] reloadData];
    
}

@end
