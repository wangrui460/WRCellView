//
//  WRCellView.h
//  WRCellViewDemo
//
//  Created by wangrui on 16/4/26.
//  Copyright © 2016年 wangrui. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
    左侧 icon label  右侧 icon  label indicator
     0x   1    1          1     1       1
 
    按位与运算 按位与运算符"&"是双目运算符。其功能是参与运算的两数各对应的二进位相与。只有对应的两个二进位均为1时，结果位才为1 ，否则为0。参与运算的数以补码方式出现。
    例如：9 & 5 可写算式如下： 00001001 & 00000101 = 00000001; 可见 9 & 5 = 1。
*/
typedef NS_ENUM(NSInteger, WRCellStyle)
{   // 以下列举的都是常用的
    WRCellStyle_Label                   = 0x10,
    WRCellStyleLabel_                   = 0x1000,
    WRCellStyleLabel_Indicator          = 0x1001,
    WRCellStyleLabel_IconLabelIndicator = 0x1111,
    WRCellStyleLabel_LabelIndicator     = 0x1011,
    WRCellStyleLabel_Label              = 0x1010,
    WRCellStyleLabel_Icon               = 0x1100,
    WRCellStyleLabel_IconIndicator      = 0x1101,
    WRCellStyleIcon_Indicator           = 0x10001,
    WRCellStyleIconLabel_Indicator      = 0x11001,
    WRCellStyleIconLabel_Icon           = 0x11100,
    WRCellStyleIconLabel_LabelIndicator = 0x11011,
};

typedef void (^VoidBlock)();

FOUNDATION_EXTERN UIColor *CellSelectedColor;
FOUNDATION_EXTERN UIColor *CellNormalColor;
FOUNDATION_EXTERN UIColor *CellSegmentColor;
FOUNDATION_EXTERN UIColor *CellLeftTextColor;
FOUNDATION_EXTERN UIColor *CellRightTextColor;




@interface WRCellView : UIView
@property (nonatomic, strong, readonly) UIImageView *leftIcon;
@property (nonatomic, strong, readonly) UILabel     *leftLabel;
@property (nonatomic, strong, readonly) UIImageView *rightIcon;
@property (nonatomic, strong, readonly) UILabel     *rightLabel;
@property (nonatomic, strong, readonly) UIImageView *rightIndicator;
@property (nonatomic, copy) VoidBlock tapBlock;

- (instancetype)initWithFrame:(CGRect)frame lineStyle:(WRCellStyle)style;
- (instancetype)initWithLineStyle:(WRCellStyle)style;
/** 设置底部的那条线距左边为0 */
- (void)setLineStyleWithLeftZero;
/** 设置底部的那条线与label的左侧对齐 */
- (void)setLineStyleWithLeftEqualLabelLeft;
/** 设置隐藏底部的那条线 */
- (void)setHideBottomLine:(BOOL)hideBottomLine;
/** 显示上面的横线，默认不显示 */
- (void)setShowTopLine:(BOOL)showTopLine;
/** 设置自己不可以点击 */
- (void)setCanNotSelected;
@end











