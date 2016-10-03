//
//  HLNewsModel.h
//  AFNetworkingDemo001
//
//  Created by 刘宏立 on 16/10/4.
//  Copyright © 2016年 lhl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HLNewsModel : NSObject

// id
@property (nonatomic, copy) NSString *id;
// 标题
@property (nonatomic, copy) NSString *title;
// 简介
@property (nonatomic, copy) NSString *summary;
// 图像
@property (nonatomic, copy) NSString *src_img;
// 添加时间
@property (nonatomic, copy) NSString *addtime;
// 来源网站
@property (nonatomic, copy) NSString *sitname;
//计数
@property (nonatomic, assign) NSInteger count;

@end
