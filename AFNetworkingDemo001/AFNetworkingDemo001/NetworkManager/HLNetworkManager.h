//
//  HLNetworkManager.h
//  AFNetworkingDemo001
//
//  Created by 刘宏立 on 16/10/4.
//  Copyright © 2016年 lhl. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

@interface HLNetworkManager : AFHTTPSessionManager

+ (instancetype)sharedManager;

@end
