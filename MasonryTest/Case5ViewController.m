//
//  Case5ViewController.m
//  MasonryTest
//
//  Created by baidu on 15/12/3.
//  Copyright © 2015年 com.MyCompany. All rights reserved.
//

#import "Case5ViewController.h"
#import "Masonry.h"

//#define NEW_MASONRY_FEATURE

@interface Case5ViewController ()

@property (strong, nonatomic) UILabel *topLabel;
@property (strong, nonatomic) UILabel *bottomLabel;

@property (strong, nonatomic) UIButton *topControlButton;
@property (strong, nonatomic) UIButton *bottomControlButton;

@end

@implementation Case5ViewController


-(instancetype)init {
    if (self = [super init]) {
        
        [self setupView];
        
    }
    return self;
}




-(void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"%d", [self.topLayoutGuide isKindOfClass:[UIView class]]);

    
}

-(void)updateViewConstraints {
    [super updateViewConstraints];
    
    [self setupViewConstraint];
    
}


-(void)setupView {
    _topLabel = [[UILabel alloc]init];
    _topLabel.backgroundColor = [UIColor greenColor];
    [self.view addSubview:_topLabel];
    
    _bottomLabel = [[UILabel alloc]init];
    _bottomLabel.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:_bottomLabel];
    
    _topControlButton = [[UIButton alloc]init];
    [_topControlButton setTitle:@"显示或隐藏navigationBar" forState:UIControlStateNormal];
    [_topControlButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.view addSubview:_topControlButton];
    [_topControlButton addTarget:self action:@selector(showOrHideNavigationBar:) forControlEvents:UIControlEventTouchUpInside];
    
    _bottomControlButton = [[UIButton alloc]init];
    [_bottomControlButton setTitle:@"显示或隐藏toolBar" forState:UIControlStateNormal];
    [_bottomControlButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.view addSubview:_bottomControlButton];
    [_bottomControlButton addTarget:self action:@selector(showOrHideToolBar:) forControlEvents:UIControlEventTouchUpInside];
}


-(void)setupViewConstraint {
    [_topLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
#ifdef NEW_MASONRY_FEATURE
        make.top.equalTo(self.mas_topLayoutGuide);
#else
        make.top.equalTo(self.view).offset(self.topLayoutGuide.length);
#endif
        make.height.mas_equalTo(40);
    }];


    [_bottomLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
#ifdef NEW_MASONRY_FEATURE
        make.bottom.equalTo(self.mas_bottomLayoutGuide);
#else
        make.bottom.equalTo(self.view).offset(-self.bottomLayoutGuide.length);
#endif
        make.height.mas_equalTo(40);
    }];
    
    [_topControlButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(200, 50));
        make.centerX.equalTo(self.view);
        make.top.equalTo(_topLabel.mas_bottom).offset(100);
    }];
 
    [_bottomControlButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(200, 50));
        make.centerX.equalTo(self.view);
        make.bottom.equalTo(_bottomLabel.mas_top).offset(-100);
    }];
}

-(void)showOrHideNavigationBar:(id)sender {
    self.navigationController.navigationBarHidden = !self.navigationController.navigationBarHidden;
    
}

-(void)showOrHideToolBar:(id)sender {
    self.navigationController.toolbarHidden = !self.navigationController.toolbarHidden;
#ifndef NEW_MASONRY_FEATURE
    [self updateViewConstraints];
#endif
}

@end
