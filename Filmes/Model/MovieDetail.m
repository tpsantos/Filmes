//
//  MovieDetail.m
//
//  Created by Thiago Santos on 29/06/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "MovieDetail.h"
#import "BelongsToCollection.h"
#import "ProductionCountries.h"
#import "Genres.h"
#import "ProductionCompanies.h"
#import "SpokenLanguages.h"


NSString *const kBaseClassRuntime = @"runtime";
NSString *const kBaseClassStatus = @"status";
NSString *const kBaseClassBackdropPath = @"backdrop_path";
NSString *const kBaseClassTitle = @"title";
NSString *const kBaseClassOverview = @"overview";
NSString *const kBaseClassVoteCount = @"vote_count";
NSString *const kBaseClassTagline = @"tagline";
NSString *const kBaseClassBelongsToCollection = @"belongs_to_collection";
NSString *const kBaseClassOriginalTitle = @"original_title";
NSString *const kBaseClassPosterPath = @"poster_path";
NSString *const kBaseClassOriginalLanguage = @"original_language";
NSString *const kBaseClassRevenue = @"revenue";
NSString *const kBaseClassProductionCountries = @"production_countries";
NSString *const kBaseClassHomepage = @"homepage";
NSString *const kBaseClassVideo = @"video";
NSString *const kBaseClassImdbId = @"imdb_id";
NSString *const kBaseClassId = @"id";
NSString *const kBaseClassReleaseDate = @"release_date";
NSString *const kBaseClassBudget = @"budget";
NSString *const kBaseClassPopularity = @"popularity";
NSString *const kBaseClassGenres = @"genres";
NSString *const kBaseClassProductionCompanies = @"production_companies";
NSString *const kBaseClassAdult = @"adult";
NSString *const kBaseClassSpokenLanguages = @"spoken_languages";
NSString *const kBaseClassVoteAverage = @"vote_average";


@interface MovieDetail ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MovieDetail

@synthesize runtime = _runtime;
@synthesize status = _status;
@synthesize backdropPath = _backdropPath;
@synthesize title = _title;
@synthesize overview = _overview;
@synthesize voteCount = _voteCount;
@synthesize tagline = _tagline;
@synthesize belongsToCollection = _belongsToCollection;
@synthesize originalTitle = _originalTitle;
@synthesize posterPath = _posterPath;
@synthesize originalLanguage = _originalLanguage;
@synthesize revenue = _revenue;
@synthesize productionCountries = _productionCountries;
@synthesize homepage = _homepage;
@synthesize video = _video;
@synthesize imdbId = _imdbId;
@synthesize internalBaseClassIdentifier = _internalBaseClassIdentifier;
@synthesize releaseDate = _releaseDate;
@synthesize budget = _budget;
@synthesize popularity = _popularity;
@synthesize genres = _genres;
@synthesize productionCompanies = _productionCompanies;
@synthesize adult = _adult;
@synthesize spokenLanguages = _spokenLanguages;
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
            self.runtime = [[self objectOrNilForKey:kBaseClassRuntime fromDictionary:dict] doubleValue];
            self.status = [self objectOrNilForKey:kBaseClassStatus fromDictionary:dict];
            self.backdropPath = [self objectOrNilForKey:kBaseClassBackdropPath fromDictionary:dict];
            self.title = [self objectOrNilForKey:kBaseClassTitle fromDictionary:dict];
            self.overview = [self objectOrNilForKey:kBaseClassOverview fromDictionary:dict];
            self.voteCount = [[self objectOrNilForKey:kBaseClassVoteCount fromDictionary:dict] doubleValue];
            self.tagline = [self objectOrNilForKey:kBaseClassTagline fromDictionary:dict];
            self.belongsToCollection = [BelongsToCollection modelObjectWithDictionary:[dict objectForKey:kBaseClassBelongsToCollection]];
            self.originalTitle = [self objectOrNilForKey:kBaseClassOriginalTitle fromDictionary:dict];
            self.posterPath = [self objectOrNilForKey:kBaseClassPosterPath fromDictionary:dict];
            self.originalLanguage = [self objectOrNilForKey:kBaseClassOriginalLanguage fromDictionary:dict];
            self.revenue = [[self objectOrNilForKey:kBaseClassRevenue fromDictionary:dict] doubleValue];
    NSObject *receivedProductionCountries = [dict objectForKey:kBaseClassProductionCountries];
    NSMutableArray *parsedProductionCountries = [NSMutableArray array];
    if ([receivedProductionCountries isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedProductionCountries) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedProductionCountries addObject:[ProductionCountries modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedProductionCountries isKindOfClass:[NSDictionary class]]) {
       [parsedProductionCountries addObject:[ProductionCountries modelObjectWithDictionary:(NSDictionary *)receivedProductionCountries]];
    }

    self.productionCountries = [NSArray arrayWithArray:parsedProductionCountries];
            self.homepage = [self objectOrNilForKey:kBaseClassHomepage fromDictionary:dict];
            self.video = [[self objectOrNilForKey:kBaseClassVideo fromDictionary:dict] boolValue];
            self.imdbId = [self objectOrNilForKey:kBaseClassImdbId fromDictionary:dict];
            self.internalBaseClassIdentifier = [[self objectOrNilForKey:kBaseClassId fromDictionary:dict] doubleValue];
            self.releaseDate = [self objectOrNilForKey:kBaseClassReleaseDate fromDictionary:dict];
            self.budget = [[self objectOrNilForKey:kBaseClassBudget fromDictionary:dict] doubleValue];
            self.popularity = [[self objectOrNilForKey:kBaseClassPopularity fromDictionary:dict] doubleValue];
    NSObject *receivedGenres = [dict objectForKey:kBaseClassGenres];
    NSMutableArray *parsedGenres = [NSMutableArray array];
    if ([receivedGenres isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedGenres) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedGenres addObject:[Genres modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedGenres isKindOfClass:[NSDictionary class]]) {
       [parsedGenres addObject:[Genres modelObjectWithDictionary:(NSDictionary *)receivedGenres]];
    }

    self.genres = [NSArray arrayWithArray:parsedGenres];
    NSObject *receivedProductionCompanies = [dict objectForKey:kBaseClassProductionCompanies];
    NSMutableArray *parsedProductionCompanies = [NSMutableArray array];
    if ([receivedProductionCompanies isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedProductionCompanies) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedProductionCompanies addObject:[ProductionCompanies modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedProductionCompanies isKindOfClass:[NSDictionary class]]) {
       [parsedProductionCompanies addObject:[ProductionCompanies modelObjectWithDictionary:(NSDictionary *)receivedProductionCompanies]];
    }

    self.productionCompanies = [NSArray arrayWithArray:parsedProductionCompanies];
            self.adult = [[self objectOrNilForKey:kBaseClassAdult fromDictionary:dict] boolValue];
    NSObject *receivedSpokenLanguages = [dict objectForKey:kBaseClassSpokenLanguages];
    NSMutableArray *parsedSpokenLanguages = [NSMutableArray array];
    if ([receivedSpokenLanguages isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedSpokenLanguages) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedSpokenLanguages addObject:[SpokenLanguages modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedSpokenLanguages isKindOfClass:[NSDictionary class]]) {
       [parsedSpokenLanguages addObject:[SpokenLanguages modelObjectWithDictionary:(NSDictionary *)receivedSpokenLanguages]];
    }

    self.spokenLanguages = [NSArray arrayWithArray:parsedSpokenLanguages];
            self.voteAverage = [[self objectOrNilForKey:kBaseClassVoteAverage fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.runtime] forKey:kBaseClassRuntime];
    [mutableDict setValue:self.status forKey:kBaseClassStatus];
    [mutableDict setValue:self.backdropPath forKey:kBaseClassBackdropPath];
    [mutableDict setValue:self.title forKey:kBaseClassTitle];
    [mutableDict setValue:self.overview forKey:kBaseClassOverview];
    [mutableDict setValue:[NSNumber numberWithDouble:self.voteCount] forKey:kBaseClassVoteCount];
    [mutableDict setValue:self.tagline forKey:kBaseClassTagline];
    [mutableDict setValue:[self.belongsToCollection dictionaryRepresentation] forKey:kBaseClassBelongsToCollection];
    [mutableDict setValue:self.originalTitle forKey:kBaseClassOriginalTitle];
    [mutableDict setValue:self.posterPath forKey:kBaseClassPosterPath];
    [mutableDict setValue:self.originalLanguage forKey:kBaseClassOriginalLanguage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.revenue] forKey:kBaseClassRevenue];
    NSMutableArray *tempArrayForProductionCountries = [NSMutableArray array];
    for (NSObject *subArrayObject in self.productionCountries) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForProductionCountries addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForProductionCountries addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForProductionCountries] forKey:kBaseClassProductionCountries];
    [mutableDict setValue:self.homepage forKey:kBaseClassHomepage];
    [mutableDict setValue:[NSNumber numberWithBool:self.video] forKey:kBaseClassVideo];
    [mutableDict setValue:self.imdbId forKey:kBaseClassImdbId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.internalBaseClassIdentifier] forKey:kBaseClassId];
    [mutableDict setValue:self.releaseDate forKey:kBaseClassReleaseDate];
    [mutableDict setValue:[NSNumber numberWithDouble:self.budget] forKey:kBaseClassBudget];
    [mutableDict setValue:[NSNumber numberWithDouble:self.popularity] forKey:kBaseClassPopularity];
    NSMutableArray *tempArrayForGenres = [NSMutableArray array];
    for (NSObject *subArrayObject in self.genres) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForGenres addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForGenres addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForGenres] forKey:kBaseClassGenres];
    NSMutableArray *tempArrayForProductionCompanies = [NSMutableArray array];
    for (NSObject *subArrayObject in self.productionCompanies) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForProductionCompanies addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForProductionCompanies addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForProductionCompanies] forKey:kBaseClassProductionCompanies];
    [mutableDict setValue:[NSNumber numberWithBool:self.adult] forKey:kBaseClassAdult];
    NSMutableArray *tempArrayForSpokenLanguages = [NSMutableArray array];
    for (NSObject *subArrayObject in self.spokenLanguages) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForSpokenLanguages addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForSpokenLanguages addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForSpokenLanguages] forKey:kBaseClassSpokenLanguages];
    [mutableDict setValue:[NSNumber numberWithDouble:self.voteAverage] forKey:kBaseClassVoteAverage];

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

    self.runtime = [aDecoder decodeDoubleForKey:kBaseClassRuntime];
    self.status = [aDecoder decodeObjectForKey:kBaseClassStatus];
    self.backdropPath = [aDecoder decodeObjectForKey:kBaseClassBackdropPath];
    self.title = [aDecoder decodeObjectForKey:kBaseClassTitle];
    self.overview = [aDecoder decodeObjectForKey:kBaseClassOverview];
    self.voteCount = [aDecoder decodeDoubleForKey:kBaseClassVoteCount];
    self.tagline = [aDecoder decodeObjectForKey:kBaseClassTagline];
    self.belongsToCollection = [aDecoder decodeObjectForKey:kBaseClassBelongsToCollection];
    self.originalTitle = [aDecoder decodeObjectForKey:kBaseClassOriginalTitle];
    self.posterPath = [aDecoder decodeObjectForKey:kBaseClassPosterPath];
    self.originalLanguage = [aDecoder decodeObjectForKey:kBaseClassOriginalLanguage];
    self.revenue = [aDecoder decodeDoubleForKey:kBaseClassRevenue];
    self.productionCountries = [aDecoder decodeObjectForKey:kBaseClassProductionCountries];
    self.homepage = [aDecoder decodeObjectForKey:kBaseClassHomepage];
    self.video = [aDecoder decodeBoolForKey:kBaseClassVideo];
    self.imdbId = [aDecoder decodeObjectForKey:kBaseClassImdbId];
    self.internalBaseClassIdentifier = [aDecoder decodeDoubleForKey:kBaseClassId];
    self.releaseDate = [aDecoder decodeObjectForKey:kBaseClassReleaseDate];
    self.budget = [aDecoder decodeDoubleForKey:kBaseClassBudget];
    self.popularity = [aDecoder decodeDoubleForKey:kBaseClassPopularity];
    self.genres = [aDecoder decodeObjectForKey:kBaseClassGenres];
    self.productionCompanies = [aDecoder decodeObjectForKey:kBaseClassProductionCompanies];
    self.adult = [aDecoder decodeBoolForKey:kBaseClassAdult];
    self.spokenLanguages = [aDecoder decodeObjectForKey:kBaseClassSpokenLanguages];
    self.voteAverage = [aDecoder decodeDoubleForKey:kBaseClassVoteAverage];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_runtime forKey:kBaseClassRuntime];
    [aCoder encodeObject:_status forKey:kBaseClassStatus];
    [aCoder encodeObject:_backdropPath forKey:kBaseClassBackdropPath];
    [aCoder encodeObject:_title forKey:kBaseClassTitle];
    [aCoder encodeObject:_overview forKey:kBaseClassOverview];
    [aCoder encodeDouble:_voteCount forKey:kBaseClassVoteCount];
    [aCoder encodeObject:_tagline forKey:kBaseClassTagline];
    [aCoder encodeObject:_belongsToCollection forKey:kBaseClassBelongsToCollection];
    [aCoder encodeObject:_originalTitle forKey:kBaseClassOriginalTitle];
    [aCoder encodeObject:_posterPath forKey:kBaseClassPosterPath];
    [aCoder encodeObject:_originalLanguage forKey:kBaseClassOriginalLanguage];
    [aCoder encodeDouble:_revenue forKey:kBaseClassRevenue];
    [aCoder encodeObject:_productionCountries forKey:kBaseClassProductionCountries];
    [aCoder encodeObject:_homepage forKey:kBaseClassHomepage];
    [aCoder encodeBool:_video forKey:kBaseClassVideo];
    [aCoder encodeObject:_imdbId forKey:kBaseClassImdbId];
    [aCoder encodeDouble:_internalBaseClassIdentifier forKey:kBaseClassId];
    [aCoder encodeObject:_releaseDate forKey:kBaseClassReleaseDate];
    [aCoder encodeDouble:_budget forKey:kBaseClassBudget];
    [aCoder encodeDouble:_popularity forKey:kBaseClassPopularity];
    [aCoder encodeObject:_genres forKey:kBaseClassGenres];
    [aCoder encodeObject:_productionCompanies forKey:kBaseClassProductionCompanies];
    [aCoder encodeBool:_adult forKey:kBaseClassAdult];
    [aCoder encodeObject:_spokenLanguages forKey:kBaseClassSpokenLanguages];
    [aCoder encodeDouble:_voteAverage forKey:kBaseClassVoteAverage];
}

- (id)copyWithZone:(NSZone *)zone
{
    MovieDetail *copy = [[MovieDetail alloc] init];
    
    if (copy) {

        copy.runtime = self.runtime;
        copy.status = [self.status copyWithZone:zone];
        copy.backdropPath = [self.backdropPath copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.overview = [self.overview copyWithZone:zone];
        copy.voteCount = self.voteCount;
        copy.tagline = [self.tagline copyWithZone:zone];
        copy.belongsToCollection = [self.belongsToCollection copyWithZone:zone];
        copy.originalTitle = [self.originalTitle copyWithZone:zone];
        copy.posterPath = [self.posterPath copyWithZone:zone];
        copy.originalLanguage = [self.originalLanguage copyWithZone:zone];
        copy.revenue = self.revenue;
        copy.productionCountries = [self.productionCountries copyWithZone:zone];
        copy.homepage = [self.homepage copyWithZone:zone];
        copy.video = self.video;
        copy.imdbId = [self.imdbId copyWithZone:zone];
        copy.internalBaseClassIdentifier = self.internalBaseClassIdentifier;
        copy.releaseDate = [self.releaseDate copyWithZone:zone];
        copy.budget = self.budget;
        copy.popularity = self.popularity;
        copy.genres = [self.genres copyWithZone:zone];
        copy.productionCompanies = [self.productionCompanies copyWithZone:zone];
        copy.adult = self.adult;
        copy.spokenLanguages = [self.spokenLanguages copyWithZone:zone];
        copy.voteAverage = self.voteAverage;
    }
    
    return copy;
}


@end
