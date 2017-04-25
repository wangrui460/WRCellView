//
//  MineInfoController.m
//  WRCellViewDemo
//
//  Created by wangrui on 2017/4/25.
//  Copyright © 2017年 wangrui. All rights reserved.
//

#import "MineInfoController.h"
#import "WRCellView.h"

#define kScreenWidth      [UIScreen mainScreen].bounds.size.width
#define WRCellViewHeight  50
#define kBackColor [UIColor colorWithRed:239/255.0 green:239/255.0 blue:244/255.0 alpha:1.0]

@interface MineInfoController ()
@property (nonatomic, strong) UIScrollView* containerView;
@property (nonatomic, strong) WRCellView*   headerView;
@property (nonatomic, strong) WRCellView*   nameView;
@property (nonatomic, strong) WRCellView*   wxNumberView;
@property (nonatomic, strong) WRCellView*   mineQRView;
@property (nonatomic, strong) WRCellView*   addressView;
@property (nonatomic, strong) WRCellView*   sexView;
@property (nonatomic, strong) WRCellView*   areaView;
@property (nonatomic, strong) WRCellView*   signView;
@end

@implementation MineInfoController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = kBackColor;
    self.title = @"个人信息";
    
    self.containerView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, kScreenWidth, self.view.bounds.size.height)];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.view addSubview:self.containerView];
    
    [self addViews];
    [self setCellFrame];
    [self onClickEvent];
}

- (void)addViews
{
    [self.containerView addSubview:self.headerView];
    [self.containerView addSubview:self.nameView];
    [self.containerView addSubview:self.wxNumberView];
    [self.containerView addSubview:self.mineQRView];
    [self.containerView addSubview:self.addressView];
    [self.containerView addSubview:self.sexView];
    [self.containerView addSubview:self.areaView];
    [self.containerView addSubview:self.signView];
}

- (void)setCellFrame
{
    self.headerView.frame = CGRectMake(0, 15, kScreenWidth, 100);
    self.nameView.frame = CGRectMake(0, _headerView.frame.origin.y + self.headerView.bounds.size.height, kScreenWidth, WRCellViewHeight);
    
    self.wxNumberView.frame = CGRectMake(0, _nameView.frame.origin.y + WRCellViewHeight, kScreenWidth, WRCellViewHeight);
    self.mineQRView.frame = CGRectMake(0, _wxNumberView.frame.origin.y + WRCellViewHeight, kScreenWidth, WRCellViewHeight);
    self.addressView.frame = CGRectMake(0, _mineQRView.frame.origin.y + WRCellViewHeight, kScreenWidth, WRCellViewHeight);
    self.sexView.frame = CGRectMake(0, _addressView.frame.origin.y+20 + WRCellViewHeight, kScreenWidth, WRCellViewHeight);
    self.areaView.frame = CGRectMake(0, _sexView.frame.origin.y + WRCellViewHeight, kScreenWidth, WRCellViewHeight);
    self.signView.frame = CGRectMake(0, _areaView.frame.origin.y + WRCellViewHeight, kScreenWidth, WRCellViewHeight);
    
    self.containerView.contentSize = CGSizeMake(0, self.signView.frame.origin.y+WRCellViewHeight+100);
}

- (void)onClickEvent
{
    __weak typeof(self) weakSelf = self;
    self.headerView.tapBlock = ^ {
        __strong typeof(self) pThis = weakSelf;
        [pThis openNewVC];
    };
    self.nameView.tapBlock = ^ {
        __strong typeof(self) pThis = weakSelf;
        [pThis openNewVC];
    };
    self.wxNumberView.tapBlock = ^ {
        __strong typeof(self) pThis = weakSelf;
        [pThis openNewVC];
    };
    self.mineQRView.tapBlock = ^ {
        __strong typeof(self) pThis = weakSelf;
        [pThis openNewVC];
    };
    self.addressView.tapBlock = ^ {
        __strong typeof(self) pThis = weakSelf;
        [pThis openNewVC];
    };
    self.sexView.tapBlock = ^ {
        __strong typeof(self) pThis = weakSelf;
        [pThis openNewVC];
    };
    self.areaView.tapBlock = ^ {
        __strong typeof(self) pThis = weakSelf;
        [pThis openNewVC];
    };
    self.signView.tapBlock = ^ {
        __strong typeof(self) pThis = weakSelf;
        [pThis openNewVC];
    };
}

- (void)openNewVC
{
    UIViewController *vc = [UIViewController new];
    vc.view.backgroundColor = [UIColor whiteColor];
    vc.title = @"滴答滴答";
    [self.navigationController pushViewController:vc animated:YES];
}

- (WRCellView *)headerView {
    if (_headerView == nil) {
        _headerView = [[WRCellView alloc] initWithLineStyle:WRCellStyleLabel_IconIndicator];
        _headerView.leftLabel.text = @"头像";
        _headerView.rightIcon.image = [UIImage imageNamed:@"header"];
    }
    return _headerView;
}

- (WRCellView *)mineQRView {
    if (_mineQRView == nil) {
        _mineQRView = [[WRCellView alloc] initWithLineStyle:WRCellStyleLabel_IconIndicator];
        _mineQRView.leftLabel.text = @"我的二维码";
        _mineQRView.rightIcon.image = [UIImage imageNamed:@"myFriendIcon"];
    }
    return _mineQRView;
}

- (WRCellView *)wxNumberView {
    if (_wxNumberView == nil) {
        _wxNumberView = [[WRCellView alloc] initWithLineStyle:WRCellStyleLabel_Label];
        _wxNumberView.leftLabel.text = @"微信号";
        _wxNumberView.rightLabel.text = @"wr110120119";
    }
    return _wxNumberView;
}

- (WRCellView *)addressView {
    if (_addressView == nil) {
        _addressView = [[WRCellView alloc] initWithLineStyle:WRCellStyleLabel_Indicator];
        _addressView.leftLabel.text = @"我的地址";
        [_addressView setLineStyleWithLeftZero];
    }
    return _addressView;
}

- (WRCellView *)nameView {
    if (_nameView == nil) {
        _nameView = [[WRCellView alloc] initWithLineStyle:WRCellStyleLabel_LabelIndicator];
        _nameView.leftLabel.text = @"名字";
        _nameView.rightLabel.text = @"你大爷终究是你大爷";
    }
    return _nameView;
}

- (WRCellView *)sexView {
    if (_sexView == nil) {
        _sexView = [[WRCellView alloc] initWithLineStyle:WRCellStyleLabel_LabelIndicator];
        _sexView.leftLabel.text = @"性别";
        _sexView.rightLabel.text = @"男";
    }
    return _sexView;
}

- (WRCellView *)areaView {
    if (_areaView == nil) {
        _areaView = [[WRCellView alloc] initWithLineStyle:WRCellStyleLabel_LabelIndicator];
        _areaView.leftLabel.text = @"地区";
        _areaView.rightLabel.text = @"上海 徐汇";
    }
    return _areaView;
}

- (WRCellView *)signView {
    if (_signView == nil) {
        _signView = [[WRCellView alloc] initWithLineStyle:WRCellStyleLabel_LabelIndicator];
        _signView.leftLabel.text = @"个性签名";
        _signView.rightLabel.text = @"爱别人的同事也是爱自己";
        [_signView setLineStyleWithLeftZero];
    }
    return _signView;
}





@end
