//
//  IMSMessageDefine.h
//  test
//
//  Created by cjf on 20/4/2021.
//  Copyright © 2021 cjf. All rights reserved.
//

#ifndef IMSMessageDefine_h
#define IMSMessageDefine_h


#define IMSAppWindow [[UIApplication sharedApplication].delegate window]

#define IMS_SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define IMS_SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

#define IMS_STATUSBAR_HEIGHT (IMS_SCREEN_IS_PORTRAIT?((IMS_IS_IPHONEX()==YES)?44.f:20.f):0)
#define IMS_NAVIGATION_CONTENT_HEIGHT 44.f
#define IMS_NAVIGATIONBAR_HEIGHT (IMS_STATUSBAR_HEIGHT + IMS_NAVIGATION_CONTENT_HEIGHT)
#define IMS_TABBAR_HEIGHT (IMS_IS_IPHONEX()?83.f:49.f)
#define IMS_HOMEKEY_HEIGHT (IMS_IS_IPHONEX()?34.f:0)

//iOS11的新特性代码,
//注意: 这个必须等应用准备好了才能调用，否则会在[... windows][0]调用时崩溃
#define IMS_IS_IPHONEX() ^(){\
if (@available(iOS 11.0, *)) {\
UIWindow *keyWindow = nil;\
for (UIWindow *window in [UIApplication sharedApplication].windows) {\
    if (window.isKeyWindow) {\
        keyWindow = window;\
    }\
}\
return (keyWindow.safeAreaInsets.bottom > 0.0)?1:0;\
} else {\
return 0;\
}\
}()

// 验证是否为竖屏
#define IMS_SCREEN_IS_PORTRAIT ([[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationPortrait || [[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationPortraitUpsideDown)

#define IMS_HEXALPHACOLOR(rgbValue, a) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 \
alpha:(a)]

#define IMS_HEXCOLOR(rgbValue) IMS_HEXALPHACOLOR(rgbValue, 1.0)


#endif /* IMSMessageDefine_h */
