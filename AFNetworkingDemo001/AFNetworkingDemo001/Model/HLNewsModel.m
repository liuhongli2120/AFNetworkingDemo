//
//  HLNewsModel.m
//  AFNetworkingDemo001
//
//  Created by 刘宏立 on 16/10/4.
//  Copyright © 2016年 lhl. All rights reserved.
//

#import "HLNewsModel.h"

@implementation HLNewsModel

- (NSString *)description {
    return [NSString stringWithFormat:@"id: %@, title: %@, summary: %@, src_img: %@, addtime: %@, sitname: %@", _id, _title, _summary, _src_img, _addtime, _sitname];
}

@end
