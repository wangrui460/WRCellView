//
//  WRCellView.m
//  WRCellViewDemo
//
//  Created by wangrui on 16/4/26.
//  Copyright © 2016年 wangrui. All rights reserved.
//

#import "WRCellView.h"
#import <objc/runtime.h>

#define kScreenWidth      [UIScreen mainScreen].bounds.size.width
#define kSelfHeight       self.bounds.size.height
#define kBottomLineHeight 0.5
#define kTopLineHeight    0.5
#define kMargin           16
#define kPadding          6
#define kLeftLabelFont    16
#define kRightLabelFont   14

static char kActionHandlerTapBlockKey;
static char kActionHandlerTapGestureKey;

UIColor *CellSelectedColor  = nil;
UIColor *CellNormalColor    = nil;
UIColor *CellSegmentColor   = nil;
UIColor *CellLeftTextColor  = nil;
UIColor *CellRightTextColor = nil;

@interface WRCellView ()
@property (nonatomic, assign) WRCellStyle style;
@property (nonatomic, strong) UIView *topLine;
@property (nonatomic, strong) UIView *bottomLine;
@property (nonatomic, strong) UIImageView *leftIcon;
@property (nonatomic, strong) UILabel *leftLabel;
@property (nonatomic, strong) UIImageView *rightIcon;
@property (nonatomic, strong) UILabel *rightLabel;
@property (nonatomic, strong) UIImageView *rightIndicator;
@end

@implementation WRCellView
{
    CGFloat mCellBottomLineX;
    BOOL mCanNotSelected;
}

+ (void)load
{
    CellSelectedColor  = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1.0];
    CellNormalColor    = [UIColor whiteColor];
    CellSegmentColor   = [UIColor colorWithRed:218/255.0 green:218/255.0 blue:218/255.0 alpha:1.0];
    CellLeftTextColor  = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0];
    CellRightTextColor = [UIColor colorWithRed:155/255.0 green:155/255.0 blue:155/255.0 alpha:1.0];
}

- (instancetype)initWithFrame:(CGRect)frame lineStyle:(WRCellStyle)style
{
    if (self = [super initWithFrame:frame])
    {
        _style = style;
        [self setupView];
        __weak typeof(self) weakSelf = self;
        [self setTapActionWithBlock:^
        {
            __strong typeof(self) pThis = weakSelf;
            pThis.backgroundColor = CellSelectedColor;
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^
            {
                if (pThis.tapBlock)
                {
                    pThis.tapBlock();
                    [pThis touchesCancelled:[NSSet new] withEvent:nil];
                }
            });
        }];
    }
    return self;
}

- (instancetype)initWithLineStyle:(WRCellStyle)style
{
    if (self = [super init])
    {
        _style = style;
        [self setupView];
        __weak typeof(self) weakSelf = self;
        [self setTapActionWithBlock:^
        {
            __strong typeof(self) pThis = weakSelf;
            pThis.backgroundColor = CellSelectedColor;
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^
            {
                [pThis touchesCancelled:[NSSet new] withEvent:nil];
                if (pThis.tapBlock)
                {
                    pThis.tapBlock();
                }
            });
        }];
    }
    return self;
}

- (void)setLineStyleWithLeftZero
{
    mCellBottomLineX = 0;
    self.bottomLine.frame = CGRectMake(mCellBottomLineX, kSelfHeight - 0.5, kScreenWidth - mCellBottomLineX, kBottomLineHeight);
}

- (void)setLineStyleWithLeftEqualLabelLeft
{
    mCellBottomLineX = kMargin + self.leftIcon.image.size.width + kPadding;
    self.bottomLine.frame = CGRectMake(mCellBottomLineX, kSelfHeight - 0.5, kScreenWidth - mCellBottomLineX, kBottomLineHeight);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if (mCanNotSelected == NO) {
        self.backgroundColor = CellSelectedColor;
    }
}

// 当取消选中后
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if (mCanNotSelected == NO) {
        self.backgroundColor = CellNormalColor;
    }
}

-(void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if (mCanNotSelected == NO) {
        self.backgroundColor = CellNormalColor;
    }
}

- (void)setupView
{
    self.backgroundColor = CellNormalColor;
    mCellBottomLineX = kMargin;
    //----------------------- 左侧
    if (self.style & 0x10000) {
        [self addSubview:self.leftIcon];
    }
    if (self.style & 0x1000) {
        [self addSubview:self.leftLabel];
    }
    
    //----------------------- 右侧
    UIView *rightTmpView = nil;     // 类似中间件，中转作用
    if (self.style & 0x1) {
        [self addSubview:self.rightIndicator];
        rightTmpView = self.rightIndicator;
    }
    if (self.style & 0x10) {
        [self addSubview:self.rightLabel];
        rightTmpView = self.rightLabel;
    }
    if (self.style & 0x100) {
        [self addSubview:self.rightIcon];
    }

    self.bottomLine = [[UIView alloc] init];
    self.bottomLine.backgroundColor = CellSegmentColor;
    [self addSubview:self.bottomLine];
    
    self.topLine = [[UIView alloc] init];
    self.topLine.backgroundColor = CellSegmentColor;
    [self addSubview:self.topLine];
    self.topLine.frame = CGRectMake(0, 0, kScreenWidth, kTopLineHeight);
    [self bringSubviewToFront:self.topLine];
    self.topLine.hidden = YES;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    //----------------------- 左侧
    if (self.style & 0x10000)
    {
        CGFloat leftIconWidth  = self.leftIcon.image.size.width;
        CGFloat leftIconHeight = self.leftIcon.image.size.height;
        CGFloat leftIconY = (kSelfHeight - leftIconHeight - kBottomLineHeight) / 2.0;
        self.leftIcon.frame = CGRectMake(kMargin, leftIconY, leftIconWidth, leftIconHeight);
    }
    
    if (self.style & 0x1000)
    {
        CGSize leftLabelSize = [self.leftLabel.text sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:kLeftLabelFont]}];
        CGFloat leftLabelWidth  = leftLabelSize.width;
        CGFloat leftLabelHeight = leftLabelSize.height;
        if (_leftIcon)
        {
            CGFloat leftLabelX = self.leftIcon.frame.origin.x + self.leftIcon.bounds.size.width + kPadding;
            CGFloat leftLabelY = (kSelfHeight - leftLabelHeight - kBottomLineHeight) / 2.0;
            self.leftLabel.frame = CGRectMake(leftLabelX, leftLabelY, leftLabelWidth, leftLabelHeight);
        }
        else
        {
            CGFloat leftLabelY = (kSelfHeight - leftLabelHeight - kBottomLineHeight) / 2.0;
            self.leftLabel.frame = CGRectMake(kMargin, leftLabelY, leftLabelWidth, leftLabelHeight);
        }
    }
    
    
    //----------------------- 右侧
    UIView *rightTmpView = nil;     // 类似中间件，中转作用
    if (self.style & 0x1)
    {
        CGFloat rightIndicatorWidth  = self.rightIndicator.image.size.width;
        CGFloat rightIndicatorHeight = self.rightIndicator.image.size.height;
        CGFloat rightIndicatorX = kScreenWidth - kMargin - rightIndicatorWidth;
        CGFloat rightIndicatorY = (kSelfHeight - rightIndicatorHeight - kBottomLineHeight) / 2.0;
        self.rightIndicator.frame = CGRectMake(rightIndicatorX, rightIndicatorY, rightIndicatorWidth, rightIndicatorHeight);
        rightTmpView = self.rightIndicator;
    }
    
    if (self.style & 0x10)
    {
        CGSize rightLabelSize = [self.rightLabel.text sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:kRightLabelFont]}];
        CGFloat rightLabelWidth  = rightLabelSize.width;
        CGFloat rightLabelHeight = rightLabelSize.height;
        if (rightTmpView)
        {
            CGFloat rightLabelX = rightTmpView.frame.origin.x - kPadding - rightLabelWidth;
            CGFloat rightLabelY = (kSelfHeight - rightLabelHeight - kBottomLineHeight) / 2.0;
            self.rightLabel.frame = CGRectMake(rightLabelX, rightLabelY, rightLabelWidth, rightLabelHeight);
        }
        else
        {
            CGFloat rightLabelX = kScreenWidth - kMargin - rightLabelWidth;
            CGFloat rightLabelY = (kSelfHeight - rightLabelHeight - kBottomLineHeight) / 2.0;
            self.rightLabel.frame = CGRectMake(rightLabelX, rightLabelY, rightLabelWidth, rightLabelHeight);
        }
        rightTmpView = self.rightLabel;
    }
    
    if (self.style & 0x100)
    {
        CGFloat rightIconWidth  = self.rightIcon.image.size.width;
        CGFloat rightIconHeight = self.rightIcon.image.size.height;
        if (rightTmpView)
        {
            CGFloat rightIconX = rightTmpView.frame.origin.x - kPadding - rightIconWidth;
            CGFloat rightIconY = (kSelfHeight - rightIconHeight - kBottomLineHeight) / 2.0;
            self.rightIcon.frame = CGRectMake(rightIconX, rightIconY, rightIconWidth, rightIconHeight);
        }
        else
        {
            CGFloat rightIconX = kScreenWidth - kMargin - rightIconWidth;
            CGFloat rightIconY = (kSelfHeight - rightIconHeight - kBottomLineHeight) / 2.0;
            self.rightIcon.frame = CGRectMake(rightIconX, rightIconY, rightIconWidth, rightIconHeight);
        }
    }
    self.bottomLine.frame = CGRectMake(mCellBottomLineX, kSelfHeight - 0.5, kScreenWidth - mCellBottomLineX, kBottomLineHeight);
}

#pragma mark -  设置简单的轻点 block事件
- (void)setTapActionWithBlock:(void (^)(void))block
{
    UITapGestureRecognizer *gesture = objc_getAssociatedObject(self, &kActionHandlerTapGestureKey);
    if (!gesture)
    {
        gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleActionForTapGesture:)];
        [self addGestureRecognizer:gesture];
        objc_setAssociatedObject(self, &kActionHandlerTapGestureKey, gesture, OBJC_ASSOCIATION_RETAIN);
    }
    objc_setAssociatedObject(self, &kActionHandlerTapBlockKey, block, OBJC_ASSOCIATION_COPY);
}

- (void)handleActionForTapGesture:(UITapGestureRecognizer *)gesture
{
    if (gesture.state == UIGestureRecognizerStateRecognized)
    {
        void(^action)(void) = objc_getAssociatedObject(self, &kActionHandlerTapBlockKey);
        if (action) {
            action();
        }
    }
}

#pragma mark - getter / setter
- (void)setHideBottomLine:(BOOL)hideBottomLine {
    _bottomLine.hidden = hideBottomLine;
}

- (void)setShowTopLine:(BOOL)showTopLine {
    _topLine.hidden = !showTopLine;
}

- (void)setCanNotSelected
{
    mCanNotSelected = YES;
    [self setTapActionWithBlock:nil];
}

- (UIImageView *)leftIcon {
    if (_leftIcon == nil) {
        _leftIcon = [UIImageView new];
    }
    return _leftIcon;
}

- (UILabel *)leftLabel {
    if (_leftLabel == nil) {
        _leftLabel = [UILabel new];
        _leftLabel.font = [UIFont systemFontOfSize:kLeftLabelFont];
        _leftLabel.textColor = CellLeftTextColor;
    }
    return _leftLabel;
}

- (UIImageView *)rightIndicator {
    if (_rightIndicator == nil) {
        _rightIndicator = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"check_btn"]];
    }
    return _rightIndicator;
}

- (UIImageView *)rightIcon {
    if (_rightIcon == nil) {
        _rightIcon = [UIImageView new];
    }
    return _rightIcon;
}

- (UILabel *)rightLabel {
    if (_rightLabel == nil) {
        _rightLabel = [UILabel new];
        _rightLabel.font = [UIFont systemFontOfSize:kRightLabelFont];
        _rightLabel.textColor = CellRightTextColor;
    }
    return _rightLabel;
}

@end
