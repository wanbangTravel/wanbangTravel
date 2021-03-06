//
//  SegementView.m
//  WanBangTravel
//
//  Created by 沈凡 on 16/4/15.
//  Copyright © 2016年 mmt&sf. All rights reserved.
//

#import "SegementView.h"

#define VIEW_WIDTH self.bounds.size.width
#define VIEW_HEIGHT self.bounds.size.height

@interface SegementView ()

@end

@implementation SegementView


- (instancetype)init {
    if (self = [super init]) {
        [self generateView];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self generateView];
    }
    return self;
}

- (void)generateView {
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame  = CGRectMake(0, 0,VIEW_WIDTH / 2, VIEW_HEIGHT);
    //[[UIButton alloc] initWithFrame:CGRectMake(0, 0,VIEW_WIDTH / 2, VIEW_HEIGHT)];
    leftBtn.titleLabel.textColor = [UIColor redColor];
    [leftBtn setTitle:@"度周末" forState:UIControlStateNormal];
    [leftBtn setBackgroundColor:[UIColor redColor]];
    
    [self addSubview:leftBtn];
    
    UIButton *rightBtn = [[UIButton alloc] initWithFrame:CGRectMake(VIEW_WIDTH/ 2, 0, VIEW_WIDTH / 2, VIEW_HEIGHT)];
    [rightBtn setTitle:@"度长假" forState:UIControlStateNormal];
    rightBtn.titleLabel.textColor = [UIColor redColor];
      [rightBtn setBackgroundColor:[UIColor redColor]];
    [self addSubview:rightBtn];
}

@end
