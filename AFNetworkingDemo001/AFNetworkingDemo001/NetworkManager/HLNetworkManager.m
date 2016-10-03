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
        
        instance.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html", nil];
        
    });
    return instance;
}

- (void)newsListWithTimeString:(NSString *)timeString isPullup:(BOOL)isPullup completion:(void (^)(NSArray *, NSError *))completion {
    
    NSAssert(completion != nil, @"必须传入完成回调");
    
    NSString *urlString = [NSString stringWithFormat:@"http://news.coolban.com/Api/Index/news_list/app/2/cat/0/limit/20/time/%@/type/%zd?channel=appstore&uuid=204ACEB6-9827-4AC7-A107-7CE2E48B0897&net=5&model=iPhone&ver=1.0.5", timeString, isPullup];
    
    [[HLNetworkManager sharedManager] GET:urlString parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"%@", responseObject);
        
        completion(responseObject, nil);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@", error);
        
        completion(nil, error);
        
    }];
}

@end
