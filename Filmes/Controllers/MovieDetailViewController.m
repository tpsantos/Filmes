//
//  MovieDetailViewController.m
//  Filmes
//
//  Created by Thiago Santos on 28/06/16.
//  Copyright © 2016 Thiago Santos. All rights reserved.
//

#import "MovieDetailViewController.h"
#import "SiteViewController.h"
#import "MovieConnection.h"
#import "SynopsisCell.h"
#import <MBProgressHUD/MBProgressHUD.h>

#define URL_MOVIE_DETAIL @"https://api.themoviedb.org/3/movie/%@?api_key=faf9b59fe2191bb669cd11a5f1f460c7"

@interface MovieDetailViewController ()

@end

@implementation MovieDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tableview.hidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Connection

- (void)downloadDetailWithMovieID:(NSString *)movieID{
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    [MovieConnection downloadMovieWithUrl:[NSURL URLWithString:[NSString stringWithFormat:URL_MOVIE_DETAIL, movieID]]
                                 callback:^(BOOL success, NSInteger code, id result) {
        
        if (success) {
            
            self.movieDetail = [MovieDetail modelObjectWithDictionary:result];
            
            self.title = self.movieDetail.originalTitle;
            
            [self.movieHeaderView updateHeaderViewWithMovieDetail:self.movieDetail];
            self.tableview.hidden = NO;
            [self.tableview reloadData];
            
        }else{
            
            // Error
            
            UIAlertController * alert = [UIAlertController
                                         alertControllerWithTitle:@"Filmes"
                                         message:@"Não foi possivel carregar o filme"
                                         preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction* yesButton = [UIAlertAction
                                        actionWithTitle:@"OK"
                                        style:UIAlertActionStyleDefault
                                        handler:nil];
            
            UIAlertAction* noButton = [UIAlertAction
                                       actionWithTitle:@"Cancelar"
                                       style:UIAlertActionStyleDefault
                                       handler:nil];
            
            [alert addAction:noButton];
            [alert addAction:yesButton];
            
            [self presentViewController:alert animated:YES completion:nil];
        }
                                     
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        
    }];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    if ([segue.identifier isEqualToString:@"showWebview"]) {
        
        SiteViewController *siteVC = (SiteViewController *)segue.destinationViewController;
        siteVC.url = self.movieDetail.homepage;
        siteVC.title = self.movieDetail.originalTitle;
    }
}

#pragma mark - Methods - UITableView DataSource/Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CGRect rect = [self.movieDetail.overview boundingRectWithSize:CGSizeMake(self.tableview.frame.size.width-20, 0)
                                  options:NSStringDrawingUsesLineFragmentOrigin
                               attributes:@{NSFontAttributeName:[UIFont fontWithName:@"Helvetica" size:15]}
                                  context:nil];
    
    if (indexPath.row == 0) {
        
        return rect.size.height+23;
        
    }else{
        
        return 50;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    SynopsisCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SynopsisCell" forIndexPath:indexPath];

    if (indexPath.row == 0) {
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell updateCellWithSynopsis:self.movieDetail.overview];
        
    }else{
        
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        [cell.lblSynopsis setText:@"Ver mais"];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 1) {
        
        [self performSegueWithIdentifier:@"showWebview" sender:self];
    }
}

@end
