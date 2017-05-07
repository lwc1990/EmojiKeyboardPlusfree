//
//  SelecteView.h
//  DEMO
//
//  Created by 姜自佳 on 2017/5/7.
//  Copyright © 2017年 MOMO. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SelecteView : UIView

- (void)addItems:(NSArray*)emotions;


// 点击按钮回调
@property (copy,nonatomic) void(^clickCompeletionHandler)(UIButton *button);

// 设置当前选中按钮
- (void)setCurrentButtonIndex:(NSInteger)index;

@end
