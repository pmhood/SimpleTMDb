//
//  STTMovieApiAlternativeTitlesViewController.m
//  SimpleTMDbTestApp
//
//  Created by Peter Hood on 5/22/13.
//  Copyright (c) 2013 Bridge Thirteen. All rights reserved.
//

#import "STTMovieApiAlternativeTitlesViewController.h"


typedef NS_ENUM(NSInteger, STTMovieApiAlternativeTitlesParamIndex)
{
    STTMovieApiAlternativeTitlesParamIndexMovieID = 0,
    STTMovieApiAlternativeTitlesParamIndexCountry,
    STTMovieApiAlternativeTitlesParamIndexAppendToResponse
};


@interface STTMovieApiAlternativeTitlesViewController ()

@end

@implementation STTMovieApiAlternativeTitlesViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        [self setTitle:@"Alternative Titles"];
    }
    return self;
}


- (IBAction)executeClicked:(id)sender {
    
    NSString *movieID = _paramArray[STTMovieApiAlternativeTitlesParamIndexMovieID][1];
    NSString *country = _paramArray[STTMovieApiAlternativeTitlesParamIndexCountry][1];
    NSString *appendToResponse = _paramArray[STTMovieApiAlternativeTitlesParamIndexAppendToResponse][1];
    
    [[SimpleTMDb sharedInstance] movieAlternativeTitlesWithID:movieID
                                                   andCountry:country
                                          andAppendToResponse:appendToResponse
                                            completionHandler:^(NSDictionary *dict)
    {
        STTResponseViewController *responseView = [[STTResponseViewController alloc] init];
        [[self navigationController] pushViewController:responseView animated:YES];
        [[responseView responseTextView] setText:[dict description]];
    }];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"Get the alternative titles for a specific movie id.";
}


@end
