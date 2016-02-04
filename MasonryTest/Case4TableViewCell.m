//
//  Case4TableViewCell.m
//  MasonryTest
//
//  Created by baidu on 15/12/3.
//  Copyright © 2015年 com.MyCompany. All rights reserved.
//

#import "Case4TableViewCell.h"
#import "Masonry.h"

#define kPadding    4.0
#define kMargin     4.0

@interface Case4TableViewCell ()

@property (strong, nonatomic) UIImageView *avatarImageView;
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UILabel *contentLabel;

@end

@implementation Case4TableViewCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupView];
    }
    return self;
}


-(void)setupView {
    
    _avatarImageView = [[UIImageView alloc]init];
    [self.contentView addSubview:_avatarImageView];
    [_avatarImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(kPadding);
        make.top.equalTo(self.contentView).offset(kPadding);
        make.size.mas_equalTo(CGSizeMake(50, 50));
        make.bottom.lessThanOrEqualTo(self.contentView.mas_bottom);//保证cell能装下image
    }];
    
    _titleLabel = [[UILabel alloc]init];
    _titleLabel.font = [UIFont systemFontOfSize:14.0];
    _titleLabel.numberOfLines = 1;
    [self.contentView addSubview:_titleLabel];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_avatarImageView.mas_right).offset(kMargin);
        make.right.equalTo(self.contentView).offset(-kPadding);
        make.top.equalTo(self.contentView).offset(kPadding);
        make.height.mas_equalTo(14.0);
    }];
    
    
    _contentLabel = [[UILabel alloc]init];
    _contentLabel.numberOfLines = 0;
    _contentLabel.font = [UIFont systemFontOfSize:12.0];
    [self.contentView addSubview:_contentLabel];
    [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_titleLabel);
        make.top.equalTo(_titleLabel.mas_bottom).offset(kMargin);
        make.right.equalTo(_titleLabel);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-kPadding);
    }];
    [_contentLabel setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
    //***由于在计算高度前向cell的contentView加了一条和table view宽度相同的宽度约束，故这里不需要手动计算了，爽！
    //_contentLabel.preferredMaxLayoutWidth = [UIScreen mainScreen].bounds.size.width - kPadding*2 - kMargin - 50;
    
    
}


- (void)setupData:(Case4Entity *)dataEntity {
    if (_avatarImageView) {
        _avatarImageView.image = [UIImage imageNamed:dataEntity.imageName];
    }
    
    if (_titleLabel) {
        _titleLabel.text = dataEntity.title;
    }
    
    if (_contentLabel) {
        _contentLabel.text = dataEntity.content;
    }
}

@end










































