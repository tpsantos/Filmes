//
//  MovieCell.h
//  Filmes
//
//  Created by Thiago Santos on 28/06/16.
//  Copyright © 2016 Thiago Santos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Movies.h"

@interface MovieCell : UICollectionViewCell

@property (nonatomic, weak) IBOutlet UIImageView *thumb;
@property (nonatomic, weak) IBOutlet UILabel *lblVote;

- (void)updateCellWithMovie:(Movies *)movie;

@end
