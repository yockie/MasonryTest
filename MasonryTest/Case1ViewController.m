//
//  Case1ViewController.m
//  MasonryTest
//
//  Created by baidu on 15/11/27.
//  Copyright © 2015年 com.MyCompany. All rights reserved.
//

#import "Case1ViewController.h"
#import "Masonry.h"

@interface Case1ViewController ()

@property (strong, nonatomic) UILabel *label1;
@property (strong, nonatomic) UILabel *label2;

@end

@implementation Case1ViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *contentView = [[UIView alloc]initWithFrame:CGRectMake(50, 100, 200, 50)];
    contentView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:contentView];
    
    UIStepper * step1 = [[UIStepper  alloc]initWithFrame:CGRectMake(20, 200, 50, 20)];
    [self.view addSubview:step1];
    [step1 addTarget:self action:@selector(step1Pressed:) forControlEvents:UIControlEventValueChanged];
    
    UIStepper * step2 = [[UIStepper  alloc]initWithFrame:CGRectMake(150, 200, 50, 20)];
    [self.view addSubview:step2];
    [step2 addTarget:self action:@selector(step2Pressed:) forControlEvents:UIControlEventValueChanged];
    
    
    _label1 = [[UILabel alloc]init];
    _label1.text = @"label1";
    _label1.backgroundColor = [UIColor yellowColor];
    [contentView addSubview:_label1];
    [_label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(contentView.mas_top).offset(5);
        make.left.equalTo(contentView.mas_left).offset(2);
        
        make.height.equalTo(@40);
    }];
    [_label1 setContentHuggingPriority:UILayoutPriorityRequired
                              forAxis:UILayoutConstraintAxisHorizontal];
    [_label1 setContentCompressionResistancePriority:UILayoutPriorityRequired
                                            forAxis:UILayoutConstraintAxisHorizontal];
    
    
    
    _label2 = [[UILabel alloc]init];
    _label2.text = @"label2";
    _label2.backgroundColor = [UIColor greenColor];
    [contentView addSubview:_label2];
    [_label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(contentView.mas_top).offset(5);
        make.left.equalTo(_label1.mas_right).offset(2);
        make.right.lessThanOrEqualTo(contentView.mas_right).offset(-2);
        
        make.height.equalTo(@40);
    }];
    [_label2 setContentHuggingPriority:UILayoutPriorityRequired
                              forAxis:UILayoutConstraintAxisHorizontal];
    [_label2 setContentCompressionResistancePriority:UILayoutPriorityDefaultLow
                                            forAxis:UILayoutConstraintAxisHorizontal];
    
    
    
    
}


- (void)step1Pressed:(UIStepper *)stepper {
    NSString *text = @"label1";
    for (NSInteger i=0; i<[stepper value]; ++i) {
        text = [text stringByAppendingString:@"label1"];
    }
    _label1.text = text;
}

- (void)step2Pressed:(UIStepper *)stepper {
    NSString *text = @"label2";
    for (NSInteger i=0; i<[stepper value]; ++i) {
        text = [text stringByAppendingString:@"label2"];
    }
    _label2.text = text;
}

@end
