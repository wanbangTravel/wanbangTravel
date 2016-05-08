//
//  ScrollTitleView.m
//  WanBangTravel
//
//  Created by 沈凡 on 16/4/15.
//  Copyright © 2016年 mmt&sf. All rights reserved.
//

#import "ScrollTitleView.h"

#define MARGIN 20
#define VIEW_HEIGHT self.frame.size.height
#define VIEW_WIDTH self.frame.size.width

@interface ScrollTitleView ()

@property (nonatomic, strong) UIView *scrollTextView;

@end

@implementation ScrollTitleView

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self generateScrollTitleView];
    }
    return self;
}

- (void)generateScrollTitleView {
    
    UIImageView *titleImageView = [[UIImageView alloc] init];
    CGFloat imgWidth = 100;
    CGFloat imgHeight = 30;
    CGFloat imgX = MARGIN;
    CGFloat imgY = (VIEW_HEIGHT - imgHeight) / 2;
    titleImageView.frame = CGRectMake(imgX, imgY, imgWidth, imgHeight);
    [titleImageView setBackgroundColor:[UIColor greenColor]];
    [self addSubview:titleImageView];
    
    UILabel *scrollLabel = [[UILabel alloc] init];
    CGFloat txtWidth = VIEW_WIDTH - imgWidth - MARGIN;
    CGFloat txtHeight = 20;
    CGFloat txtX = CGRectGetMaxX(titleImageView.frame) + MARGIN;
    CGFloat txtY = (VIEW_HEIGHT - txtHeight) / 2;
    scrollLabel.frame = CGRectMake(txtX, txtY, txtWidth, txtHeight);
    [scrollLabel setText:@"万邦促销促销......"];
    [scrollLabel setTextAlignment:NSTextAlignmentLeft];
    [scrollLabel setTextColor:[UIColor redColor]];
    [scrollLabel setNumberOfLines:0];
    [scrollLabel setLineBreakMode:NSLineBreakByWordWrapping];
    _scrollTextView = scrollLabel;
    [self addSubview:scrollLabel];
    
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:4 target:self selector:@selector(makeTextScroll) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:@"mode"];
}

- (void)makeTextScroll {

    [self.scrollTextView sizeToFit];
    CGRect frame = self.scrollTextView.frame;
    self.scrollTextView.frame = frame;
    
    [UIView beginAnimations:@"testAnimation" context:NULL];
    [UIView setAnimationDuration:8.8f];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationRepeatAutoreverses:NO];
    [UIView setAnimationRepeatCount:999999];
    
    frame = self.scrollTextView.frame;
    frame.origin.y = -frame.size.height;
    self.scrollTextView.frame = frame;
    [UIView commitAnimations];
}
@end
