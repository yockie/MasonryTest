//
//  Case2ViewController.m
//  MasonryTest
//
//  Created by baidu on 15/11/27.
//  Copyright © 2015年 com.MyCompany. All rights reserved.
//

#import "Case2ViewController.h"
#import "Masonry.h"
#import "AdaptiveView.h"

#define kScreen_Bounds [UIScreen mainScreen].bounds     //屏幕bounds
#define kScreen_Height [UIScreen mainScreen].bounds.size.height //屏幕高度
#define kScreen_Width [UIScreen mainScreen].bounds.size.width   //屏幕宽度

#define IMAGE_SIZE      40

@interface Case2ViewController ()

@property (nonatomic) NSMutableArray * widthContraints;

@end

@implementation Case2ViewController


-(instancetype)init {
    if (self = [super init]) {
        
    }
    return self;
}

-(void)viewDidLoad {
    [super viewDidLoad];
    
//    UIView *containerView = [[UIView alloc]init];
//    [self.view addSubview:containerView];
//    [containerView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.height.mas_equalTo(IMAGE_SIZE);
//        make.centerX.equalTo(self.view.mas_centerX);
//        make.top.equalTo(self.view.mas_top).offset(200);
//    }];
//    containerView.backgroundColor = [UIColor lightGrayColor];
//    
//    UIImage * image1 = [UIImage imageNamed:@"image1"];
//    CGSize imageViewSize = CGSizeMake(IMAGE_SIZE, IMAGE_SIZE);
//    UIImageView *imageView1 = [[UIImageView alloc]initWithImage:image1];
//    [containerView addSubview:imageView1];
//    MASConstraint *width = [self setView:imageView1 size:imageViewSize left:containerView.mas_left centerY:containerView.mas_centerY];
//    [_widthContraints addObject:width];
//    
//    
//    UIImage * image2 = [UIImage imageNamed:@"image2"];
//    UIImageView *imageView2 = [[UIImageView alloc]initWithImage:image2];
//    [containerView addSubview:imageView2];
//    width = [self setView:imageView2 size:imageViewSize left:imageView1.mas_right centerY:containerView.mas_centerY];
//    [_widthContraints addObject:width];
//    
//    UIImage * image3 = [UIImage imageNamed:@"image3"];
//    UIImageView *imageView3 = [[UIImageView alloc]initWithImage:image3];
//    [containerView addSubview:imageView3];
//    width = [self setView:imageView3 size:imageViewSize left:imageView2.mas_right centerY:containerView.mas_centerY];
//    [_widthContraints addObject:width];
//    
//    UIImage * image4 = [UIImage imageNamed:@"image4"];
//    UIImageView *imageView4 = [[UIImageView alloc]initWithImage:image4];
//    [containerView addSubview:imageView4];
//    width = [self setView:imageView4 size:imageViewSize left:imageView3.mas_right centerY:containerView.mas_centerY];
//    [_widthContraints addObject:width];
//    
//    [imageView4 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.equalTo(containerView.mas_right);
//    }];
//    
//    
//    
//    UISwitch *switchView1 = [[UISwitch alloc]initWithFrame:CGRectMake(50, 300, 50, 100)];
//    [self.view addSubview:switchView1];
//    switchView1.on = YES;
//    switchView1.tag = 0;
//    [switchView1 addTarget:self action:@selector(showOrHideImage:) forControlEvents:UIControlEventValueChanged];
//    
//    UISwitch *switchView2 = [[UISwitch alloc]initWithFrame:CGRectMake(100, 300, 50, 100)];
//    [self.view addSubview:switchView2];
//    switchView2.on = YES;
//    switchView2.tag = 1;
//    [switchView2 addTarget:self action:@selector(showOrHideImage:) forControlEvents:UIControlEventValueChanged];
//    
//    UISwitch *switchView3 = [[UISwitch alloc]initWithFrame:CGRectMake(150, 300, 50, 100)];
//    [self.view addSubview:switchView3];
//    switchView3.on = YES;
//    switchView3.tag = 2;
//    [switchView3 addTarget:self action:@selector(showOrHideImage:) forControlEvents:UIControlEventValueChanged];
//    
//    UISwitch *switchView4 = [[UISwitch alloc]initWithFrame:CGRectMake(200, 300, 50, 100)];
//    [self.view addSubview:switchView4];
//    switchView4.on = YES;
//    switchView4.tag = 3;
//    [switchView4 addTarget:self action:@selector(showOrHideImage:) forControlEvents:UIControlEventValueChanged];
    
    
    AdaptiveView * adaptiveView = [[AdaptiveView alloc]init];
    [self.view addSubview:adaptiveView];
    adaptiveView.backgroundColor = [UIColor blueColor];
    [adaptiveView mas_makeConstraints:^(MASConstraintMaker *make) {
        //make.height.mas_equalTo(IMAGE_SIZE);
        //make.centerX.equalTo(self.view.mas_centerX);
        make.top.equalTo(self.view.mas_top).offset(100);
        make.left.equalTo(self.view.mas_left);
        make.width.mas_equalTo(kScreen_Width);
    }];
    
    UIView * testView = [[UIView alloc]init];
    [self.view addSubview:testView];
    testView.backgroundColor = [UIColor redColor];
    [testView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left);
        make.top.equalTo(adaptiveView.mas_bottom);
        make.size.mas_equalTo(CGSizeMake(IMAGE_SIZE, IMAGE_SIZE));
    }];
  
    
}



////设置view的宽高，左边约束，垂直中心约束
//- (MASConstraint *)setView:(UIView *)view
//                      size:(CGSize)size
//                      left:(MASViewAttribute *)left
//                   centerY:(MASViewAttribute *)centerY {
//    __block MASConstraint *widthConstraint;
//    
//    [view mas_makeConstraints:^(MASConstraintMaker *make) {
//        widthConstraint = make.width.mas_equalTo(size.width);
//        make.height.mas_equalTo(size.height);
//        make.left.equalTo(left);
//        make.centerY.equalTo(centerY);
//    }];
//    return widthConstraint;
//}
//
//
//
//
//- (void)showOrHideImage:(UISwitch *)sender {
//    
//    NSUInteger index = (NSUInteger) sender.tag;
//    MASConstraint *width = _widthContraints[index];
//    
//    if (sender.on) {
//        width.mas_equalTo(IMAGE_SIZE);
//    }
//    else {
//        width.mas_equalTo(0);
//    }
//    
//}



@end








































