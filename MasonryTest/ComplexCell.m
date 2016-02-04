//
//  ComplexCell.m
//  MasonryTest
//
//  Created by baidu on 15/12/8.
//  Copyright © 2015年 com.MyCompany. All rights reserved.
//

#import "ComplexCell.h"
#import "Masonry.h"

@interface ComplexCell ()

@property (nonatomic, strong) MASConstraint *constraintFirstRow;
@property (nonatomic, strong) MASConstraint *constraintBlue;
@property (nonatomic, strong) MASConstraint *constraintYellow;
@property (nonatomic, strong) MASConstraint *constraintRed;
@property (nonatomic, strong) MASConstraint *constraintGreen;


@property (nonatomic, strong) UIView *groupFirstRow;
@property (nonatomic, strong) UIView *groupBlue;
@property (nonatomic, strong) UIView *groupYellow;
@property (nonatomic, strong) UIView *groupRed;
@property (nonatomic, strong) UIView *groupGreen;

@property (nonatomic, strong) UIView *viewBlue;         //height:30
@property (nonatomic, strong) UIView *viewYellow;       //height:30
@property (nonatomic, strong) UIView *viewRed;          //height:30
@property (nonatomic, strong) UIView *viewGreen;        //height:100

@end

@implementation ComplexCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.contentView.backgroundColor = [UIColor lightGrayColor];
        
        
        CGFloat spacing = 20.0f;
        
        _groupFirstRow = [[UIView alloc]init];
        [self.contentView addSubview:_groupFirstRow];
        [_groupFirstRow mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.equalTo(self.contentView);
            _constraintFirstRow = make.height.equalTo(@0).priorityHigh();
            [_constraintFirstRow deactivate];
        }];
        _groupFirstRow.clipsToBounds = YES; //子视图超出父视图部分将会被隐藏
        
        _groupBlue = [[UIView alloc] init];
        //_groupBlue.backgroundColor = [UIColor brownColor];
        [_groupFirstRow addSubview:_groupBlue];
        [_groupBlue mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.bottom.equalTo(_groupFirstRow);
            _constraintBlue = make.width.equalTo(@0).priorityHigh();
            [_constraintBlue deactivate];
        }];
        _groupBlue.clipsToBounds = YES;
        
        _groupYellow = [[UIView alloc]init];
        //_groupYellow.backgroundColor = [UIColor purpleColor];
        [_groupFirstRow addSubview:_groupYellow];
        [_groupYellow mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.right.bottom.equalTo(_groupFirstRow);
            make.left.equalTo(_groupBlue.mas_right);
            _constraintYellow = make.width.equalTo(@0).priorityHigh();
            [_constraintYellow deactivate];
        }];
        _groupYellow.clipsToBounds = YES;
        
        
        _groupRed = [[UIView alloc]init];
        [self.contentView addSubview:_groupRed];
        [_groupRed mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.contentView);
            make.top.equalTo(_groupFirstRow.mas_bottom);
            _constraintRed = make.height.equalTo(@0).priorityHigh();
            [_constraintRed deactivate];
        }];
        _groupRed.clipsToBounds = YES;
        
        _groupGreen = [[UIView alloc]init];
        [self.contentView addSubview:_groupGreen];
        [_groupGreen mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.contentView);
            make.top.equalTo(_groupRed.mas_bottom);
            make.bottom.equalTo(self.contentView.mas_bottom);
            _constraintGreen = make.height.equalTo(@0).priorityHigh();
            [_constraintGreen deactivate];
        }];
        _groupGreen.clipsToBounds = YES;
        
        
        _viewBlue = [[UIView alloc]init];
        [_groupBlue addSubview:_viewBlue];
        [_viewBlue mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(_groupBlue).insets(UIEdgeInsetsMake(spacing, 0, 0, 0)).priorityLow();
            //fix by hyc:如果只隐藏viewBlue，[_constraintYellow activate]之后，效果奇怪:蓝色view宽高不变，但与屏幕右边框对齐
            //应该是上面的priorityLow的问题，故把与左边的约束单独提出来，且为普通优先级
            make.left.equalTo(_groupBlue).offset(spacing);
            make.height.equalTo(@30);
            make.width.equalTo(@60);
        }];
        _viewBlue.backgroundColor = [UIColor blueColor];
        
        _viewYellow = [[UIView alloc]init];
        [_groupYellow addSubview:_viewYellow];
        [_viewYellow mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(_groupYellow).insets(UIEdgeInsetsMake(spacing, spacing, 0, spacing)).priorityLow();
            make.height.equalTo(@30);
        }];
        _viewYellow.backgroundColor = [UIColor yellowColor];
        
        _viewRed = [[UIView alloc]init];
        [_groupRed addSubview:_viewRed];
        [_viewRed mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(_groupRed).insets(UIEdgeInsetsMake(spacing, spacing, 0, spacing)).priorityLow();
            make.height.equalTo(@30);
        }];
        _viewRed.backgroundColor = [UIColor redColor];
        
        _viewGreen = [[UIView alloc]init];
        [_groupGreen addSubview:_viewGreen];
        [_viewGreen mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(_groupGreen).insets(UIEdgeInsetsMake(spacing, spacing, 0, spacing)).priorityLow();
            make.height.equalTo(@100);
        }];
        _viewGreen.backgroundColor = [UIColor greenColor];
        
    }
    
    
    return self;
}



- (void)setType:(ComplexType)type {
    [_constraintFirstRow deactivate];
    [_constraintBlue deactivate];
    [_constraintYellow deactivate];
    [_constraintRed deactivate];
    [_constraintGreen deactivate];
    
    switch (type) {
            case ComplexType1111:
                break;
            case ComplexType0111:
                [_constraintBlue activate];
                break;
            case ComplexType0011:
                [_constraintFirstRow activate];
                break;
            case ComplexType1011:
                [_constraintYellow activate];
                break;
            case ComplexType1110:
                [_constraintGreen activate];
                break;
            case ComplexType0010:
            
                [_constraintGreen activate];
                [_constraintFirstRow activate];
                break;
            case ComplexType1101:
                [_constraintRed activate];
                break;
            
        default:
            break;
    }
}

@end

















































