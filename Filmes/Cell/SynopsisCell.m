//
//  SynopsisCell.m
//  Filmes
//
//  Created by Thiago Santos on 29/06/16.
//  Copyright © 2016 Thiago Santos. All rights reserved.
//

#import "SynopsisCell.h"

@implementation SynopsisCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)layoutSubviews{
    
    [super layoutSubviews];
    
    [self.contentView updateConstraintsIfNeeded];
    [self.contentView layoutIfNeeded];
    
    self.lblSynopsis.preferredMaxLayoutWidth = CGRectGetWidth(self.lblSynopsis.frame);
    [self.lblSynopsis layoutIfNeeded];
}

- (void)updateCellWithSynopsis:(NSString *)synopsis{
    
    [self.lblSynopsis setText:synopsis];
    
    CGRect rect = [synopsis boundingRectWithSize:CGSizeMake(self.frame.size.width-20, 0)
                                                          options:NSStringDrawingUsesLineFragmentOrigin
                                                       attributes:@{NSFontAttributeName:[UIFont fontWithName:@"Helvetica" size:15]}
                                                          context:nil];
    
    for (NSLayoutConstraint *con in self.lblSynopsis.constraints) {
        if (con.firstAttribute == NSLayoutAttributeHeight) {
            con.constant = rect.size.height;
            [self.lblSynopsis layoutIfNeeded];
        }
    }
}

@end
