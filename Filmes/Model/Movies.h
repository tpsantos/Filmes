//
//  Movies.h
//
//  Created by Thiago Santos on 28/06/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Movies : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double resultsIdentifier;
@property (nonatomic, assign) BOOL adult;
@property (nonatomic, strong) NSArray *genreIds;
@property (nonatomic, strong) NSString *originalTitle;
@property (nonatomic, strong) NSString *backdropPath;
@property (nonatomic, assign) BOOL video;
@property (nonatomic, assign) double popularity;
@property (nonatomic, strong) NSString *posterPath;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *overview;
@property (nonatomic, strong) NSString *originalLanguage;
@property (nonatomic, assign) double voteCount;
@property (nonatomic, strong) NSString *releaseDate;
@property (nonatomic, assign) double voteAverage;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
