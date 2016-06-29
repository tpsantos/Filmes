//
//  Movies.m
//
//  Created by Thiago Santos on 28/06/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "Movies.h"


NSString *const kMovieResultsId = @"id";
NSString *const kMovieResultsAdult = @"adult";
NSString *const kMovieResultsGenreIds = @"genre_ids";
NSString *const kMovieResultsOriginalTitle = @"original_title";
NSString *const kMovieResultsBackdropPath = @"backdrop_path";
NSString *const kMovieResultsVideo = @"video";
NSString *const kMovieResultsPopularity = @"popularity";
NSString *const kMovieResultsPosterPath = @"poster_path";
NSString *const kMovieResultsTitle = @"title";
NSString *const kMovieResultsOverview = @"overview";
NSString *const kMovieResultsOriginalLanguage = @"original_language";
NSString *const kMovieResultsVoteCount = @"vote_count";
NSString *const kMovieResultsReleaseDate = @"release_date";
NSString *const kMovieResultsVoteAverage = @"vote_average";


@interface Movies ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Movies

@synthesize resultsIdentifier = _resultsIdentifier;
@synthesize adult = _adult;
@synthesize genreIds = _genreIds;
@synthesize originalTitle = _originalTitle;
@synthesize backdropPath = _backdropPath;
@synthesize video = _video;
@synthesize popularity = _popularity;
@synthesize posterPath = _posterPath;
@synthesize title = _title;
@synthesize overview = _overview;
@synthesize originalLanguage = _originalLanguage;
@synthesize voteCount = _voteCount;
@synthesize releaseDate = _releaseDate;
@synthesize voteAverage = _voteAverage;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.resultsIdentifier = [[self objectOrNilForKey:kMovieResultsId fromDictionary:dict] doubleValue];
            self.adult = [[self objectOrNilForKey:kMovieResultsAdult fromDictionary:dict] boolValue];
            self.genreIds = [self objectOrNilForKey:kMovieResultsGenreIds fromDictionary:dict];
            self.originalTitle = [self objectOrNilForKey:kMovieResultsOriginalTitle fromDictionary:dict];
            self.backdropPath = [self objectOrNilForKey:kMovieResultsBackdropPath fromDictionary:dict];
            self.video = [[self objectOrNilForKey:kMovieResultsVideo fromDictionary:dict] boolValue];
            self.popularity = [[self objectOrNilForKey:kMovieResultsPopularity fromDictionary:dict] doubleValue];
            self.posterPath = [self objectOrNilForKey:kMovieResultsPosterPath fromDictionary:dict];
            self.title = [self objectOrNilForKey:kMovieResultsTitle fromDictionary:dict];
            self.overview = [self objectOrNilForKey:kMovieResultsOverview fromDictionary:dict];
            self.originalLanguage = [self objectOrNilForKey:kMovieResultsOriginalLanguage fromDictionary:dict];
            self.voteCount = [[self objectOrNilForKey:kMovieResultsVoteCount fromDictionary:dict] doubleValue];
            self.releaseDate = [self objectOrNilForKey:kMovieResultsReleaseDate fromDictionary:dict];
            self.voteAverage = [[self objectOrNilForKey:kMovieResultsVoteAverage fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.resultsIdentifier] forKey:kMovieResultsId];
    [mutableDict setValue:[NSNumber numberWithBool:self.adult] forKey:kMovieResultsAdult];
    NSMutableArray *tempArrayForGenreIds = [NSMutableArray array];
    for (NSObject *subArrayObject in self.genreIds) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForGenreIds addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForGenreIds addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForGenreIds] forKey:kMovieResultsGenreIds];
    [mutableDict setValue:self.originalTitle forKey:kMovieResultsOriginalTitle];
    [mutableDict setValue:self.backdropPath forKey:kMovieResultsBackdropPath];
    [mutableDict setValue:[NSNumber numberWithBool:self.video] forKey:kMovieResultsVideo];
    [mutableDict setValue:[NSNumber numberWithDouble:self.popularity] forKey:kMovieResultsPopularity];
    [mutableDict setValue:self.posterPath forKey:kMovieResultsPosterPath];
    [mutableDict setValue:self.title forKey:kMovieResultsTitle];
    [mutableDict setValue:self.overview forKey:kMovieResultsOverview];
    [mutableDict setValue:self.originalLanguage forKey:kMovieResultsOriginalLanguage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.voteCount] forKey:kMovieResultsVoteCount];
    [mutableDict setValue:self.releaseDate forKey:kMovieResultsReleaseDate];
    [mutableDict setValue:[NSNumber numberWithDouble:self.voteAverage] forKey:kMovieResultsVoteAverage];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.resultsIdentifier = [aDecoder decodeDoubleForKey:kMovieResultsId];
    self.adult = [aDecoder decodeBoolForKey:kMovieResultsAdult];
    self.genreIds = [aDecoder decodeObjectForKey:kMovieResultsGenreIds];
    self.originalTitle = [aDecoder decodeObjectForKey:kMovieResultsOriginalTitle];
    self.backdropPath = [aDecoder decodeObjectForKey:kMovieResultsBackdropPath];
    self.video = [aDecoder decodeBoolForKey:kMovieResultsVideo];
    self.popularity = [aDecoder decodeDoubleForKey:kMovieResultsPopularity];
    self.posterPath = [aDecoder decodeObjectForKey:kMovieResultsPosterPath];
    self.title = [aDecoder decodeObjectForKey:kMovieResultsTitle];
    self.overview = [aDecoder decodeObjectForKey:kMovieResultsOverview];
    self.originalLanguage = [aDecoder decodeObjectForKey:kMovieResultsOriginalLanguage];
    self.voteCount = [aDecoder decodeDoubleForKey:kMovieResultsVoteCount];
    self.releaseDate = [aDecoder decodeObjectForKey:kMovieResultsReleaseDate];
    self.voteAverage = [aDecoder decodeDoubleForKey:kMovieResultsVoteAverage];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_resultsIdentifier forKey:kMovieResultsId];
    [aCoder encodeBool:_adult forKey:kMovieResultsAdult];
    [aCoder encodeObject:_genreIds forKey:kMovieResultsGenreIds];
    [aCoder encodeObject:_originalTitle forKey:kMovieResultsOriginalTitle];
    [aCoder encodeObject:_backdropPath forKey:kMovieResultsBackdropPath];
    [aCoder encodeBool:_video forKey:kMovieResultsVideo];
    [aCoder encodeDouble:_popularity forKey:kMovieResultsPopularity];
    [aCoder encodeObject:_posterPath forKey:kMovieResultsPosterPath];
    [aCoder encodeObject:_title forKey:kMovieResultsTitle];
    [aCoder encodeObject:_overview forKey:kMovieResultsOverview];
    [aCoder encodeObject:_originalLanguage forKey:kMovieResultsOriginalLanguage];
    [aCoder encodeDouble:_voteCount forKey:kMovieResultsVoteCount];
    [aCoder encodeObject:_releaseDate forKey:kMovieResultsReleaseDate];
    [aCoder encodeDouble:_voteAverage forKey:kMovieResultsVoteAverage];
}

- (id)copyWithZone:(NSZone *)zone
{
    Movies *copy = [[Movies alloc] init];
    
    if (copy) {

        copy.resultsIdentifier = self.resultsIdentifier;
        copy.adult = self.adult;
        copy.genreIds = [self.genreIds copyWithZone:zone];
        copy.originalTitle = [self.originalTitle copyWithZone:zone];
        copy.backdropPath = [self.backdropPath copyWithZone:zone];
        copy.video = self.video;
        copy.popularity = self.popularity;
        copy.posterPath = [self.posterPath copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.overview = [self.overview copyWithZone:zone];
        copy.originalLanguage = [self.originalLanguage copyWithZone:zone];
        copy.voteCount = self.voteCount;
        copy.releaseDate = [self.releaseDate copyWithZone:zone];
        copy.voteAverage = self.voteAverage;
    }
    
    return copy;
}


@end
