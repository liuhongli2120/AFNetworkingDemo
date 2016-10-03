//
//  ViewController.m
//  AFNetworkingDemo001
//
//  Created by 刘宏立 on 16/10/3.
//  Copyright © 2016年 lhl. All rights reserved.
//

#import "ViewController.h"
#import "HLNetworkManager.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
}


- (void)loadData {
    
    NSString *urlString = @"http://news.coolban.com/Api/Index/news_list/app/2/cat/0/limit/20/time/1464881444/type/0?channel=appstore&uuid=204ACEB6-9827-4AC7-A107-7CE2E48B0897&net=5&model=iPhone&ver=1.0.5";
    
    [[HLNetworkManager sharedManager] GET:urlString parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"%@", responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@", error);
    }];
}


@end
