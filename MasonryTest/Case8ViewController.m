//
//  Case8ViewController.m
//  MasonryTest
//
//  Created by baidu on 15/12/8.
//  Copyright © 2015年 com.MyCompany. All rights reserved.
//

#import "Case8ViewController.h"
#import "ComplexCell.h"
#import "Masonry.h"

@interface Case8ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation Case8ViewController


- (instancetype)init {
    if (self = [super init]) {
        _tableView = [[UITableView alloc]init];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:_tableView];
    _tableView.frame = self.view.frame;
    //_tableView.rowHeight = UITableViewAutomaticDimension;
    
    [_tableView registerClass:[ComplexCell class] forCellReuseIdentifier:NSStringFromClass([ComplexCell class])];
}



#pragma mark - dataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 7;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ComplexCell *cell = [_tableView dequeueReusableCellWithIdentifier:NSStringFromClass([ComplexCell class])];
    
    cell.type = indexPath.row%7;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    //return UITableViewAutomaticDimension;
    
    static ComplexCell *tempCell;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tempCell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([ComplexCell class])];
    });

    
    //***重要：解决了-preferredMaxLayoutWidth的问题，在计算高度前向contentView加了一条和table view宽度相同的宽度约束，
    //强行让contentView内部的控件知道了自己父 view 的宽度，再反算自己被外界约束的宽度
    //否则，当 UILabel 行数大于0时，需要指定 preferredMaxLayoutWidth 后它才知道自己什么时候该折行
    [tempCell.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(self.view.frame.size.width);
    }];
    
    
    tempCell.type = indexPath.row % 7;
    
    //判定高度是否已经计算过
    CGFloat cellHeight = [tempCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height + 1;
    
    
    return cellHeight;
}

@end
