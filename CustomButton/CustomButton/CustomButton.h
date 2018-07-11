//
//  CustomButton.h
//  NBBankEnt
//
//  Created by nbcb on 2017/9/28.
//

#import <UIKit/UIKit.h>

/**
 自定义button，可以调整image、title的位置
 */

typedef NS_ENUM(NSInteger, CustomButtonStyle) {
    
    ImageLeftTitleRight = 0,    //图片左title右
    ImageRightTitleLeft,        //图片右title左
    ImageTopTitleDown,          //图片上title下
    ImageDownTitleTop           //图片下title上
};

@interface CustomButton : UIButton

- (void)setButonStyle:(CustomButtonStyle)buttonStyle imgFrame:(CGRect)imgFrame;

@end
