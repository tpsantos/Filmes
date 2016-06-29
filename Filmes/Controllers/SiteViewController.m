//
//  SiteViewController.m
//  Filmes
//
//  Created by Thiago Santos on 29/06/16.
//  Copyright © 2016 Thiago Santos. All rights reserved.
//

#import "SiteViewController.h"
#import <MBProgressHUD/MBProgressHUD.h>

@interface SiteViewController () <UIWebViewDelegate>

@end

@implementation SiteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSURL *urlMovie = [NSURL URLWithString:self.url];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:urlMovie];
    [self.webview loadRequest:urlRequest];
    [self.webview setDelegate:self];
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
