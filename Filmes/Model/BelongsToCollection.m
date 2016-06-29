//
//  BelongsToCollection.m
//
//  Created by Thiago Santos on 29/06/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "BelongsToCollection.h"


NSString *const kBelongsToCollectionBackdropPath = @"backdrop_path";
NSString *const kBelongsToCollectionId = @"id";
NSString *const kBelongsToCollectionName = @"name";
NSString *const kBelongsToCollectionPosterPath = @"poster_path";


@interface BelongsToCollection ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation BelongsToCollection

@synthesize backdropPath = _backdropPath;
@synthesize belongsToCollectionIdentifier = _belongsToCollectionIdentifier;
@synthesize name = _name;
@synthesize posterPath = _posterPath;


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
            self.backdropPath = [self objectOrNilForKey:kBelongsToCollectionBackdropPath fromDictionary:dict];
            self.belongsToCollectionIdentifier = [[self objectOrNilForKey:kBelongsToCollectionId fromDictionary:dict] doubleValue];
            self.name = [self objectOrNilForKey:kBelongsToCollectionName fromDictionary:dict];
            self.posterPath = [self objectOrNilForKey:kBelongsToCollectionPosterPath fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.backdropPath forKey:kBelongsToCollectionBackdropPath];
    [mutableDict setValue:[NSNumber numberWithDouble:self.belongsToCollectionIdentifier] forKey:kBelongsToCollectionId];
    [mutableDict setValue:self.name forKey:kBelongsToCollectionName];
    [mutableDict setValue:self.posterPath forKey:kBelongsToCollectionPosterPath];

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

    self.backdropPath = [aDecoder decodeObjectForKey:kBelongsToCollectionBackdropPath];
    self.belongsToCollectionIdentifier = [aDecoder decodeDoubleForKey:kBelongsToCollectionId];
    self.name = [aDecoder decodeObjectForKey:kBelongsToCollectionName];
    self.posterPath = [aDecoder decodeObjectForKey:kBelongsToCollectionPosterPath];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_backdropPath forKey:kBelongsToCollectionBackdropPath];
    [aCoder encodeDouble:_belongsToCollectionIdentifier forKey:kBelongsToCollectionId];
    [aCoder encodeObject:_name forKey:kBelongsToCollectionName];
    [aCoder encodeObject:_posterPath forKey:kBelongsToCollectionPosterPath];
}

- (id)copyWithZone:(NSZone *)zone
{
    BelongsToCollection *copy = [[BelongsToCollection alloc] init];
    
    if (copy) {

        copy.backdropPath = [self.backdropPath copyWithZone:zone];
        copy.belongsToCollectionIdentifier = self.belongsToCollectionIdentifier;
        copy.name = [self.name copyWithZone:zone];
        copy.posterPath = [self.posterPath copyWithZone:zone];
    }
    
    return copy;
}


@end
