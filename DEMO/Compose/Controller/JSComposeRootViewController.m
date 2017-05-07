//
//  JSComposeRootViewController.m
//  Weibo_Object-C
//
//  Created by ShenYj on 16/9/27.
//  Copyright © 2016年 ___ShenYJ___. All rights reserved.
//

#import "JSComposeRootViewController.h"
#import "JSComposeToolBar.h"
#import "JSEmoticonKeyboardView.h"
#import "JSEmoticonModel.h"
#import "JSEmoticonTool.h"
#import "JSEmoticonTextAttachment.h"

CGFloat const kPictureMarginHorizontal = 10.f; // 配图视图左右的间距
CGFloat const kKeyboardViewHeigth = 216.f;     // 自定义表情键盘高度
extern CGFloat itemSize;

@interface JSComposeRootViewController ()

// 底部ToolBar
@property (nonatomic) JSComposeToolBar *composeToolBar;
// 自定义表情键盘
@property (nonatomic) JSEmoticonKeyboardView *keyboardView;


@end

@implementation JSComposeRootViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.keyboardView];

}


- (JSComposeToolBar *)composeToolBar {
    
    if (_composeToolBar == nil) {
        _composeToolBar = [[JSComposeToolBar alloc] init];
        
        
    }
    return _composeToolBar;
}

- (JSEmoticonKeyboardView *)keyboardView {
    
    if (_keyboardView == nil) {
        _keyboardView = [[JSEmoticonKeyboardView alloc] init];
        _keyboardView.frame = CGRectMake(0, 20, SCREEN_WIDTH, kKeyboardViewHeigth);
        _keyboardView.backgroundColor = [[UIColor orangeColor] colorWithAlphaComponent:0.5];
    }
    return _keyboardView;
}



@end
