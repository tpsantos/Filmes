//
//  ProductionCountries.m
//
//  Created by Thiago Santos on 29/06/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ProductionCountries.h"


NSString *const kProductionCountriesName = @"name";
NSString *const kProductionCountriesIso31661 = @"iso_3166_1";


@interface ProductionCountries ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ProductionCountries

@synthesize name = _name;
@synthesize iso31661 = _iso31661;


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
            self.name = [self objectOrNilForKey:kProductionCountriesName fromDictionary:dict];
            self.iso31661 = [self objectOrNilForKey:kProductionCountriesIso31661 fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.name forKey:kProductionCountriesName];
    [mutableDict setValue:self.iso31661 forKey:kProductionCountriesIso31661];

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

    self.name = [aDecoder decodeObjectForKey:kProductionCountriesName];
    self.iso31661 = [aDecoder decodeObjectForKey:kProductionCountriesIso31661];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_name forKey:kProductionCountriesName];
    [aCoder encodeObject:_iso31661 forKey:kProductionCountriesIso31661];
}

- (id)copyWithZone:(NSZone *)zone
{
    ProductionCountries *copy = [[ProductionCountries alloc] init];
    
    if (copy) {

        copy.name = [self.name copyWithZone:zone];
        copy.iso31661 = [self.iso31661 copyWithZone:zone];
    }
    
    return copy;
}


@end
