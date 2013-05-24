//
//  STTBaseApiViewController.h
//  SimpleTMDbTestApp
//
//  Created by Peter Hood on 5/20/13.
//  Copyright (c) 2013 Bridge Thirteen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface STTBaseApiViewController : UITableViewController
{
    NSMutableArray *_paramArray;
}

- (void)setParameters:(NSArray *)params;

@end
