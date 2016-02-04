//
//  Case4ViewController.m
//  MasonryTest
//
//  Created by baidu on 15/12/3.
//  Copyright © 2015年 com.MyCompany. All rights reserved.
//

#import "Case4ViewController.h"
#import "Case4Entity.h"
#import "Case4TableViewCell.h"
#import "Masonry.h"

//#define IOS_8_NEW_FEATURE

@interface Case4ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *data;

@end

@implementation Case4ViewController


-(instancetype)init {
    if (self = [super init]) {
        
        [self setupData];
        
        _tableView = [[UITableView alloc]init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        //默认情况下，首次显示之前，系统都会一次性全部计算出所有Cell的高度
        //预先指定一个“估计”的高度值以减少首次显示的计算量
        _tableView.estimatedRowHeight = 80.0;
        _tableView.backgroundColor = [UIColor redColor];
        
#ifdef IOS_8_NEW_FEATURE
        //ios 8的self-sizing特性
        if ([UIDevice currentDevice].systemVersion.integerValue > 7) {
            _tableView.rowHeight = UITableViewAutomaticDimension;
        }
#endif
        
        [self.view addSubview:_tableView];
    }
    
    return self;
}

-(void)viewDidLoad {
    [super viewDidLoad];

    _tableView.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height - 64);
    
    [_tableView registerClass:[Case4TableViewCell class] forCellReuseIdentifier:NSStringFromClass([Case4TableViewCell class])];
}


- (void)setupData {
    _data = [[NSMutableArray alloc]init];
    for (int i=0; i<20; i++) {
        Case4Entity * entity = [[Case4Entity alloc]init];
        entity.imageName = @"image3";
        entity.title = [NSString stringWithFormat:@"Title : %d", i];
        NSString * string = @"";
        for (int j=0; j<=i; j++) {
            string = [string stringByAppendingString:@"content-"];
        }
        entity.content = string;
        
        [_data addObject:entity];
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    Case4TableViewCell *cell = (Case4TableViewCell *)[_tableView dequeueReusableCellWithIdentifier:NSStringFromClass([Case4TableViewCell class])];
    
    //NSLog(@"%x", cell);
    
    Case4Entity *dataEntity = _data[(NSInteger)indexPath.row];
    [cell setupData:dataEntity];
    
    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
#ifdef IOS_8_NEW_FEATURE
    
    return UITableViewAutomaticDimension;
#else
    static Case4TableViewCell *tempCell;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tempCell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([Case4TableViewCell class])];
    });
    
    //***重要：解决了-preferredMaxLayoutWidth的问题，在计算高度前向contentView加了一条和table view宽度相同的宽度约束，
    //强行让contentView内部的控件知道了自己父 view 的宽度，再反算自己被外界约束的宽度
    //否则，当 UILabel 行数大于0时，需要指定 preferredMaxLayoutWidth 后它才知道自己什么时候该折行
    [tempCell.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(self.view.frame.size.width);
    }];
    
    //获取对应的数据
    Case4Entity *dataEntity = _data[(NSInteger)indexPath.row];
    
    //填充数据
    [tempCell setupData:dataEntity];
    
    //判定高度是否已经计算过
    if (dataEntity.cellHeight <= 0) {
        dataEntity.cellHeight = [tempCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height + 1;
    }
    
    return dataEntity.cellHeight;
#endif
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _data.count;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

@end











































