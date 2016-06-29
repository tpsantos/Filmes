//
//  Genres.m
//
//  Created by Thiago Santos on 29/06/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "Genres.h"


NSString *const kGenresId = @"id";
NSString *const kGenresName = @"name";


@interface Genres ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Genres

@synthesize genresIdentifier = _genresIdentifier;
@synthesize name = _name;


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
            self.genresIdentifier = [[self objectOrNilForKey:kGenresId fromDictionary:dict] doubleValue];
            self.name = [self objectOrNilForKey:kGenresName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.genresIdentifier] forKey:kGenresId];
    [mutableDict setValue:self.name forKey:kGenresName];

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

    self.genresIdentifier = [aDecoder decodeDoubleForKey:kGenresId];
    self.name = [aDecoder decodeObjectForKey:kGenresName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_genresIdentifier forKey:kGenresId];
    [aCoder encodeObject:_name forKey:kGenresName];
}

- (id)copyWithZone:(NSZone *)zone
{
    Genres *copy = [[Genres alloc] init];
    
    if (copy) {

        copy.genresIdentifier = self.genresIdentifier;
        copy.name = [self.name copyWithZone:zone];
    }
    
    return copy;
}


@end
