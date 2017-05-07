//
//  JSEmoticonModel.h
//  Weibo_Object-C
//
//  Created by ShenYj on 2016/11/2.
//  Copyright © 2016年 ___ShenYJ___. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JSEmoticonModel : NSObject

/**
 *   表情类型: 0-> 图片表情; 1--> emoji表情
 */
@property (copy,nonatomic) NSString *type;
#pragma mark - Emoji
/**
 *   emoji图片名称
 */
@property (copy,nonatomic) NSString *code;

#pragma mark - 图片表情
/**
 *   图片表情描述
 */
@property (copy,nonatomic) NSString *chs;
/**
 *   图片名称
 */
@property (copy,nonatomic) NSString *png;


// 判断是否为emoji表情标识
@property (assign,nonatomic,getter=isEmoji) BOOL emoji;
// 拼接路径
@property (nonatomic,copy) NSString *path;

#pragma mark
#pragma mark -

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)emoticonWithDict:(NSDictionary *)dict;



@end
