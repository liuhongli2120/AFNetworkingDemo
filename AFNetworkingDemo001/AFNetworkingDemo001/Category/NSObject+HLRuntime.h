//
//  NSObject+HLRuntime.h
//  AFNetworkingDemo001
//
//  Created by 刘宏立 on 16/10/4.
//  Copyright © 2016年 lhl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (HLRuntime)

// 字典数组,转换成当前模型对象数组
+ (NSArray *)hl_objectsWithArray:(NSArray *)array;

// 返回当前成员变量数组
+ (NSArray *)hl_ivarList;

//返回当前类的所有属性
+ (NSArray *)hl_propertyList;

@end
