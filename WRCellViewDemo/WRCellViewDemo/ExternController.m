//
//  ExternController.m
//  WRCellViewDemo
//
//  Created by wangrui on 2017/5/4.
//  Copyright © 2017年 wangrui. All rights reserved.
//

#import "ExternController.h"
#import "WRCellView.h"

#define kScreenWidth      [UIScreen mainScreen].bounds.size.width
#define WRCellViewHeight  50
#define kBackColor [UIColor colorWithRed:239/255.0 green:239/255.0 blue:244/255.0 alpha:1.0]

@interface ExternController ()
@property (nonatomic, strong) UIScrollView* containerView;
@property (nonatomic, strong) WRCellView *switchView;
@property (nonatomic, strong) UISwitch *custSwitch;
@end

@implementation ExternController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = kBackColor;
    self.title = @"添加自定义view";
    
    self.containerView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, kScreenWidth, self.view.bounds.size.height)];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.view addSubview:self.containerView];
    
    [self addViews];
    [self setCellFrame];
    [self onClickEvent];
    [self addSwitchToSwitchView];
}

- (void)addSwitchToSwitchView
{
    self.custSwitch = [[UISwitch alloc] init];
    [self.switchView addSubview:self.custSwitch];
    CGRect frame = self.custSwitch.frame;
    frame.origin.x = kScreenWidth - frame.size.width - 16;
    frame.origin.y = (self.switchView.bounds.size.height - frame.size.height) / 2;
    self.custSwitch.frame = frame;
    self.custSwitch.on = YES;
}

- (void)addViews
{
    [self.containerView addSubview:self.switchView];
}

- (void)setCellFrame
{
    self.switchView.frame = CGRectMake(0, 30, kScreenWidth, WRCellViewHeight);
    self.containerView.contentSize = CGSizeMake(0, self.switchView.frame.origin.y + WRCellViewHeight + 100);
}

- (void)onClickEvent
{
    __weak typeof(self) weakSelf = self;
    
    // 让其不可点击
    __strong typeof(self) pThis = weakSelf;
    
}

#pragma mark - getter
- (WRCellView *)switchView {
    if (_switchView == nil) {
        _switchView = [[WRCellView alloc] initWithLineStyle:WRCellStyleLabel_];
        _switchView.leftLabel.text = @"右边是自定义view";
    }
    return _switchView;
}

@end
