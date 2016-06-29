//
//  MovieDetail.h
//
//  Created by Thiago Santos on 29/06/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BelongsToCollection;

@interface MovieDetail : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double runtime;
@property (nonatomic, strong) NSString *status;
@property (nonatomic, strong) NSString *backdropPath;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *overview;
@property (nonatomic, assign) double voteCount;
@property (nonatomic, strong) NSString *tagline;
@property (nonatomic, strong) BelongsToCollection *belongsToCollection;
@property (nonatomic, strong) NSString *originalTitle;
@property (nonatomic, strong) NSString *posterPath;
@property (nonatomic, strong) NSString *originalLanguage;
@property (nonatomic, assign) double revenue;
@property (nonatomic, strong) NSArray *productionCountries;
@property (nonatomic, strong) NSString *homepage;
@property (nonatomic, assign) BOOL video;
@property (nonatomic, strong) NSString *imdbId;
@property (nonatomic, assign) double internalBaseClassIdentifier;
@property (nonatomic, strong) NSString *releaseDate;
@property (nonatomic, assign) double budget;
@property (nonatomic, assign) double popularity;
@property (nonatomic, strong) NSArray *genres;
@property (nonatomic, strong) NSArray *productionCompanies;
@property (nonatomic, assign) BOOL adult;
@property (nonatomic, strong) NSArray *spokenLanguages;
@property (nonatomic, assign) double voteAverage;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
