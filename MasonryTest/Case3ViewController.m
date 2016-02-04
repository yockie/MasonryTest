//
//  Case3ViewController.m
//  MasonryTest
//
//  Created by baidu on 15/11/27.
//  Copyright © 2015年 com.MyCompany. All rights reserved.
//

#import "Case3ViewController.h"
#import "Masonry.h"

@interface Case3ViewController ()
@property (strong, nonatomic) UISlider *slider;
@property (strong, nonatomic) UIView *parentView;
@property (strong, nonatomic) UIView *subView;

@end

@implementation Case3ViewController


-(instancetype)init {
    if (self = [super init]) {
        
    }
    
    return self;
}

-(void)viewDidLoad {
    [super viewDidLoad];
    
    _parentView = [[UIView alloc]init];
    _parentView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:_parentView];
    
    _subView = [[UIView alloc]init];
    _subView.backgroundColor = [UIColor redColor];
    [_parentView addSubview:_subView];
    
    
    _slider = [[UISlider alloc]init];
    _slider.minimumValue = 0;
    _slider.maximumValue = 200;
    _slider.value = 200;
    _slider.continuous = YES;
    [self.view addSubview:_slider];
    [_slider addTarget:self action:@selector(sliderChanged:) forControlEvents:UIControlEventValueChanged];
    
    
    [_parentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(50);
        make.top.equalTo(self.view).offset(50);
        make.height.mas_equalTo(50);
        make.width.mas_equalTo(_slider.value);
    }];
    
    [_subView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(_parentView);
        make.height.equalTo(_parentView);
        make.width.equalTo(_parentView).multipliedBy(0.5);
    }];
    
    
    [_slider mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_parentView);
        make.top.equalTo(_parentView.mas_bottom).offset(50);
        make.size.mas_equalTo(CGSizeMake(200, 30));
    }];
    
    
}


- (void)sliderChanged:(id)sender {
    
    [_parentView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(_slider.value);
    }];
    
}



@end
