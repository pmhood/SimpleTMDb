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
- (void)movieWithID:(NSString *)id andAppendToResponse:(NSString *)movieMethods completionHandler:(void (^)(NSDictionary *))handler;
- (void)movieAlternativeTitlesWithID:(NSString *)id andCountry:(NSString *)country andAppendToResponse:(NSString *)movieMethods completionHandler:(void (^)(NSDictionary *))handler;
- (void)movieCastsWithID:(NSString *)id andAppendToResponse:(NSString *)movieMethods completionHandler:(void (^)(NSDictionary *))handler;
- (void)movieImagesWithID:(NSString *)id andLanguage:(NSString *)language andAppendToResponse:(NSString *)movieMethods completionHandler:(void (^)(NSDictionary *))handler;
- (void)movieKeywordsWithID:(NSString *)id andAppendToResponse:(NSString *)movieMethods completionHandler:(void (^)(NSDictionary *))handler;
- (void)movieReleasesWithID:(NSString *)id andAppendToResponse:(NSString *)movieMethods completionHandler:(void (^)(NSDictionary *))handler;
- (void)movieTrailersWithID:(NSString *)id andAppendToResponse:(NSString *)movieMethods completionHandler:(void (^)(NSDictionary *))handler;
- (void)movieTranslationsWithID:(NSString *)id andAppendToResponse:(NSString *)movieMethods completionHandler:(void (^)(NSDictionary *))handler;
- (void)movieSimilarMoviesWithID:(NSString *)id andPage:(NSString *)page andLanguage:(NSString *)language andAppendToResponse:(NSString *)movieMethods completionHandler:(void (^)(NSDictionary *))handler;
- (void)movieReviewsWithID:(NSString *)id andPage:(NSString *)page andLanguage:(NSString *)language andAppendToResponse:(NSString *)movieMethods completionHandler:(void (^)(NSDictionary *))handler;
- (void)movieListsWithID:(NSString *)id andPage:(NSString *)page andLanguage:(NSString *)language andAppendToResponse:(NSString *)movieMethods completionHandler:(void (^)(NSDictionary *))handler;
- (void)movieChangesWithID:(NSString *)id andStartDate:(NSDate *)startDate andEndDate:(NSDate *)endDate andAppendToResponse:(NSString *)movieMethods completionHandler:(void (^)(NSDictionary *))handler;
- (void)movieLatestWithCompletionHandler:(void (^)(NSDictionary *))handler;
- (void)movieUpcomingWithPage:(NSString *)page andLanguage:(NSString *)language completionHandler:(void (^)(NSDictionary *))handler;
- (void)movieNowPlayingWithPage:(NSString *)page andLanguage:(NSString *)language completionHandler:(void (^)(NSDictionary *))handler;
- (void)moviePopularWithPage:(NSString *)page andLanguage:(NSString *)language completionHandler:(void (^)(NSDictionary *))handler;
- (void)movieTopRatedWithPage:(NSString *)page andLanguage:(NSString *)language completionHandler:(void (^)(NSDictionary *))handler;


@end
