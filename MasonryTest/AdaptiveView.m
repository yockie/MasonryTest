//
//  AdaptiveView.m
//  MasonryTest
//
//  Created by baidu on 15/11/30.
//  Copyright © 2015年 com.MyCompany. All rights reserved.
//

#import "AdaptiveView.h"
#import "Masonry.h"

#define IMAGE_SIZE      40


@interface AdaptiveView ()

@property (nonatomic) NSMutableArray * heightContraints;

@end




@implementation AdaptiveView

-(instancetype)init {
    if (self = [super init]) {
        _heightContraints = [[NSMutableArray alloc]init];
        
        [self setupConstraints];
    }
    return self;
}


//-(void)drawRect:(CGRect)rect {
//    
//}



- (void)setupConstraints {
    
    CGSize switchSize = CGSizeMake(50, 100);
    
    UISwitch *switchView1 = [[UISwitch alloc]init];
    [self addSubview:switchView1];
    switchView1.on = YES;
    switchView1.tag = 0;
    [switchView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(50);
        make.top.equalTo(self);
        make.size.mas_equalTo(switchSize);
    }];
    [switchView1 addTarget:self action:@selector(showOrHideImage:) forControlEvents:UIControlEventValueChanged];
    
    UISwitch *switchView2 = [[UISwitch alloc]init];
    [self addSubview:switchView2];
    switchView2.on = YES;
    switchView2.tag = 1;
    [switchView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(switchView1.mas_right);
        make.top.equalTo(self);
        make.size.mas_equalTo(switchSize);
    }];
    [switchView2 addTarget:self action:@selector(showOrHideImage:) forControlEvents:UIControlEventValueChanged];
    
    UISwitch *switchView3 = [[UISwitch alloc]initWithFrame:CGRectMake(150, 300, 50, 100)];
    [self addSubview:switchView3];
    switchView3.on = YES;
    switchView3.tag = 2;
    [switchView3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(switchView2.mas_right);
        make.top.equalTo(self);
        make.size.mas_equalTo(switchSize);
    }];
    [switchView3 addTarget:self action:@selector(showOrHideImage:) forControlEvents:UIControlEventValueChanged];
    
    UISwitch *switchView4 = [[UISwitch alloc]initWithFrame:CGRectMake(200, 300, 50, 100)];
    [self addSubview:switchView4];
    switchView4.on = YES;
    switchView4.tag = 3;
    [switchView4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(switchView3.mas_right);
        make.top.equalTo(self);
        make.size.mas_equalTo(switchSize);
    }];
    [switchView4 addTarget:self action:@selector(showOrHideImage:) forControlEvents:UIControlEventValueChanged];
    
    
    
    UIView *containerView = [[UIView alloc]init];
    [self addSubview:containerView];
    [containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(IMAGE_SIZE);
        make.centerX.equalTo(self.mas_centerX);
        make.top.equalTo(switchView1.mas_bottom).offset(20);
    }];
    containerView.backgroundColor = [UIColor lightGrayColor];
    
    UIImage * image1 = [UIImage imageNamed:@"image1"];
    CGSize imageViewSize = CGSizeMake(IMAGE_SIZE, IMAGE_SIZE);
    UIImageView *imageView1 = [[UIImageView alloc]initWithImage:image1];
    [containerView addSubview:imageView1];
    MASConstraint *height = [self setView:imageView1 size:imageViewSize top:containerView.mas_top centerX:containerView.mas_centerX];
    [_heightContraints addObject:height];
    
    
    UIImage * image2 = [UIImage imageNamed:@"image2"];
    UIImageView *imageView2 = [[UIImageView alloc]initWithImage:image2];
    [containerView addSubview:imageView2];
    height = [self setView:imageView2 size:imageViewSize top:imageView1.mas_bottom centerX:containerView.mas_centerX];
    [_heightContraints addObject:height];
    
    UIImage * image3 = [UIImage imageNamed:@"image3"];
    UIImageView *imageView3 = [[UIImageView alloc]initWithImage:image3];
    [containerView addSubview:imageView3];
    height = [self setView:imageView3 size:imageViewSize top:imageView2.mas_bottom centerX:containerView.mas_centerX];
    [_heightContraints addObject:height];
    
    UIImage * image4 = [UIImage imageNamed:@"image4"];
    UIImageView *imageView4 = [[UIImageView alloc]initWithImage:image4];
    [containerView addSubview:imageView4];
    height = [self setView:imageView4 size:imageViewSize top:imageView3.mas_bottom centerX:containerView.mas_centerX];
    [_heightContraints addObject:height];
    
    [imageView4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(containerView.mas_bottom);
    }];
    
    
    
    [containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.mas_bottom);
    }];
    
    
}



//设置view的宽高，左边约束，垂直中心约束
- (MASConstraint *)setView:(UIView *)view
                      size:(CGSize)size
                      top:(MASViewAttribute *)top
                   centerX:(MASViewAttribute *)centerX {
    __block MASConstraint *heightConstraint;
    
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(size.width);
        heightConstraint = make.height.mas_equalTo(size.height);
        make.top.equalTo(top);
        make.centerX.equalTo(centerX);
    }];
    return heightConstraint;
}




- (void)showOrHideImage:(UISwitch *)sender {
    
    NSUInteger index = (NSUInteger) sender.tag;
    MASConstraint *height = _heightContraints[index];
    
    if (sender.on) {
        height.mas_equalTo(IMAGE_SIZE);
    }
    else {
        height.mas_equalTo(0);
    }
    
}

@end
