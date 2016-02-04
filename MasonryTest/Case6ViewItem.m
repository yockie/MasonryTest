//
//  Case6ViewItem.m
//  MasonryTest
//
//  Created by baidu on 15/12/4.
//  Copyright © 2015年 com.MyCompany. All rights reserved.
//

#import "Case6ViewItem.h"
#import "Masonry.h"

@interface Case6ViewItem ()

@property (strong, nonatomic)UIImage *image;
@property (strong, nonatomic)NSString *text;
@property (strong, nonatomic)UIImageView *baseLineView;

@end

@implementation Case6ViewItem

+(Case6ViewItem *)initWithImage:(UIImage *)image andText:(NSString *)text {
    Case6ViewItem * viewItem = [[Case6ViewItem alloc]init];
    viewItem.image = image;
    viewItem.text = text;
    
    [viewItem setupView];
    
    return viewItem;
}


-(void)setupView {
    self.backgroundColor = [UIColor lightGrayColor];
    
    UIImageView *imageView = [[UIImageView alloc]initWithImage:_image];
    [self addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(4);
        make.top.equalTo(self).offset(4);
        make.right.equalTo(self).offset(-4);
    }];
    [imageView setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
    [imageView setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    _baseLineView = imageView;
    
    
    UILabel *textLabel = [[UILabel alloc]init];
    textLabel.text = _text;
    textLabel.numberOfLines = 0;
    [self addSubview:textLabel];
    [textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(imageView);
        make.top.equalTo(imageView.mas_bottom).offset(4);
        make.bottom.equalTo(self.mas_bottom).offset(-4);
    }];
    [textLabel setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
}

//重写此函数，返回作为baseline的view
-(UIView *)viewForBaselineLayout {
    return _baseLineView;
}

@end
