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

@interface ViewController ()
@property (nonatomic, strong) WRCellView* shakeView;
@property (nonatomic, strong) WRCellView* inviteFriendView;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.view addSubview:self.shakeView];
    [self.view addSubview:self.inviteFriendView];
    
    self.shakeView.frame = CGRectMake(0, 64, kScreenWidth, 50);
    self.inviteFriendView.frame = CGRectMake(0, _shakeView.frame.origin.y+_shakeView.bounds.size.height, kScreenWidth, 50);
}

- (WRCellView *)shakeView {
    if (_shakeView == nil) {
        _shakeView = [[WRCellView alloc] initWithLineStyle:WRCellStyleIconLabel_LabelIndicator];
        _shakeView.leftIcon.image = [UIImage imageNamed:@"shakeBonus"];
        _shakeView.leftLabel.text = @"摇红包";
        _shakeView.rightLabel.text = @"偷点地主家的余粮";
    }
    return _shakeView;
}

- (WRCellView *)inviteFriendView {
    if (_inviteFriendView == nil) {
        _inviteFriendView = [[WRCellView alloc] initWithLineStyle:WRCellStyleIconLabel_LabelIndicator];
        _inviteFriendView.leftIcon.image = [UIImage imageNamed:@"myFriendIcon"];
        _inviteFriendView.leftLabel.text = @"邀请好友";
        _inviteFriendView.rightLabel.text = @"立得10元50%红包";
        _inviteFriendView.rightLabel.textColor = [UIColor redColor];
    }
    return _inviteFriendView;
}

@end
