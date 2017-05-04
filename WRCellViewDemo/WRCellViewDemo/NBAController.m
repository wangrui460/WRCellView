//
//  NBAController.m
//  WRCellViewDemo
//
//  Created by wangrui on 2017/4/25.
//  Copyright © 2017年 wangrui. All rights reserved.
//

#import "NBAController.h"
#import "WRCellView.h"

#define kScreenWidth      [UIScreen mainScreen].bounds.size.width
#define WRCellViewHeight  50
#define WRCellViewTitleHeight  25
#define kBackColor [UIColor colorWithRed:239/255.0 green:239/255.0 blue:244/255.0 alpha:1.0]

@interface NBAController ()
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

@implementation NBAController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = kBackColor;
    self.title = @"更多";
    
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
    self.wrCellView1.frame = CGRectMake(0, 10, kScreenWidth, WRCellViewTitleHeight);
    
    self.wrCellView2.frame = CGRectMake(0, _wrCellView1.frame.origin.y + WRCellViewTitleHeight, kScreenWidth, WRCellViewHeight);
    self.wrCellView3.frame = CGRectMake(0, _wrCellView2.frame.origin.y + WRCellViewHeight, kScreenWidth, WRCellViewHeight);
    self.wrCellView4.frame = CGRectMake(0, _wrCellView3.frame.origin.y + WRCellViewHeight, kScreenWidth, WRCellViewHeight);
    
    self.wrCellView5.frame = CGRectMake(0, _wrCellView4.frame.origin.y + WRCellViewHeight, kScreenWidth, WRCellViewHeight);
    
    self.wrCellView6.frame = CGRectMake(0, _wrCellView5.frame.origin.y + WRCellViewHeight + 10, kScreenWidth, WRCellViewTitleHeight);
    self.wrCellView7.frame = CGRectMake(0, _wrCellView6.frame.origin.y + WRCellViewTitleHeight, kScreenWidth, WRCellViewHeight);
    self.wrCellView8.frame = CGRectMake(0, _wrCellView7.frame.origin.y + WRCellViewHeight + 10, kScreenWidth, WRCellViewTitleHeight);
    self.wrCellView9.frame = CGRectMake(0, _wrCellView8.frame.origin.y + WRCellViewTitleHeight, kScreenWidth, WRCellViewHeight);
    
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
        _wrCellView1 = [[WRCellView alloc] initWithLineStyle:WRCellStyleLabel_];
        _wrCellView1.leftLabel.text = @"内容";
        _wrCellView1.backgroundColor = self.view.backgroundColor;
        _wrCellView1.leftLabel.textColor = _wrCellView1.rightLabel.textColor;
        _wrCellView1.leftLabel.font = _wrCellView1.rightLabel.font;
        [_wrCellView1 setHideBottomLine:YES];
        [_wrCellView1 setCanNotSelected];
    }
    return _wrCellView1;
}

- (WRCellView *)wrCellView2 {
    if (_wrCellView2 == nil) {
        _wrCellView2 = [[WRCellView alloc] initWithLineStyle:WRCellStyleIconLabel_Indicator];
        _wrCellView2.leftLabel.text = @"球队";
        _wrCellView2.leftIcon.image = [UIImage imageNamed:@"nba"];
        [_wrCellView2 setShowTopLine:YES];
        [_wrCellView2 setLineStyleWithLeftEqualLabelLeft];
    }
    return _wrCellView2;
}

- (WRCellView *)wrCellView3 {
    if (_wrCellView3 == nil) {
        _wrCellView3 = [[WRCellView alloc] initWithLineStyle:WRCellStyleIconLabel_Indicator];
        _wrCellView3.leftLabel.text = @"球员";
        _wrCellView3.leftIcon.image = [UIImage imageNamed:@"nba"];
        [_wrCellView3 setLineStyleWithLeftEqualLabelLeft];
    }
    return _wrCellView3;
}

- (WRCellView *)wrCellView4 {
    if (_wrCellView4 == nil) {
        _wrCellView4 = [[WRCellView alloc] initWithLineStyle:WRCellStyleIconLabel_Indicator];
        _wrCellView4.leftLabel.text = @"重要日期";
        _wrCellView4.leftIcon.image = [UIImage imageNamed:@"nba"];
        [_wrCellView4 setLineStyleWithLeftEqualLabelLeft];
    }
    return _wrCellView4;
}

- (WRCellView *)wrCellView5 {
    if (_wrCellView5 == nil) {
        _wrCellView5 = [[WRCellView alloc] initWithLineStyle:WRCellStyleIconLabel_Indicator];
        _wrCellView5.leftLabel.text = @"季后赛对阵";
        _wrCellView5.leftIcon.image = [UIImage imageNamed:@"nba"];
        [_wrCellView5 setLineStyleWithLeftZero];
    }
    return _wrCellView5;
}

- (WRCellView *)wrCellView6 {
    if (_wrCellView6 == nil) {
        _wrCellView6 = [[WRCellView alloc] initWithLineStyle:WRCellStyleLabel_];
        _wrCellView6.leftLabel.text = @"赛事互动";
        _wrCellView6.backgroundColor = self.view.backgroundColor;
        _wrCellView6.leftLabel.textColor = _wrCellView6.rightLabel.textColor;
        _wrCellView6.leftLabel.font = _wrCellView6.rightLabel.font;
        [_wrCellView6 setHideBottomLine:YES];
        [_wrCellView6 setCanNotSelected];
    }
    return _wrCellView6;
}

- (WRCellView *)wrCellView7 {
    if (_wrCellView7 == nil) {
        _wrCellView7 = [[WRCellView alloc] initWithLineStyle:WRCellStyleIcon_Indicator];
        _wrCellView7.leftIcon.image = [UIImage imageNamed:@"ttNba"];
        [_wrCellView7 setShowTopLine:YES];
        [_wrCellView7 setLineStyleWithLeftZero];
    }
    return _wrCellView7;
}

- (WRCellView *)wrCellView8 {
    if (_wrCellView8 == nil) {
        _wrCellView8 = [[WRCellView alloc] initWithLineStyle:WRCellStyleLabel_];
        _wrCellView8.leftLabel.text = @"购物";
        _wrCellView8.backgroundColor = self.view.backgroundColor;
        _wrCellView8.leftLabel.textColor = _wrCellView8.rightLabel.textColor;
        _wrCellView8.leftLabel.font = _wrCellView8.rightLabel.font;
        [_wrCellView8 setHideBottomLine:YES];
        [_wrCellView8 setCanNotSelected];
    }
    return _wrCellView8;
}

- (WRCellView *)wrCellView9 {
    if (_wrCellView9 == nil) {
        _wrCellView9 = [[WRCellView alloc] initWithLineStyle:WRCellStyleIcon_Indicator];
        _wrCellView9.leftIcon.image = [UIImage imageNamed:@"nbaStore"];
        [_wrCellView9 setShowTopLine:YES];
        [_wrCellView9 setLineStyleWithLeftZero];
    }
    return _wrCellView9;
}

@end
