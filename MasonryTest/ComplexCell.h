//
//  ComplexCell.h
//  MasonryTest
//
//  Created by baidu on 15/12/8.
//  Copyright © 2015年 com.MyCompany. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, ComplexType) {
    ComplexType1111,
    ComplexType0111,
    ComplexType0011,
    ComplexType1011,
    ComplexType1110,
    ComplexType0010,
    ComplexType1101
};

@interface ComplexCell : UITableViewCell

@property (nonatomic, assign) ComplexType type;

@end
