//
//  STTParamEntryViewController.m
//  SimpleTMDbTestApp
//
//  Created by Peter Hood on 5/20/13.
//  Copyright (c) 2013 Bridge Thirteen. All rights reserved.
//

#import "STTParamEntryViewController.h"

@interface STTParamEntryViewController ()
- (IBAction)saveClicked:(id)sender;

@end

@implementation STTParamEntryViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [[self paramValueTextField] becomeFirstResponder];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveClicked:(id)sender
{
    [[self delegate] parameterUpdated:[NSArray arrayWithObjects:[[self paramNameLabel] text], [[self paramValueTextField] text], nil]];
    [self.navigationController popViewControllerAnimated:YES];
}
@end
