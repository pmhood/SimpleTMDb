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


#pragma mark - Movie API

- (void)movieWithID:(NSString *)movieID andAppendToResponse:(NSString *)movieMethods completionHandler:(void (^)(NSDictionary *))handler;
- (void)movieAlternativeTitlesWithID:(NSString *)movieID andCountry:(NSString *)country andAppendToResponse:(NSString *)movieMethods completionHandler:(void (^)(NSDictionary *))handler;
- (void)movieCastsWithID:(NSString *)movieID andAppendToResponse:(NSString *)movieMethods completionHandler:(void (^)(NSDictionary *))handler;
- (void)movieImagesWithID:(NSString *)movieID andLanguage:(NSString *)language andAppendToResponse:(NSString *)movieMethods completionHandler:(void (^)(NSDictionary *))handler;
- (void)movieKeywordsWithID:(NSString *)movieID andAppendToResponse:(NSString *)movieMethods completionHandler:(void (^)(NSDictionary *))handler;
- (void)movieReleasesWithID:(NSString *)movieID andAppendToResponse:(NSString *)movieMethods completionHandler:(void (^)(NSDictionary *))handler;
- (void)movieTrailersWithID:(NSString *)movieID andAppendToResponse:(NSString *)movieMethods completionHandler:(void (^)(NSDictionary *))handler;
- (void)movieTranslationsWithID:(NSString *)movieID andAppendToResponse:(NSString *)movieMethods completionHandler:(void (^)(NSDictionary *))handler;
- (void)movieSimilarMoviesWithID:(NSString *)movieID andPage:(NSString *)page andLanguage:(NSString *)language andAppendToResponse:(NSString *)movieMethods completionHandler:(void (^)(NSDictionary *))handler;
- (void)movieReviewsWithID:(NSString *)movieID andPage:(NSString *)page andLanguage:(NSString *)language andAppendToResponse:(NSString *)movieMethods completionHandler:(void (^)(NSDictionary *))handler;
- (void)movieListsWithID:(NSString *)movieID andPage:(NSString *)page andLanguage:(NSString *)language andAppendToResponse:(NSString *)movieMethods completionHandler:(void (^)(NSDictionary *))handler;
- (void)movieChangesWithID:(NSString *)movieID andStartDate:(NSDate *)startDate andEndDate:(NSDate *)endDate andAppendToResponse:(NSString *)movieMethods completionHandler:(void (^)(NSDictionary *))handler;
- (void)movieLatestWithCompletionHandler:(void (^)(NSDictionary *))handler;
- (void)movieUpcomingWithPage:(NSString *)page andLanguage:(NSString *)language completionHandler:(void (^)(NSDictionary *))handler;
- (void)movieNowPlayingWithPage:(NSString *)page andLanguage:(NSString *)language completionHandler:(void (^)(NSDictionary *))handler;
- (void)moviePopularWithPage:(NSString *)page andLanguage:(NSString *)language completionHandler:(void (^)(NSDictionary *))handler;
- (void)movieTopRatedWithPage:(NSString *)page andLanguage:(NSString *)language completionHandler:(void (^)(NSDictionary *))handler;

@end
