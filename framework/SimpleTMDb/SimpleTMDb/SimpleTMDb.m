//
//  SimpleTMDb.m
//  SimpleTMDb
//
//  Created by Peter Hood on 5/18/13.
//  Copyright (c) 2013 Bridge Thirteen. All rights reserved.
//

#import "SimpleTMDb.h"

NSString * const kApiURL = @"http://api.themoviedb.org/3";


@interface SimpleTMDb ()
{
}

@end


@implementation SimpleTMDb

+ (id)allocWithZone:(NSZone *)zone
{
    return [self sharedInstance];
}

+ (SimpleTMDb *)sharedInstance
{
    static SimpleTMDb *instance = nil;
    if(!instance)
        instance = [[super allocWithZone:nil] init];
    return instance;
}


#pragma mark - Configuration API

- (void)configurationWithCompletionHandler:(void (^)(NSDictionary *))handler
{
    if(!handler)
        return;
    
    NSString *urlString = [NSString stringWithFormat:@"%@/configuration?api_key=%@", kApiURL, [self apiKey]];
    
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *err)
     {

         if(data)
         {
             NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data
                                                                  options:0
                                                                    error:nil];
             handler(dict);
         }
         else {
             handler(nil);             
         }
         

     }];
    
}


#pragma mark - Movie API

- (void)movieWithID:(NSString *)id completionHandler:(void (^)(NSDictionary *))handler
{
    NSString *urlString = [NSString stringWithFormat:@"%@/movie/%@?api_key=%@", kApiURL, id, [self apiKey]];
    [self handleRequestWithURL:urlString completionBlock:handler];
}


- (void)movieWithID:(NSString *)id andAppendToResponse:(NSString *)movieMethods completionHandler:(void (^)(NSDictionary *))handler
{
    NSString *urlString = [NSString stringWithFormat:@"%@/movie/%@?api_key=%@&append_to_response=%@", kApiURL, id, [self apiKey], movieMethods];
    [self handleRequestWithURL:urlString completionBlock:handler];
}

- (void)movieAlternativeTitlesWithID:(NSString *)id andCountry:(NSString *)country andAppendToResponse:(NSString *)movieMethods completionHandler:(void (^)(NSDictionary *))handler
{
    NSString *urlString = [NSString stringWithFormat:@"%@/movie/%@/alternative_titles?api_key=%@&country=%@&append_to_response=%@", kApiURL, id, [self apiKey], country, movieMethods];
    [self handleRequestWithURL:urlString completionBlock:handler];
}


- (void)movieCastsWithID:(NSString *)id andAppendToResponse:(NSString *)movieMethods completionHandler:(void (^)(NSDictionary *))handler
{
    NSString *urlString = [NSString stringWithFormat:@"%@/movie/%@/casts?api_key=%@&append_to_response=%@", kApiURL, id, [self apiKey], movieMethods];
    [self handleRequestWithURL:urlString completionBlock:handler];
}

- (void)movieImagesWithID:(NSString *)id andLanguage:(NSString *)language andAppendToResponse:(NSString *)movieMethods completionHandler:(void (^)(NSDictionary *))handler
{
    
}

- (void)movieKeywordsWithID:(NSString *)id andAppendToResponse:(NSString *)movieMethods completionHandler:(void (^)(NSDictionary *))handler
{
    
}

- (void)movieReleasesWithID:(NSString *)id andAppendToResponse:(NSString *)movieMethods completionHandler:(void (^)(NSDictionary *))handler
{
    
}

- (void)movieTrailersWithID:(NSString *)id andAppendToResponse:(NSString *)movieMethods completionHandler:(void (^)(NSDictionary *))handler
{
    
}

- (void)movieTranslationsWithID:(NSString *)id andAppendToResponse:(NSString *)movieMethods completionHandler:(void (^)(NSDictionary *))handler
{
    
}

- (void)movieSimilarMoviesWithID:(NSString *)id andPage:(NSString *)page andLanguage:(NSString *)language andAppendToResponse:(NSString *)movieMethods completionHandler:(void (^)(NSDictionary *))handler
{
    
}

- (void)movieReviewsWithID:(NSString *)id andPage:(NSString *)page andLanguage:(NSString *)language andAppendToResponse:(NSString *)movieMethods completionHandler:(void (^)(NSDictionary *))handler
{
    
}

- (void)movieListsWithID:(NSString *)id andPage:(NSString *)page andLanguage:(NSString *)language andAppendToResponse:(NSString *)movieMethods completionHandler:(void (^)(NSDictionary *))handler
{
    
}

- (void)movieChangesWithID:(NSString *)id andStartDate:(NSDate *)startDate andEndDate:(NSDate *)endDate andAppendToResponse:(NSString *)movieMethods completionHandler:(void (^)(NSDictionary *))handler
{
    
}

- (void)movieLatestWithCompletionHandler:(void (^)(NSDictionary *))handler
{
    
}

- (void)movieUpcomingWithPage:(NSString *)page andLanguage:(NSString *)language completionHandler:(void (^)(NSDictionary *))handler
{
    
}

- (void)movieNowPlayingWithPage:(NSString *)page andLanguage:(NSString *)language completionHandler:(void (^)(NSDictionary *))handler
{
    
}

- (void)moviePopularWithPage:(NSString *)page andLanguage:(NSString *)language completionHandler:(void (^)(NSDictionary *))handler
{
    
}

- (void)movieTopRatedWithPage:(NSString *)page andLanguage:(NSString *)language completionHandler:(void (^)(NSDictionary *))handler
{
    
}



#pragma mark - Helper methods
- (void)handleRequestWithURL:(NSString *)urlString completionBlock:(void (^)(NSDictionary *))handler
{
    if(!handler)
        return;
    

    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *err)
     {
         if(data)
         {
             NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data
                                                                  options:0
                                                                    error:nil];
             handler(dict);
             
         }
         else
         {
             handler(nil);
         }
         
     }];
}

@end
