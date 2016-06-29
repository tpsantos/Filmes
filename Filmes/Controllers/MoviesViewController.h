//
//  MoviesViewController.h
//  Filmes
//
//  Created by Thiago Santos on 28/06/16.
//  Copyright © 2016 Thiago Santos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface MoviesViewController : BaseViewController

@property (nonatomic, weak) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) NSArray *items;

@end
