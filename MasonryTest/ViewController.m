//
//  ViewController.m
//  MasonryTest
//
//  Created by baidu on 15/11/27.
//  Copyright © 2015年 com.MyCompany. All rights reserved.
//

#import "ViewController.h"
#import "Case1ViewController.h"
#import "Case2ViewController.h"
#import "Case3ViewController.h"
#import "Case4ViewController.h"
#import "Case5ViewController.h"
#import "Case6ViewController.h"
#import "Case7ViewController.h"
#import "Case8ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.


    [self createButtonIndex:1 action:@selector(btn1Clicked:)];
    [self createButtonIndex:2 action:@selector(btn2Clicked:)];
    [self createButtonIndex:3 action:@selector(btn3Clicked:)];
    [self createButtonIndex:4 action:@selector(btn4Clicked:)];
    [self createButtonIndex:5 action:@selector(btn5Clicked:)];
    [self createButtonIndex:6 action:@selector(btn6Clicked:)];
    [self createButtonIndex:7 action:@selector(btn7Clicked:)];
    [self createButtonIndex:8 action:@selector(btn8Clicked:)];
}

-(void)createButtonIndex:(NSInteger)index action:(SEL)action {
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(50, 20+40*(index-1), 100, 30)];
    btn.backgroundColor = [UIColor blueColor];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    NSString *title = [NSString stringWithFormat:@"case %ld", (long)index];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)btn1Clicked:(id)sender {
    Case1ViewController * viewController = [[Case1ViewController alloc]init];
    
    [self.navigationController pushViewController:viewController animated:YES];
}

-(void)btn2Clicked:(id)sender {
    Case2ViewController * viewController = [[Case2ViewController alloc]init];
    
    [self.navigationController pushViewController:viewController animated:YES];
}

-(void)btn3Clicked:(id)sender {
    Case3ViewController * viewController = [[Case3ViewController alloc]init];
    
    [self.navigationController pushViewController:viewController animated:YES];
}

-(void)btn4Clicked:(id)sender {
    Case4ViewController * viewController = [[Case4ViewController alloc]init];
    
    [self.navigationController pushViewController:viewController animated:YES];
}

-(void)btn5Clicked:(id)sender {
    Case5ViewController * viewController = [[Case5ViewController alloc]init];
    
    [self.navigationController pushViewController:viewController animated:YES];
}

-(void)btn6Clicked:(id)sender {
    Case6ViewController * viewController = [[Case6ViewController alloc]init];
    
    [self.navigationController pushViewController:viewController animated:YES];
}

-(void)btn7Clicked:(id)sender {
    Case7ViewController * viewController = [[Case7ViewController alloc]init];
    
    [self.navigationController pushViewController:viewController animated:YES];
}

-(void)btn8Clicked:(id)sender {
    Case8ViewController * viewController = [[Case8ViewController alloc]init];
    
    [self.navigationController pushViewController:viewController animated:YES];
}

@end
