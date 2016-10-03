//
//  HLNetworkManager.m
//  AFNetworkingDemo001
//
//  Created by 刘宏立 on 16/10/4.
//  Copyright © 2016年 lhl. All rights reserved.
//

#import "HLNetworkManager.h"

@implementation HLNetworkManager

+ (instancetype)sharedManager {
    static HLNetworkManager *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [self new];
    });
    return instance;
}



@end
