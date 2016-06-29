//
//  MovieDetailViewController.h
//  Filmes
//
//  Created by Thiago Santos on 28/06/16.
//  Copyright © 2016 Thiago Santos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "MovieDetailView.h"
#import "MovieDetail.h"

@interface MovieDetailViewController : BaseViewController

@property (nonatomic, weak) IBOutlet UITableView *tableview;
@property (nonatomic, weak) IBOutlet MovieDetailView *movieHeaderView;
@property (nonatomic, strong) MovieDetail *movieDetail;

- (void)downloadDetailWithMovieID:(NSString *)movieID;

@end
