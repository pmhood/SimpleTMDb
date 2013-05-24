//
//  STTParamEntryDelegate.h
//  SimpleTMDbTestApp
//
//  Created by Peter Hood on 5/20/13.
//  Copyright (c) 2013 Bridge Thirteen. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol STTParamEntryDelegate <NSObject>

- (void)parameterUpdated:(NSArray *)parameter;

@end
