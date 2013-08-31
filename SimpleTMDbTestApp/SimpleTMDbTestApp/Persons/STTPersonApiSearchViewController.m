//
//  STTPersonApiSearchViewController.m
//  SimpleTMDbTestApp
//
//  Created by Hood, Peter on 8/30/13.
//  Copyright (c) 2013 Bridge Thirteen. All rights reserved.
//

#import "STTPersonApiSearchViewController.h"

typedef NS_ENUM(NSUInteger, ParameterIndex)
{
    ParameterIndexQuery = 0,
    ParameterIndexPage,
    ParameterIndexIncludeAdult,
    ParameterIndexSearchType,    
};

@interface STTPersonApiSearchViewController ()

@end

@implementation STTPersonApiSearchViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Person Search";
    }
    return self;
}

- (IBAction)executeClicked:(id)sender {
    
    NSString *name          =   _paramArray[ParameterIndexQuery][1];
    NSString* page         =    _paramArray[ParameterIndexPage][1];
    BOOL includeAdult       =   ((NSInteger)_paramArray[ParameterIndexIncludeAdult][1] == 1);
    NSString* searchType    =   _paramArray[ParameterIndexSearchType][1];
    
    
    [[SimpleTMDb sharedInstance] searchForPersonByName:name
                                                  page:[page integerValue]
                                          includeAdult:includeAdult
                                            searchType:STMSearchTypePhrase
                                     completionHandler:^(NSDictionary *dict)
    {
        STTResponseViewController *responseView = [[STTResponseViewController alloc] init];
        [[self navigationController] pushViewController:responseView animated:YES];
        [[responseView responseTextView] setText:[dict description]];
    }];
    
    
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"Get the basic movie information for a specific movie id.";
}
@end
