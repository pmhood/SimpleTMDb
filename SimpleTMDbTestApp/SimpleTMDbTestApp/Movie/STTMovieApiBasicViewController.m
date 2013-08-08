//
//  STTMovieApiBasicViewController.m
//  SimpleTMDbTestApp
//
//  Created by Peter Hood on 5/22/13.
//  Copyright (c) 2013 Bridge Thirteen. All rights reserved.
//

#import "STTMovieApiBasicViewController.h"
#import "STTResponseViewController.h"
#import <SimpleTMDb/SimpleTMDb.h>

int kParamIndexMovieID = 0;
int kParamIndexAppendToResponse = 1;


@interface STTMovieApiBasicViewController ()

@end

@implementation STTMovieApiBasicViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self setTitle:@"Basic Info"];
    }
    return self;
}


- (IBAction)executeClicked:(id)sender {
    
    NSString *movieID = _paramArray[kParamIndexMovieID][1];
    NSString *appendToResponse = _paramArray[kParamIndexAppendToResponse][1];
    
    [[SimpleTMDb sharedInstance] movieWithID:movieID
                         andAppendToResponse:appendToResponse
                           completionHandler:^(NSDictionary *dict) {
                               NSLog(@"Found Movie: %@", dict);
                               
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
