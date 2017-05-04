# WRCellView
自定义View，类似tableView的系统cell，使用方便

## 0️⃣. Demo 
![image](https://github.com/wangrui460/WRCellView/raw/master/screenshots/微信个人信息.png)
![image](https://github.com/wangrui460/WRCellView/raw/master/screenshots/高德地图我的.png)
![image](https://github.com/wangrui460/WRCellView/raw/master/screenshots/NBA更多.png)
![image](https://github.com/wangrui460/WRCellView/raw/master/screenshots/自定义view.png)

## 1️⃣. Installation 安装

> **手动拖入**
> 将 WRCellView 文件夹拽入项目中，导入头文件：#import "WRCellView.h"

## 2️⃣. How To Use 使用

**1.以下是常用的style **
```
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
```

**2. 接口**
```
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
```

**3. 举例说明**
```
- (WRCellView *)signView {
    if (_signView == nil) {
        _signView = [[WRCellView alloc] initWithLineStyle:WRCellStyleLabel_LabelIndicator];
        _signView.leftLabel.text = @"个性签名";
        _signView.rightLabel.text = @"爱别人的同事也是爱自己";
        [_signView setLineStyleWithLeftZero];
    }
    return _signView;
}
```


## 3️⃣. More 更多 

If you find a bug, please create a issue.  
Welcome to pull requests.  
More infomation please view code.  
如果你发现了bug，请提一个issue。  
欢迎给我提pull requests。  
更多信息详见代码，也可查看我的简书: [我的简书](http://www.jianshu.com/p/540a7e6f7b40)

**最近更新:** 
2017.05.04 16:18
1. 添加自定义view Demo  2. 设置不可点击接口


## 4️⃣. 期待

如果在使用过程中遇到BUG，或发现功能不够用，希望你能Issues我
如果觉得好用请Star!
谢谢!
