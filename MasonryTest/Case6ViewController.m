//
//  Case6ViewController.m
//  MasonryTest
//
//  Created by baidu on 15/12/4.
//  Copyright © 2015年 com.MyCompany. All rights reserved.
//

#import "Case6ViewController.h"
#import "Case6ViewItem.h"
#import "Masonry.h"

@implementation Case6ViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *images = @[[UIImage imageNamed:@"dog_small"], [UIImage imageNamed:@"dog_middle"], [UIImage imageNamed:@"dog_big"]];
    
    Case6ViewItem *item1 = [Case6ViewItem initWithImage:images[0] andText:@"text text text text"];
    Case6ViewItem *item2 = [Case6ViewItem initWithImage:images[1] andText:@"text text text text text text text text text"];
    Case6ViewItem *item3 = [Case6ViewItem initWithImage:images[2] andText:@"text text text text text text text text text text text text text text text text text"];
    
    [self.view addSubview:item1];
    [self.view addSubview:item2];
    [self.view addSubview:item3];
    
    
    [item1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left);
        make.top.equalTo(self.view.mas_top).offset(200);
    }];
    
    [item2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(item1.mas_right).offset(4);
        make.baseline.equalTo(item1.mas_baseline);
    }];
    [item3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(item2.mas_right).offset(4);
        make.baseline.equalTo(item1.mas_baseline);
    }];
}

@end
