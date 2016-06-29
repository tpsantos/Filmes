//
//  SynopsisCell.h
//  Filmes
//
//  Created by Thiago Santos on 29/06/16.
//  Copyright © 2016 Thiago Santos. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SynopsisCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *lblSynopsis;

- (void)updateCellWithSynopsis:(NSString *)synopsis;

@end
