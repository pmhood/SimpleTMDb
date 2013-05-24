//
//  SimpleTMDb.h
//  SimpleTMDb
//
//  Created by Peter Hood on 5/18/13.
//  Copyright (c) 2013 Bridge Thirteen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "STMMovie.h"

@interface SimpleTMDb : NSObject

@property (nonatomic, copy) NSString *apiKey;

+ (SimpleTMDb *)sharedInstance;


// Configuration API
- (void)configurationWithCompletionHandler:(void (^)(NSDictionary *))handler;

// Movies API
//- (void)movieWithID:(NSString *)id completionHandler:(void (^)(NSDictionary *))handler;
- (void)movieWithID:(NSString *)id andAppendToResponse:(NSString *)movieMethods completionHandler:(void (^)(NSDictionary *))handler;
- (void)movieAlternativeTitlesWithID:(NSString *)id andCountry:(NSString *)country andAppendToResponse:(NSString *)movieMethods completionHandler:(void (^)(NSDictionary *))handler;


@end
