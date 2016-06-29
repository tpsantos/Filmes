//
//  MovieCell.m
//  Filmes
//
//  Created by Thiago Santos on 28/06/16.
//  Copyright © 2016 Thiago Santos. All rights reserved.
//

#import "MovieCell.h"
#import <SDWebImage/UIImageView+WebCache.h>

@implementation MovieCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)updateCellWithMovie:(Movies *)movie{
    
    if (movie.posterPath) {
        NSString *url = [NSString stringWithFormat:@"http://image.tmdb.org/t/p/w185/%@", movie.posterPath];
        [self.thumb sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:nil];
    }
    
    if (movie.voteAverage && movie.voteAverage > 0) {
        [self.lblVote setHidden:NO];
        [self.lblVote setText:[NSString stringWithFormat:@"%.02f", movie.voteAverage]];
    }
}

@end
