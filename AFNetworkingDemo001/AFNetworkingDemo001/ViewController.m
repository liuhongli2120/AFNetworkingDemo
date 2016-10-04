//
//  ViewController.m
//  AFNetworkingDemo001
//
//  Created by 刘宏立 on 16/10/3.
//  Copyright © 2016年 lhl. All rights reserved.
//

#import "ViewController.h"
#import "HLNetworkManager.h"
#import "HLNewsModel.h"
#import "NSObject+HLRuntime.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
//    NSLog(@"%@", [HLNewsModel hl_propertyList]);
//    NSLog(@"%@", [HLNewsModel hl_ivarList]);
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self loadData];
}


- (void)loadData {
    
    [[HLNetworkManager sharedManager] newsListWithTimeString:[self dateString] isPullup:NO completion:^(NSArray *array, NSError *error) {
        if (error != nil) {
            NSLog(@"请求错误");
            return;
        }
        
//        NSLog(@"%@", array);
        
        NSArray *list = [HLNewsModel hl_objectsWithArray:array];
        
        NSLog(@"模型数量 = %zd", list.count);
        
    }];
}

- (NSString *)dateString {
    NSDate *date = [NSDate date];
    return [NSString stringWithFormat:@"%zd", date.timeIntervalSince1970];
}

//- (void)loadData1 {
//    
//    NSString *urlString = @"http://news.coolban.com/Api/Index/news_list/app/2/cat/0/limit/20/time/1464881444/type/0?channel=appstore&uuid=204ACEB6-9827-4AC7-A107-7CE2E48B0897&net=5&model=iPhone&ver=1.0.5";
//    
//    [[HLNetworkManager sharedManager] GET:urlString parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        
//        NSLog(@"%@", responseObject);
//        
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        NSLog(@"%@", error);
//    }];
//}


@end
