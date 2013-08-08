//
//  STTMovieApiImagesViewController.m
//  SimpleTMDbTestApp
//
//  Created by Peter Hood on 8/7/13.
//  Copyright (c) 2013 Bridge Thirteen. All rights reserved.
//

#import "STTMovieApiImagesViewController.h"


typedef NS_ENUM(NSInteger, STTMovieApiImagesParamIndex)
{
    STTMovieApiImagesParamIndexMovieID = 0,
    STTMovieApiImagesParamIndexLanguage,
    STTMovieApiImagesParamIndexAppendToResponse
};


@interface STTMovieApiImagesViewController ()

@end


@implementation STTMovieApiImagesViewController


#pragma mark - Life Cycle

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        self.title = @"Images";
    }
    return self;
}



- (IBAction)executeClicked:(id)sender {
    
    NSString *movieID = _paramArray[STTMovieApiImagesParamIndexMovieID][1];
    NSString *language = _paramArray[STTMovieApiImagesParamIndexLanguage][1];
    NSString *appendToResponse = _paramArray[STTMovieApiImagesParamIndexAppendToResponse][1];
    
    [[SimpleTMDb sharedInstance] movieImagesWithID:movieID
                                       andLanguage:language
                               andAppendToResponse:appendToResponse
                                 completionHandler:^(NSDictionary *dict)
    {
//       NSLog(@"Found Movie: %@", dict);
       
       STTResponseViewController *responseView = [[STTResponseViewController alloc] init];
       [[self navigationController] pushViewController:responseView animated:YES];
       [[responseView responseTextView] setText:[dict description]];
    }];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"Get the images (posters and backdrops) for a specific movie id.";
}


@end
