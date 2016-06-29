//
//  BelongsToCollection.h
//
//  Created by Thiago Santos on 29/06/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface BelongsToCollection : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *backdropPath;
@property (nonatomic, assign) double belongsToCollectionIdentifier;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *posterPath;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
