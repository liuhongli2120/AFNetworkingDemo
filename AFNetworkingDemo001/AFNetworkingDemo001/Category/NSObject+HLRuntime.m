//
//  NSObject+HLRuntime.m
//  AFNetworkingDemo001
//
//  Created by 刘宏立 on 16/10/4.
//  Copyright © 2016年 lhl. All rights reserved.
//

#import "NSObject+HLRuntime.h"
#import <objc/runtime.h>

@implementation NSObject (HLRuntime)



+ (NSArray *)hl_objectsWithArray:(NSArray *)array {
    
    if (array.count == 0) {
        return nil;
    }
    
    NSAssert([array[0] isKindOfClass:[NSDictionary class]], @"必须传入字典数组");
    
    NSArray *ptyList = [self hl_propertyList];
    
    NSMutableArray *arrayM = [NSMutableArray array];
    for (NSDictionary *dict in array) {
        id model = [[self alloc]init];
        
        for (NSString *key in dict) {
            if ([ptyList containsObject:key]) {
                
                [model setValue:dict[key] forKey:key];
                
            }
        }
        
        [arrayM addObject:model];
    }
    
    return arrayM.copy;
}



+ (NSArray *)hl_ivarList {
    
    unsigned int count = 0;
    Ivar *list = class_copyIvarList([self class], &count);
    
    NSLog(@"成员变量计数 = %u", count);
    
    NSMutableArray *arrayM = [NSMutableArray array];
    
    for (unsigned int i = 0; i < count; i++) {
        
        Ivar ivar = list[i];
        
        const char *cName = ivar_getName(ivar);
//        NSLog(@"cName = %s", cName);
        
        //转换成OC字符串
        NSString *name = [NSString stringWithUTF8String:cName];
        NSLog(@"name = %@", name);
        
        [arrayM addObject:name];
        
    }
    
    return arrayM.copy;
    
}

const void *hl_propertyList = @"hl_propertyList";
+ (NSArray *)hl_propertyList {
    
    //利用关联对象在分类里动态添加属性,优化字典转模型性能
    NSArray *result = objc_getAssociatedObject(self, hl_propertyList);
    if (result != nil) {
        return result;
    }
    
    
    unsigned int count = 0;
    //获取指定类的数组
    objc_property_t *list = class_copyPropertyList([self class], &count);
    
    NSLog(@"属性数量计数 = %u", count);
    
    NSMutableArray *arrayM = [NSMutableArray array];
    
    for (unsigned int i = 0; i < count; i++) {
        objc_property_t pty = list[i];
        
        const char *cName = property_getName(pty);
        
//        NSLog(@"cName = %s", cName);
        
        //转换成OC字符串
        NSString *name = [NSString stringWithUTF8String:cName];
        
        NSLog(@"name = %@", name);
        
        [arrayM addObject:name];
    }
    
    free(list);
    
    objc_setAssociatedObject(self, hl_propertyList, arrayM, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
//    return arrayM.copy;
    return objc_getAssociatedObject(self, hl_propertyList);
}


@end
