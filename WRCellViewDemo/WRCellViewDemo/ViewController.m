//
//  ViewController.m
//  WRCellViewDemo
//
//  Created by wangrui on 2017/4/24.
//  Copyright © 2017年 wangrui. All rights reserved.
//

#import "ViewController.h"
#import "WRCellView.h"

#define kScreenWidth      [UIScreen mainScreen].bounds.size.width
#define WRCellViewHeight  50
#define kBackColor [UIColor colorWithRed:247/255.0 green:247/255.0 blue:247/255.0 alpha:1.0]

@interface ViewController ()
@property (nonatomic, strong) UIScrollView* containerView;
@property (nonatomic, strong) WRCellView*   leftLabelView;
@property (nonatomic, strong) WRCellView*   rightLabelView;
@property (nonatomic, strong) WRCellView*   label_IndicatorView;
@property (nonatomic, strong) WRCellView*   label_LabelIconIndicatorView;
@property (nonatomic, strong) WRCellView*   label_LabelIndicatorView;
@property (nonatomic, strong) WRCellView*   label_LabelView;
@property (nonatomic, strong) WRCellView*   label_IconView;
@property (nonatomic, strong) WRCellView*   label_IconIndicatorView;
@property (nonatomic, strong) WRCellView*   iconLabel_IndicatorView;
@property (nonatomic, strong) WRCellView*   iconLabel_IconView;
@property (nonatomic, strong) WRCellView*   iconLabel_LabelIndicatorView;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.containerView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, kScreenWidth, self.view.bounds.size.height)];
    self.containerView.backgroundColor = kBackColor;
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.view addSubview:self.containerView];

    [self addViews];
    [self setCellFrame];
    [self onClickEvent];
}

- (void)addViews
{
    [self.containerView addSubview:self.leftLabelView];
    [self.containerView addSubview:self.rightLabelView];
    [self.containerView addSubview:self.label_IndicatorView];
    [self.containerView addSubview:self.label_LabelIconIndicatorView];
    [self.containerView addSubview:self.label_LabelIndicatorView];
    [self.containerView addSubview:self.label_LabelView];
    [self.containerView addSubview:self.label_IconView];
    [self.containerView addSubview:self.label_IconIndicatorView];
    [self.containerView addSubview:self.iconLabel_IndicatorView];
    [self.containerView addSubview:self.iconLabel_IconView];
    [self.containerView addSubview:self.iconLabel_LabelIndicatorView];
}

- (void)setCellFrame
{
    self.leftLabelView.frame = CGRectMake(0, 20, kScreenWidth, WRCellViewHeight);
    self.rightLabelView.frame = CGRectMake(0, _leftLabelView.frame.origin.y + WRCellViewHeight, kScreenWidth, WRCellViewHeight);
    
    
    self.label_IndicatorView.frame = CGRectMake(0, _rightLabelView.frame.origin.y+20 + WRCellViewHeight, kScreenWidth, WRCellViewHeight);
    self.label_LabelIndicatorView.frame = CGRectMake(0, _label_IndicatorView.frame.origin.y + WRCellViewHeight, kScreenWidth, WRCellViewHeight);
    self.label_LabelView.frame = CGRectMake(0, _label_LabelIndicatorView.frame.origin.y + WRCellViewHeight, kScreenWidth, WRCellViewHeight);
    
    
    self.label_IconView.frame = CGRectMake(0, _label_LabelView.frame.origin.y+20 + WRCellViewHeight, kScreenWidth, WRCellViewHeight);
    self.label_IconIndicatorView.frame = CGRectMake(0, _label_IconView.frame.origin.y + WRCellViewHeight, kScreenWidth, WRCellViewHeight);
    self.label_LabelIconIndicatorView.frame = CGRectMake(0, _label_IconIndicatorView.frame.origin.y + WRCellViewHeight, kScreenWidth, WRCellViewHeight);
    
    
    self.iconLabel_IndicatorView.frame = CGRectMake(0, _label_LabelIconIndicatorView.frame.origin.y+20 + WRCellViewHeight, kScreenWidth, WRCellViewHeight);
    self.iconLabel_IconView.frame = CGRectMake(0, _iconLabel_IndicatorView.frame.origin.y + WRCellViewHeight, kScreenWidth, WRCellViewHeight);
    self.iconLabel_LabelIndicatorView.frame = CGRectMake(0, _iconLabel_IconView.frame.origin.y + WRCellViewHeight, kScreenWidth, WRCellViewHeight);
    
    self.containerView.contentSize = CGSizeMake(0, self.iconLabel_LabelIndicatorView.frame.origin.y+WRCellViewHeight+100);
}

- (void)onClickEvent
{
    __weak typeof(self) weakSelf = self;
    self.leftLabelView.tapBlock = ^{
        __strong typeof(self) pThis = weakSelf;
        [pThis openNewVC];
    };
    
    self.rightLabelView.tapBlock = ^{
        __strong typeof(self) pThis = weakSelf;
        [pThis openNewVC];
    };
    
    self.label_IndicatorView.tapBlock = ^{
        __strong typeof(self) pThis = weakSelf;
        [pThis openNewVC];
    };
    
    self.label_LabelIconIndicatorView.tapBlock = ^{
        __strong typeof(self) pThis = weakSelf;
        [pThis openNewVC];
    };
    
    self.label_LabelIndicatorView.tapBlock = ^{
        __strong typeof(self) pThis = weakSelf;
        [pThis openNewVC];
    };
    
    self.label_LabelView.tapBlock = ^{
        __strong typeof(self) pThis = weakSelf;
        [pThis openNewVC];
    };
    
    self.label_IconView.tapBlock = ^{
        __strong typeof(self) pThis = weakSelf;
        [pThis openNewVC];
    };
    
    self.label_IconIndicatorView.tapBlock = ^{
        __strong typeof(self) pThis = weakSelf;
        [pThis openNewVC];
    };
    
    self.iconLabel_IndicatorView.tapBlock = ^{
        __strong typeof(self) pThis = weakSelf;
        [pThis openNewVC];
    };
    
    self.iconLabel_IconView.tapBlock = ^{
        __strong typeof(self) pThis = weakSelf;
        [pThis openNewVC];
    };
    
    self.iconLabel_LabelIndicatorView.tapBlock = ^{
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

#pragma mark - getter
- (WRCellView *)leftLabelView {
    if (_leftLabelView == nil) {
        _leftLabelView = [[WRCellView alloc] initWithLineStyle:WRCellStyleLabel_];
        _leftLabelView.leftLabel.text = @"Label_";
    }
    return _leftLabelView;
}

- (WRCellView *)rightLabelView {
    if (_rightLabelView == nil) {
        _rightLabelView = [[WRCellView alloc] initWithLineStyle:WRCellStyle_Label];
        _rightLabelView.rightLabel.text = @"_Label";
        [_rightLabelView setLineStyleWithLeftZero];
    }
    return _rightLabelView;
}

- (WRCellView *)label_IndicatorView {
    if (_label_IndicatorView == nil) {
        _label_IndicatorView = [[WRCellView alloc] initWithLineStyle:WRCellStyleLabel_Indicator];
        _label_IndicatorView.leftLabel.text = @"Label_Indicator";
    }
    return _label_IndicatorView;
}

- (WRCellView *)label_LabelIconIndicatorView {
    if (_label_LabelIconIndicatorView == nil) {
        _label_LabelIconIndicatorView = [[WRCellView alloc] initWithLineStyle:WRCellStyleLabel_LabelIconIndicator];
        _label_LabelIconIndicatorView.leftLabel.text = @"Label_LabelIconIndicator";
        _label_LabelIconIndicatorView.rightLabel.text = @"点击";
        _label_LabelIconIndicatorView.rightIcon.image = [UIImage imageNamed:@"myFriendIcon"];
        [_label_LabelIconIndicatorView setLineStyleWithLeftZero];
    }
    return _label_LabelIconIndicatorView;
}

- (WRCellView *)label_LabelIndicatorView {
    if (_label_LabelIndicatorView == nil) {
        _label_LabelIndicatorView = [[WRCellView alloc] initWithLineStyle:WRCellStyleLabel_LabelIndicator];
        _label_LabelIndicatorView.leftLabel.text = @"Label_LabelIndicator";
        _label_LabelIndicatorView.rightLabel.text = @"点击";
    }
    return _label_LabelIndicatorView;
}

- (WRCellView *)label_LabelView {
    if (_label_LabelView == nil) {
        _label_LabelView = [[WRCellView alloc] initWithLineStyle:WRCellStyleLabel_Label];
        _label_LabelView.leftLabel.text = @"Label_Label";
        _label_LabelView.rightLabel.text = @"点击";
        [_label_LabelView setLineStyleWithLeftZero];
    }
    return _label_LabelView;
}

- (WRCellView *)label_IconView {
    if (_label_IconView == nil) {
        _label_IconView = [[WRCellView alloc] initWithLineStyle:WRCellStyleLabel_Icon];
        _label_IconView.leftLabel.text = @"Label_Icon";
        _label_IconView.rightIcon.image = [UIImage imageNamed:@"myFriendIcon"];
    }
    return _label_IconView;
}

- (WRCellView *)label_IconIndicatorView {
    if (_label_IconIndicatorView == nil) {
        _label_IconIndicatorView = [[WRCellView alloc] initWithLineStyle:WRCellStyleLabel_IconIndicator];
        _label_IconIndicatorView.leftLabel.text = @"Label_IconIndicator";
        _label_IconIndicatorView.rightIcon.image = [UIImage imageNamed:@"myFriendIcon"];
    }
    return _label_IconIndicatorView;
}

- (WRCellView *)iconLabel_IndicatorView {
    if (_iconLabel_IndicatorView == nil) {
        _iconLabel_IndicatorView = [[WRCellView alloc] initWithLineStyle:WRCellStyleIconLabel_Indicator];
        _iconLabel_IndicatorView.leftLabel.text = @"IconLabel_Indicator";
        _iconLabel_IndicatorView.leftIcon.image = [UIImage imageNamed:@"myFriendIcon"];
    }
    return _iconLabel_IndicatorView;
}

- (WRCellView *)iconLabel_IconView {
    if (_iconLabel_IconView == nil) {
        _iconLabel_IconView = [[WRCellView alloc] initWithLineStyle:WRCellStyleIconLabel_Icon];
        _iconLabel_IconView.leftLabel.text = @"IconLabel_Icon";
        _iconLabel_IconView.leftIcon.image = [UIImage imageNamed:@"myFriendIcon"];
        _iconLabel_IconView.rightIcon.image = [UIImage imageNamed:@"shakeBonus"];
    }
    return _iconLabel_IconView;
}

- (WRCellView *)iconLabel_LabelIndicatorView {
    if (_iconLabel_LabelIndicatorView == nil) {
        _iconLabel_LabelIndicatorView = [[WRCellView alloc] initWithLineStyle:WRCellStyleIconLabel_LabelIndicator];
        _iconLabel_LabelIndicatorView.leftLabel.text = @"IconLabel_LabelIndicator";
        _iconLabel_LabelIndicatorView.leftIcon.image = [UIImage imageNamed:@"myFriendIcon"];
        _iconLabel_LabelIndicatorView.rightLabel.text = @"点击";
        [_iconLabel_LabelIndicatorView setLineStyleWithLeftZero];
    }
    return _iconLabel_LabelIndicatorView;
}





@end
