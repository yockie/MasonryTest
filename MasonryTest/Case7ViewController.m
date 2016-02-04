//
//  Case7ViewController.m
//  MasonryTest
//
//  Created by baidu on 15/12/4.
//  Copyright © 2015年 com.MyCompany. All rights reserved.
//

#import "Case7ViewController.h"
#import "Masonry.h"


#define IMAGE_HEIGHT        355

@interface Case7ViewController () <UITableViewDataSource, UITableViewDelegate >

@property (strong, nonatomic)UITableView *tableView;
@property (strong, nonatomic)UIImageView *imageView;
@property (nonatomic) MASConstraint * heightOfImageView;


@end

@implementation Case7ViewController

-(instancetype)init {
    if (self = [super init]) {
        _tableView = [[UITableView alloc]init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor clearColor];//必须要透明才能看得见imageView
        
        
        _imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"dog_big"]];
        _imageView.backgroundColor = [UIColor redColor];
    }
    return self;
}


-(void)viewDidLoad {
    [super viewDidLoad];
    
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
    
    [self.view addSubview:_tableView];
    _tableView.frame = self.view.frame;
//    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(_tableView.frame), IMAGE_HEIGHT)];
//    view.backgroundColor = [UIColor clearColor];//必须要透明才能看得见imageView
//    _tableView.tableHeaderView = view;
    
    
    [self.view insertSubview:_imageView belowSubview:_tableView];
    _imageView.contentMode = UIViewContentModeScaleAspectFill;
    [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.mas_topLayoutGuide);
        _heightOfImageView = make.height.mas_equalTo(IMAGE_HEIGHT);
    }];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell = [_tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class]) forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"%ld", (long)indexPath.row];
    
    return cell;
    
}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    //可以只写一句，这里这么写是为了帮助理解
    if (scrollView.contentOffset.y < 0) {
        _heightOfImageView.mas_equalTo(IMAGE_HEIGHT - scrollView.contentOffset.y);
    }
    else{
        _heightOfImageView.mas_equalTo(IMAGE_HEIGHT - scrollView.contentOffset.y);
    }
}


-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(_tableView.frame), IMAGE_HEIGHT)];
    view.backgroundColor = [UIColor clearColor];//必须要透明才能看得见imageView
    
    return view;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return IMAGE_HEIGHT;
}


@end
