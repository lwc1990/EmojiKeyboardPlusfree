//
//  SelecteView.m
//  DEMO
//
//  Created by 姜自佳 on 2017/5/7.
//  Copyright © 2017年 MOMO. All rights reserved.
//

#import "SelecteView.h"
@interface SelecteView()
@property(nonatomic,strong)UIScrollView * selectScrollView;

// 记录选中按钮
@property (nonatomic) UIButton *currentButton;

@end
@implementation SelecteView


- (void)addItems:(NSArray*)emotions{
        CGFloat width = 100;
        NSInteger count = emotions.count;
        UIScrollView* scrollView = self.selectScrollView;
        [self addSubview:scrollView];
        NSArray* arr = @[@"默认",@"emoji",@"浪小花",@"默认2",@"emoji2",@"浪小花2"];
        UIView *containerView= [UIView new];
        [scrollView addSubview:containerView];
        [containerView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(scrollView);
            make.height.equalTo(scrollView);
        }];
    
    
        for (NSInteger i = 0; i<count; i++) {
            UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
            [btn1 addTarget:self action:@selector(scrBtn:) forControlEvents:UIControlEventTouchUpInside];
            [btn1 setTitle:arr[i] forState:UIControlStateNormal];
            [btn1 setBackgroundColor:randomColor];
            [btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [btn1 setTitleColor:[UIColor purpleColor] forState:UIControlStateSelected];
            UIView* lastButton = containerView.subviews.lastObject;
            [containerView addSubview:btn1];

            [btn1 mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.top.height.equalTo(containerView);
                make.width.mas_equalTo(width);      //确定width后，只要再确定left，就可以在水平方向上完全确定

                if(i==0){
                    make.left.equalTo(containerView);
                }
                else if(lastButton){
                    make.left.mas_equalTo(lastButton.mas_right);
                }
                
                if(i==count-1){
                    make.right.equalTo(containerView);
                }
            }];

            
        }
        scrollView.contentSize = CGSizeMake(width*count, 0);
}

-(void)scrBtn:(UIButton *)sender
{
   
    [self setContentOfset:sender];
    
    if (self.currentButton == sender) {
        return;
    }
    
    self.currentButton.selected = NO;
    sender.selected = YES;
    self.currentButton = sender;
    
    if (self.clickCompeletionHandler) {
        self.clickCompeletionHandler(sender);
    }
    
    
}



- (void)setContentOfset:(UIButton *)sender{
    UIScrollView* scrollView = self.selectScrollView;
    //只选择sender.x < 偏移量.x  或者 最大x > 偏移量.x的情况才做处理
    //也就是点击的是可见的并且完全显示的button 那么不作处理
    if ((sender.frame.origin.x >= scrollView.contentOffset.x) && CGRectGetMaxX(sender.frame)<= scrollView.contentOffset.x + scrollView.bounds.size.width)
    {
        return;
    }
    CGFloat offsetX = 0;
    //如果左边 按钮x 小于contentOffset.x 那么算出button.x于contentOffset.x的偏移量
    if (sender.frame.origin.x <= scrollView.contentOffset.x)
    {
        offsetX = sender.frame.origin.x - scrollView.contentOffset.x;
    }
    else
    {
        //button最大偏移量 - scrollView偏移量 + scrollView.width
        offsetX = CGRectGetMaxX(sender.frame) - (scrollView.contentOffset.x + scrollView.bounds.size.width);
    }
    //当前偏移量加上offsetX
    [UIView animateWithDuration:0.25 animations:^{
        CGPoint originOffSet = scrollView.contentOffset;
        originOffSet.x = originOffSet.x + offsetX;
        scrollView.contentOffset = originOffSet;
    }];
    
    
    
}



- (void)setCurrentButtonIndex:(NSInteger)index {
    
    UIButton *button = self.selectScrollView.subviews.firstObject.subviews[index];
    if (self.currentButton == button) {
        return;
    }
    [self setContentOfset:button];
    self.currentButton.selected = NO;
    button.selected = YES;
    self.currentButton = button;
    
}


- (UIScrollView *)selectScrollView{
    if(!_selectScrollView){
        _selectScrollView = [UIScrollView  new];
        _selectScrollView.showsHorizontalScrollIndicator = NO;
        _selectScrollView.showsVerticalScrollIndicator = NO;
        [self addSubview:_selectScrollView];
        [_selectScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
    }
    return _selectScrollView;
}
@end
