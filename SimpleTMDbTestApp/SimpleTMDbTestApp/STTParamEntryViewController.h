//
//  STTParamEntryViewController.h
//  SimpleTMDbTestApp
//
//  Created by Peter Hood on 5/20/13.
//  Copyright (c) 2013 Bridge Thirteen. All rights reserved.
//

#import "STTBaseApiViewController.h"
#import "STTParamEntryDelegate.h"

@interface STTParamEntryViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *paramValueTextField;
@property (weak, nonatomic) IBOutlet UILabel *paramNameLabel;

@property (nonatomic, strong) id<STTParamEntryDelegate> delegate;

@end
