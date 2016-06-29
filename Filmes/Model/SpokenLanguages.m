//
//  SpokenLanguages.m
//
//  Created by Thiago Santos on 29/06/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "SpokenLanguages.h"


NSString *const kSpokenLanguagesName = @"name";
NSString *const kSpokenLanguagesIso6391 = @"iso_639_1";


@interface SpokenLanguages ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SpokenLanguages

@synthesize name = _name;
@synthesize iso6391 = _iso6391;


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
            self.name = [self objectOrNilForKey:kSpokenLanguagesName fromDictionary:dict];
            self.iso6391 = [self objectOrNilForKey:kSpokenLanguagesIso6391 fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.name forKey:kSpokenLanguagesName];
    [mutableDict setValue:self.iso6391 forKey:kSpokenLanguagesIso6391];

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

    self.name = [aDecoder decodeObjectForKey:kSpokenLanguagesName];
    self.iso6391 = [aDecoder decodeObjectForKey:kSpokenLanguagesIso6391];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_name forKey:kSpokenLanguagesName];
    [aCoder encodeObject:_iso6391 forKey:kSpokenLanguagesIso6391];
}

- (id)copyWithZone:(NSZone *)zone
{
    SpokenLanguages *copy = [[SpokenLanguages alloc] init];
    
    if (copy) {

        copy.name = [self.name copyWithZone:zone];
        copy.iso6391 = [self.iso6391 copyWithZone:zone];
    }
    
    return copy;
}


@end
