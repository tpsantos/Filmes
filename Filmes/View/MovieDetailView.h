//
//  MovieDetailView.h
//  Filmes
//
//  Created by Thiago Santos on 28/06/16.
//  Copyright © 2016 Thiago Santos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieDetail.h"
#import "BelongsToCollection.h"

@interface MovieDetailView : UIView

@property (nonatomic, weak) IBOutlet UIImageView *thumb;
@property (nonatomic, weak) IBOutlet UILabel *lblYear;
@property (nonatomic, weak) IBOutlet UILabel *lblName;
@property (nonatomic, weak) IBOutlet UILabel *lblType;
@property (nonatomic, weak) IBOutlet UILabel *lblTime;

- (void)updateHeaderViewWithMovieDetail:(MovieDetail *)movieDetail;
- (NSString *)getImageUrlWithPath:(NSString *)path;
- (NSString *)formatDate:(NSString *)dateString;
- (NSString *)getGenreWithArray:(NSArray *)array;

@end
