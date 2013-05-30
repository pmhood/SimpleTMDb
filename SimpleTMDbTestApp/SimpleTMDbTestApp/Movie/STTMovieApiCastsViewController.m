//
//  STTMovieApiCastsViewController.m
//  SimpleTMDbTestApp
//
//  Created by Peter Hood on 5/22/13.
//  Copyright (c) 2013 Bridge Thirteen. All rights reserved.
//

#import "STTMovieApiCastsViewController.h"
#import <SimpleTMDb/SimpleTMDb.h>
#import "STTResponseViewController.h"

enum ParamIndex {
    ParamIndexMovieID = 0,
    ParamIndexAppendToResponse
};

@interface STTMovieApiCastsViewController ()

@end

@implementation STTMovieApiCastsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self setTitle:@"Casts"];
    }
    return self;
}

- (IBAction)executeClicked:(id)sender {
    
    NSString *movieID = _paramArray[ParamIndexMovieID][1];
    NSString *appendToResponse = _paramArray[ParamIndexAppendToResponse][1];
    
    [[SimpleTMDb sharedInstance] movieCastsWithID:movieID
                              andAppendToResponse:appendToResponse
                                completionHandler:^(NSDictionary *dict) {
                                                STTResponseViewController *responseView = [[STTResponseViewController alloc] init];
                                                [[self navigationController] pushViewController:responseView animated:YES];
                                                [[responseView responseTextView] setText:[dict description]];
                                            }];
}

@end
