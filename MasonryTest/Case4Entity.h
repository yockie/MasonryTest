//
//  Case4Entity.h
//  MasonryTest
//
//  Created by baidu on 15/12/3.
//  Copyright © 2015年 com.MyCompany. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Case4Entity : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *imageName;
@property (nonatomic, copy) NSString *content;
@property (nonatomic) float cellHeight;     //保存高度，避免重复计算

@end
