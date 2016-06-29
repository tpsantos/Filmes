//
//  MovieConnection.h
//  Filmes
//
//  Created by Thiago Santos on 28/06/16.
//  Copyright © 2016 Thiago Santos. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^MovieCallback)(BOOL success, NSInteger code, id result);

@interface MovieConnection : NSObject

+ (void)downloadMovieWithUrl:(NSURL *)url callback:(MovieCallback)callback;

@end
