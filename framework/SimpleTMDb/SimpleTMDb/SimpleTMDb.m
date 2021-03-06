//
//  SimpleTMDb.m
//  SimpleTMDb
//
//  Created by Peter Hood on 5/18/13.
//  Copyright (c) 2013 Bridge Thirteen. All rights reserved.
//

#import "SimpleTMDb.h"

NSString * const kApiURL = @"http://api.themoviedb.org/3";

// Search Type String Values
static const NSString *TMDbSearchTypePhrase = @"phrase";
static const NSString *TMDbSearchTypeNgram  = @"ngram";


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


- (void)movieWithID:(NSString *)movieID andAppendToResponse:(NSString *)movieMethods completionHandler:(void (^)(NSDictionary *))handler
{
    NSString *urlString = [NSString stringWithFormat:@"%@/movie/%@?api_key=%@&append_to_response=%@", kApiURL, movieID, [self apiKey], movieMethods];
    [self handleRequestWithURL:urlString completionBlock:handler];
}

- (void)movieAlternativeTitlesWithID:(NSString *)movieID andCountry:(NSString *)country andAppendToResponse:(NSString *)movieMethods completionHandler:(void (^)(NSDictionary *))handler
{
    NSString *urlString = [NSString stringWithFormat:@"%@/movie/%@/alternative_titles?api_key=%@&country=%@&append_to_response=%@", kApiURL, movieID, [self apiKey], country, movieMethods];
    [self handleRequestWithURL:urlString completionBlock:handler];
}


- (void)movieCastsWithID:(NSString *)movieID andAppendToResponse:(NSString *)movieMethods completionHandler:(void (^)(NSDictionary *))handler
{
    NSString *urlString = [NSString stringWithFormat:@"%@/movie/%@/casts?api_key=%@&append_to_response=%@", kApiURL, movieID, [self apiKey], movieMethods];
    [self handleRequestWithURL:urlString completionBlock:handler];
}

- (void)movieImagesWithID:(NSString *)movieID andLanguage:(NSString *)language andAppendToResponse:(NSString *)movieMethods completionHandler:(void (^)(NSDictionary *))handler
{
    NSString *urlString = [NSString stringWithFormat:@"%@/movie/%@/images?api_key=%@&language=%@&append_to_response=%@", kApiURL, movieID, [self apiKey], language, movieMethods];
    [self handleRequestWithURL:urlString completionBlock:handler];
}

- (void)movieKeywordsWithID:(NSString *)movieID andAppendToResponse:(NSString *)movieMethods completionHandler:(void (^)(NSDictionary *))handler
{
    NSString *urlString = [NSString stringWithFormat:@"%@/movie/%@/keywords?api_key=%@&append_to_response=%@", kApiURL, movieID, [self apiKey], movieMethods];
    [self handleRequestWithURL:urlString completionBlock:handler];
}

- (void)movieReleasesWithID:(NSString *)movieID andAppendToResponse:(NSString *)movieMethods completionHandler:(void (^)(NSDictionary *))handler
{
    NSString *urlString = [NSString stringWithFormat:@"%@/movie/%@/releases?api_key=%@&append_to_response=%@", kApiURL, movieID, [self apiKey], movieMethods];
    [self handleRequestWithURL:urlString completionBlock:handler];
}

- (void)movieTrailersWithID:(NSString *)movieID andAppendToResponse:(NSString *)movieMethods completionHandler:(void (^)(NSDictionary *))handler
{
    NSString *urlString = [NSString stringWithFormat:@"%@/movie/%@/trailers?api_key=%@&append_to_response=%@", kApiURL, movieID, [self apiKey], movieMethods];
    [self handleRequestWithURL:urlString completionBlock:handler];
}

- (void)movieTranslationsWithID:(NSString *)movieID andAppendToResponse:(NSString *)movieMethods completionHandler:(void (^)(NSDictionary *))handler
{
    NSString *urlString = [NSString stringWithFormat:@"%@/movie/%@/translations?api_key=%@&append_to_response=%@", kApiURL, movieID, [self apiKey], movieMethods];
    [self handleRequestWithURL:urlString completionBlock:handler];
}

- (void)movieSimilarMoviesWithID:(NSString *)movieID andPage:(NSString *)page andLanguage:(NSString *)language andAppendToResponse:(NSString *)movieMethods completionHandler:(void (^)(NSDictionary *))handler
{
    NSString *urlString = [NSString stringWithFormat:@"%@/movie/%@/similar_movies?api_key=%@&page=%@&language=%@&append_to_response=%@", kApiURL, movieID, [self apiKey], page, language, movieMethods];
    [self handleRequestWithURL:urlString completionBlock:handler];
}

- (void)movieReviewsWithID:(NSString *)movieID andPage:(NSString *)page andLanguage:(NSString *)language andAppendToResponse:(NSString *)movieMethods completionHandler:(void (^)(NSDictionary *))handler
{
    NSString *urlString = [NSString stringWithFormat:@"%@/movie/%@/reviews?api_key=%@&page=%@&language=%@&append_to_response=%@", kApiURL, movieID, [self apiKey], page, language, movieMethods];
    [self handleRequestWithURL:urlString completionBlock:handler];

}

- (void)movieListsWithID:(NSString *)movieID andPage:(NSString *)page andLanguage:(NSString *)language andAppendToResponse:(NSString *)movieMethods completionHandler:(void (^)(NSDictionary *))handler
{
    NSString *urlString = [NSString stringWithFormat:@"%@/movie/%@/lists?api_key=%@&page=%@&language=%@&append_to_response=%@", kApiURL, movieID, [self apiKey], page, language, movieMethods];
    [self handleRequestWithURL:urlString completionBlock:handler];

}

- (void)movieChangesWithID:(NSString *)movieID andStartDate:(NSDate *)startDate andEndDate:(NSDate *)endDate andAppendToResponse:(NSString *)movieMethods completionHandler:(void (^)(NSDictionary *))handler
{
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];

    NSMutableString* dateString = [[NSMutableString alloc] init];
    if(startDate)
    {
        NSString* startDateString = [NSString stringWithFormat:@"&startDate=%@", [dateFormatter stringFromDate:startDate]];
        [dateString appendString:startDateString];
    }
    if(endDate)
    {
        NSString* endDateString = [NSString stringWithFormat:@"&endDate=%@", [dateFormatter stringFromDate:startDate]];
        [dateString appendString:endDateString];
        
    }
    
    
    NSString *urlString = [NSString stringWithFormat:@"%@/movie/%@/changes?api_key=%@%@&append_to_response=%@", kApiURL, movieID, [self apiKey], dateString, movieMethods];
    [self handleRequestWithURL:urlString completionBlock:handler];

}

- (void)movieLatestWithCompletionHandler:(void (^)(NSDictionary *))handler
{
    NSString *urlString = [NSString stringWithFormat:@"%@/movie/latest?api_key=%@", kApiURL, [self apiKey]];
    [self handleRequestWithURL:urlString completionBlock:handler];
}

- (void)movieUpcomingWithPage:(NSString *)page andLanguage:(NSString *)language completionHandler:(void (^)(NSDictionary *))handler
{
    NSString *urlString = [NSString stringWithFormat:@"%@/movie/upcoming?api_key=%@&page=%@&language=%@", kApiURL, [self apiKey], page, language];
    [self handleRequestWithURL:urlString completionBlock:handler];
   
}

- (void)movieNowPlayingWithPage:(NSString *)page andLanguage:(NSString *)language completionHandler:(void (^)(NSDictionary *))handler
{
    NSString *urlString = [NSString stringWithFormat:@"%@/movie/now_playing?api_key=%@&page=%@&language=%@", kApiURL, [self apiKey], page, language];
    [self handleRequestWithURL:urlString completionBlock:handler];  
}

- (void)moviePopularWithPage:(NSString *)page andLanguage:(NSString *)language completionHandler:(void (^)(NSDictionary *))handler
{
    NSString *urlString = [NSString stringWithFormat:@"%@/movie/popular?api_key=%@&page=%@&language=%@", kApiURL, [self apiKey], page, language];
    [self handleRequestWithURL:urlString completionBlock:handler];

}

- (void)movieTopRatedWithPage:(NSString *)page andLanguage:(NSString *)language completionHandler:(void (^)(NSDictionary *))handler
{
    NSString *urlString = [NSString stringWithFormat:@"%@/movie/top_rated?api_key=%@&page=%@&language=%@", kApiURL, [self apiKey], page, language];
    [self handleRequestWithURL:urlString completionBlock:handler];

}


#pragma mark - Search API

- (void)searchForPersonByName:(NSString *)name page:(NSUInteger)page includeAdult:(BOOL)isIncludeAdult searchType:(STMSearchType)searchType completionHandler:(void (^)(NSDictionary *))handler
{
    NSString *searchTypeString = @"phrase";
    if (searchType == STMSearchTypeNgram)
        searchTypeString = @"ngram";
    
    NSString *urlString = [NSString stringWithFormat:@"%@/search/person?api_key=%@&query=%@&page=%d&include_adult=%@&search_type=%@", kApiURL, [self apiKey], name, page, isIncludeAdult?@"true":@"false", searchTypeString];
    [self handleRequestWithURL:urlString completionBlock:handler];
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
