//
//  ProductionCompanies.m
//
//  Created by Thiago Santos on 29/06/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ProductionCompanies.h"


NSString *const kProductionCompaniesName = @"name";
NSString *const kProductionCompaniesId = @"id";


@interface ProductionCompanies ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ProductionCompanies

@synthesize name = _name;
@synthesize productionCompaniesIdentifier = _productionCompaniesIdentifier;


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
            self.name = [self objectOrNilForKey:kProductionCompaniesName fromDictionary:dict];
            self.productionCompaniesIdentifier = [[self objectOrNilForKey:kProductionCompaniesId fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.name forKey:kProductionCompaniesName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.productionCompaniesIdentifier] forKey:kProductionCompaniesId];

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

    self.name = [aDecoder decodeObjectForKey:kProductionCompaniesName];
    self.productionCompaniesIdentifier = [aDecoder decodeDoubleForKey:kProductionCompaniesId];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_name forKey:kProductionCompaniesName];
    [aCoder encodeDouble:_productionCompaniesIdentifier forKey:kProductionCompaniesId];
}

- (id)copyWithZone:(NSZone *)zone
{
    ProductionCompanies *copy = [[ProductionCompanies alloc] init];
    
    if (copy) {

        copy.name = [self.name copyWithZone:zone];
        copy.productionCompaniesIdentifier = self.productionCompaniesIdentifier;
    }
    
    return copy;
}


@end
