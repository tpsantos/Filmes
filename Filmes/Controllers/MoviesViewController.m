//
//  MoviesViewController.m
//  Filmes
//
//  Created by Thiago Santos on 28/06/16.
//  Copyright © 2016 Thiago Santos. All rights reserved.
//

#import "MoviesViewController.h"
#import "MovieDetailViewController.h"
#import "MovieCell.h"
#import "MovieConnection.h"
#import "Movies.h"
#import <MBProgressHUD/MBProgressHUD.h>

#define URL_MOVIES @"https://api.themoviedb.org/3/movie/popular?api_key=faf9b59fe2191bb669cd11a5f1f460c7"

@interface MoviesViewController ()

@end

@implementation MoviesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"PopMovies";
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"MovieCell" bundle:nil] forCellWithReuseIdentifier:@"MovieCell"];
    
    [self downloadMovies];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Connection

- (void)downloadMovies{
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    [MovieConnection downloadMovieWithUrl:[NSURL URLWithString:URL_MOVIES] callback:^(BOOL success, NSInteger code, id result) {
        
        if (success) {
            
            self.items = [result valueForKey:@"results"];
            [self.collectionView reloadData];
            
        }else{
            
            // Error
            
            UIAlertController * alert = [UIAlertController
                                         alertControllerWithTitle:@"Filmes"
                                         message:@"Não foi possivel carregar os filmes"
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
    
    if ([segue.identifier isEqualToString:@"showDetail"]) {
        
        if ([self.collectionView indexPathsForSelectedItems].count != 0) {
            NSIndexPath *index = [[self.collectionView indexPathsForSelectedItems] objectAtIndex:0];
            MovieDetailViewController *movieDetailVC = (MovieDetailViewController *)segue.destinationViewController;
            Movies *movie = [Movies modelObjectWithDictionary:[self.items objectAtIndex:index.row]];
            NSString *movieID = [NSString stringWithFormat:@"%i", (int)movie.resultsIdentifier];
            [movieDetailVC downloadDetailWithMovieID:movieID];
        }
    }
}

#pragma mark - UICollectionView Delegates/DataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.items.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    static NSString *const CellIdentifier = @"MovieCell";
    __weak MovieCell *movieCell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    
    Movies *movie = [Movies modelObjectWithDictionary:[self.items objectAtIndex:indexPath.row]];
    [movieCell updateCellWithMovie:movie];
    
    return movieCell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return CGSizeMake((self.view.frame.size.width-30)/2, 220);
}

@end
