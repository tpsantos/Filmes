//
//  MovieConnection.m
//  Filmes
//
//  Created by Thiago Santos on 28/06/16.
//  Copyright © 2016 Thiago Santos. All rights reserved.
//

#import "MovieConnection.h"
#import <AFNetworking/AFHTTPRequestOperationManager.h>
#import <AFNetworking/AFHTTPRequestOperation.h>

@implementation MovieConnection

+ (void)downloadMovieWithUrl:(NSURL *)url callback:(MovieCallback)callback{
    
    NSLog(@"URL: %@", url);
    
    NSString *_url = [NSString stringWithFormat:@"%@", url];
    
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager.requestSerializer setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
    [manager GET:_url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        //NSLog(@"JSON: %@", responseObject);
        callback(YES, operation.response.statusCode, responseObject);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"error: %@", operation.responseString);
        NSLog(@"%d",(int)operation.response.statusCode);
        NSLog(@"Request Failed with Error: %@, %@", error, error.userInfo);

        callback(NO, operation.response.statusCode, nil);
    }];
}

@end
