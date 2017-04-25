//
//  GaoDeSettingController.m
//  WRCellViewDemo
//
//  Created by wangrui on 2017/4/25.
//  Copyright © 2017年 wangrui. All rights reserved.
//

#import "GaoDeSettingController.h"
#import "WRCellView.h"

#define kScreenWidth      [UIScreen mainScreen].bounds.size.width
#define WRCellViewHeight  50
#define kBackColor [UIColor colorWithRed:239/255.0 green:239/255.0 blue:244/255.0 alpha:1.0]

@interface GaoDeSettingController ()
@property (nonatomic, strong) UIScrollView* containerView;
@property (nonatomic, strong) WRCellView*   wrCellView1;
@property (nonatomic, strong) WRCellView*   wrCellView2;
@property (nonatomic, strong) WRCellView*   wrCellView3;
@property (nonatomic, strong) WRCellView*   wrCellView4;
@property (nonatomic, strong) WRCellView*   wrCellView5;
@property (nonatomic, strong) WRCellView*   wrCellView6;
@property (nonatomic, strong) WRCellView*   wrCellView7;
@property (nonatomic, strong) WRCellView*   wrCellView8;
@property (nonatomic, strong) WRCellView*   wrCellView9;
@end

@implementation GaoDeSettingController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = kBackColor;
    self.title = @"我的";
    
    self.containerView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, kScreenWidth, self.view.bounds.size.height)];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.view addSubview:self.containerView];
    
    [self addViews];
    [self setCellFrame];
    [self onClickEvent];
}

- (void)addViews
{
    [self.containerView addSubview:self.wrCellView1];
    [self.containerView addSubview:self.wrCellView2];
    [self.containerView addSubview:self.wrCellView3];
    [self.containerView addSubview:self.wrCellView4];
    [self.containerView addSubview:self.wrCellView5];
    [self.containerView addSubview:self.wrCellView6];
    [self.containerView addSubview:self.wrCellView7];
    [self.containerView addSubview:self.wrCellView8];
    [self.containerView addSubview:self.wrCellView9];
}

- (void)setCellFrame
{
    self.wrCellView1.frame = CGRectMake(0, 15, kScreenWidth, WRCellViewHeight);
    
    self.wrCellView2.frame = CGRectMake(0, _wrCellView1.frame.origin.y + WRCellViewHeight + 10, kScreenWidth, WRCellViewHeight);
    self.wrCellView3.frame = CGRectMake(0, _wrCellView2.frame.origin.y + WRCellViewHeight, kScreenWidth, WRCellViewHeight);
    self.wrCellView4.frame = CGRectMake(0, _wrCellView3.frame.origin.y + WRCellViewHeight, kScreenWidth, WRCellViewHeight);
    
    self.wrCellView5.frame = CGRectMake(0, _wrCellView4.frame.origin.y + WRCellViewHeight + 10, kScreenWidth, WRCellViewHeight);
    
    self.wrCellView6.frame = CGRectMake(0, _wrCellView5.frame.origin.y + WRCellViewHeight + 10, kScreenWidth, WRCellViewHeight);
    self.wrCellView7.frame = CGRectMake(0, _wrCellView6.frame.origin.y + WRCellViewHeight, kScreenWidth, WRCellViewHeight);
    self.wrCellView8.frame = CGRectMake(0, _wrCellView7.frame.origin.y + WRCellViewHeight, kScreenWidth, WRCellViewHeight);
    self.wrCellView9.frame = CGRectMake(0, _wrCellView8.frame.origin.y + WRCellViewHeight, kScreenWidth, WRCellViewHeight);
    
    self.containerView.contentSize = CGSizeMake(0, self.wrCellView9.frame.origin.y+WRCellViewHeight+100);
}

- (void)onClickEvent
{
    __weak typeof(self) weakSelf = self;
    self.wrCellView1.tapBlock = ^ {
        __strong typeof(self) pThis = weakSelf;
        [pThis openNewVC];
    };
    self.wrCellView2.tapBlock = ^ {
        __strong typeof(self) pThis = weakSelf;
        [pThis openNewVC];
    };
    self.wrCellView3.tapBlock = ^ {
        __strong typeof(self) pThis = weakSelf;
        [pThis openNewVC];
    };
    self.wrCellView4.tapBlock = ^ {
        __strong typeof(self) pThis = weakSelf;
        [pThis openNewVC];
    };
    self.wrCellView5.tapBlock = ^ {
        __strong typeof(self) pThis = weakSelf;
        [pThis openNewVC];
    };
    self.wrCellView6.tapBlock = ^ {
        __strong typeof(self) pThis = weakSelf;
        [pThis openNewVC];
    };
    self.wrCellView7.tapBlock = ^ {
        __strong typeof(self) pThis = weakSelf;
        [pThis openNewVC];
    };
    self.wrCellView8.tapBlock = ^ {
        __strong typeof(self) pThis = weakSelf;
        [pThis openNewVC];
    };
    self.wrCellView9.tapBlock = ^ {
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

- (WRCellView *)wrCellView1 {
    if (_wrCellView1 == nil) {
        _wrCellView1 = [[WRCellView alloc] initWithLineStyle:WRCellStyleIconLabel_Indicator];
        _wrCellView1.leftLabel.text = @"工具箱";
        _wrCellView1.leftIcon.image = [UIImage imageNamed:@"shakeBonus"];
        [_wrCellView1 setHideBottomLine:YES];
    }
    return _wrCellView1;
}

- (WRCellView *)wrCellView2 {
    if (_wrCellView2 == nil) {
        _wrCellView2 = [[WRCellView alloc] initWithLineStyle:WRCellStyleIconLabel_LabelIndicator];
        _wrCellView2.leftLabel.text = @"财富";
        _wrCellView2.rightLabel.text = @"钱包订单";
        _wrCellView2.leftIcon.image = [UIImage imageNamed:@"myFriendIcon"];
        [_wrCellView2 setLineStyleWithLeftEqualLabelLeft];
    }
    return _wrCellView2;
}

- (WRCellView *)wrCellView3 {
    if (_wrCellView3 == nil) {
        _wrCellView3 = [[WRCellView alloc] initWithLineStyle:WRCellStyleIconLabel_LabelIndicator];
        _wrCellView3.leftLabel.text = @"活动专区";
        _wrCellView3.rightLabel.text = @"车主福利，优惠5折起";
        _wrCellView3.leftIcon.image = [UIImage imageNamed:@"myFriendIcon"];
        [_wrCellView3 setLineStyleWithLeftEqualLabelLeft];
    }
    return _wrCellView3;
}

- (WRCellView *)wrCellView4 {
    if (_wrCellView4 == nil) {
        _wrCellView4 = [[WRCellView alloc] initWithLineStyle:WRCellStyleIconLabel_LabelIndicator];
        _wrCellView4.leftLabel.text = @"驾车头条";
        _wrCellView4.rightLabel.text = @"小车五一高速免费，但......";
        _wrCellView4.leftIcon.image = [UIImage imageNamed:@"myFriendIcon"];
        [_wrCellView4 setHideBottomLine:YES];
    }
    return _wrCellView4;
}

- (WRCellView *)wrCellView5 {
    if (_wrCellView5 == nil) {
        _wrCellView5 = [[WRCellView alloc] initWithLineStyle:WRCellStyleIconLabel_LabelIndicator];
        _wrCellView5.leftLabel.text = @"我的评论";
        _wrCellView5.rightLabel.text = @"写评论赢海量金币";
        _wrCellView5.leftIcon.image = [UIImage imageNamed:@"myFriendIcon"];
        [_wrCellView5 setHideBottomLine:YES];
    }
    return _wrCellView5;
}

- (WRCellView *)wrCellView6 {
    if (_wrCellView6 == nil) {
        _wrCellView6 = [[WRCellView alloc] initWithLineStyle:WRCellStyleIconLabel_LabelIndicator];
        _wrCellView6.leftLabel.text = @"扫一扫";
        _wrCellView6.rightLabel.text = @"高德地图手机版扫码登录";
        _wrCellView6.leftIcon.image = [UIImage imageNamed:@"myFriendIcon"];
        [_wrCellView6 setLineStyleWithLeftEqualLabelLeft];
    }
    return _wrCellView6;
}

- (WRCellView *)wrCellView7 {
    if (_wrCellView7 == nil) {
        _wrCellView7 = [[WRCellView alloc] initWithLineStyle:WRCellStyleIconLabel_Indicator];
        _wrCellView7.leftLabel.text = @"设置";
        _wrCellView7.leftIcon.image = [UIImage imageNamed:@"shakeBonus"];
        [_wrCellView7 setLineStyleWithLeftEqualLabelLeft];
    }
    return _wrCellView7;
}

- (WRCellView *)wrCellView8 {
    if (_wrCellView8 == nil) {
        _wrCellView8 = [[WRCellView alloc] initWithLineStyle:WRCellStyleIconLabel_Indicator];
        _wrCellView8.leftLabel.text = @"帮助与反馈";
        _wrCellView8.leftIcon.image = [UIImage imageNamed:@"shakeBonus"];
        [_wrCellView8 setLineStyleWithLeftEqualLabelLeft];
    }
    return _wrCellView8;
}

- (WRCellView *)wrCellView9 {
    if (_wrCellView9 == nil) {
        _wrCellView9 = [[WRCellView alloc] initWithLineStyle:WRCellStyleIconLabel_Indicator];
        _wrCellView9.leftLabel.text = @"特别鸣谢";
        _wrCellView9.leftIcon.image = [UIImage imageNamed:@"shakeBonus"];
        [_wrCellView9 setHideBottomLine:YES];
    }
    return _wrCellView9;
}

@end
