//
//  MovieDetailView.m
//  Filmes
//
//  Created by Thiago Santos on 28/06/16.
//  Copyright © 2016 Thiago Santos. All rights reserved.
//

#import "MovieDetailView.h"
#import <SDWebImage/UIImageView+WebCache.h>

@implementation MovieDetailView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code

    }
    
    return self;
}

- (void)updateHeaderViewWithMovieDetail:(MovieDetail *)movieDetail{
    
    // Thumb
    NSString *urlImage = [self getImageUrlWithPath:movieDetail.belongsToCollection.posterPath];
    [self.thumb sd_setImageWithURL:[NSURL URLWithString:urlImage] placeholderImage:nil];
    
    // Year
    NSString *year = [self formatDate:movieDetail.releaseDate];
    [self.lblYear setText:year];
    
    // Genres
    NSString *genres = [self getGenreWithArray:movieDetail.genres];
    [self.lblType setText:genres];
    
    // Name
    NSString *name = movieDetail.originalTitle;
    [self.lblName setText:name];
    
    // Time
    NSString *time = [NSString stringWithFormat:@"%i min", (int)movieDetail.runtime];
    [self.lblTime setText:time];
}

- (NSString *)getImageUrlWithPath:(NSString *)path{
    
    NSString *urlString = @"";
    if (path.length != 0) {
        urlString = [NSString stringWithFormat:@"http://image.tmdb.org/t/p/w185%@", path];
    }
    return urlString;
}

- (NSString *)formatDate:(NSString *)dateString{
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *date = [dateFormatter dateFromString:dateString];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSString *year = [NSString stringWithFormat:@"%li", (long)[calendar component:NSCalendarUnitYear fromDate:date]];
    return year;
}

- (NSString *)getGenreWithArray:(NSArray *)array{
    
    NSString *genres = @"";
    if (array.count != 0) {
        genres = [NSString stringWithFormat:@"%@", [[array objectAtIndex:0] valueForKey:@"name"]];
    }
    return genres;
}

@end
