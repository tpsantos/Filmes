//
//  SiteViewController.h
//  Filmes
//
//  Created by Thiago Santos on 29/06/16.
//  Copyright © 2016 Thiago Santos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface SiteViewController : BaseViewController

@property (nonatomic, weak) IBOutlet UIWebView *webview;
@property (nonatomic, strong) NSString *url;

@end
