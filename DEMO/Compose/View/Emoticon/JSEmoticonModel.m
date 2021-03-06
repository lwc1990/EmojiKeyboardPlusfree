//
//  JSEmoticonModel.m
//  Weibo_Object-C
//
//  Created by ShenYj on 2016/11/2.
//  Copyright © 2016年 ___ShenYJ___. All rights reserved.
//

#import "JSEmoticonModel.h"
#import <objc/message.h>

@implementation JSEmoticonModel


- (instancetype)initWithDict:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)emoticonWithDict:(NSDictionary *)dict {
    
    return [[self alloc] initWithDict:dict];
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}

- (NSString *)description {
    
    NSArray *keys = [JSEmoticonModel js_objProperties];
    return [self dictionaryWithValuesForKeys:keys].description;
}


+ (NSArray *)js_objProperties{
    
    /*
     class_copyIvarList(__unsafe_unretained Class cls, unsigned int *outCount)       成员变量
     class_copyMethodList(__unsafe_unretained Class cls, unsigned int *outCount)     方法
     class_copyPropertyList(__unsafe_unretained Class cls, unsigned int *outCount)   属性
     class_copyProtocolList(__unsafe_unretained Class cls, unsigned int *outCount)   协议
     */
    
    /*      调用运行时方法,取得类的属性列表
     
     返回值 : 所有属性的数组 (是一个C数组指针:C语言中数组的名字就是首元素的地址)
     参数 1 :  要获取的类
     参数 2 :  类属性的个数指针
     */
    unsigned int count = 0;
    objc_property_t *propertyList = class_copyPropertyList([self class], &count);
    
    // 用来存放所有属性的数组
    NSMutableArray *mArr = [NSMutableArray array];
    
    // 遍历所有属性
    for (unsigned int i = 0; i < count; i ++) {
        
        // 1. 从数组中取得所有属性
        objc_property_t property = propertyList[i];
        
        const char *cName = property_getName(property);
        
        NSString *propertyName = [NSString stringWithCString:cName encoding:NSUTF8StringEncoding];
        
        [mArr addObject:propertyName];
        
    }
    
    // C语言中 retain/create/copy 都需要release, 可以option+click方法名,通过API描述中找到释放方法
    // 例如这里的提示: You must free the array with free().
    free(propertyList);
    
    return mArr.copy;
}



- (void)setType:(NSString *)type {
    
    _type = type;
    if ([type isEqualToString:@"0"]) {
        self.emoji = NO;
    } else {
        self.emoji = YES;
    }
}



@end
