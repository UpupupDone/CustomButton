//
//  CustomButton.m
//  NBBankEnt
//
//  Created by nbcb on 2017/9/28.
//

#import "CustomButton.h"

#define isIOS8 ([[[UIDevice currentDevice] systemVersion] compare:@"8" options:NSNumericSearch] != NSOrderedAscending)

@interface CustomButton ()

{
    CustomButtonStyle           _buttonStyle;
    CGRect                      _imgFrame;
}

@end

@implementation CustomButton

+ (instancetype)buttonWithType:(UIButtonType)buttonType {
    
    CustomButton *button = [super buttonWithType:buttonType];
    return button;
}

- (void)setButonStyle:(CustomButtonStyle)buttonStyle imgFrame:(CGRect)imgFrame {
    
    _buttonStyle = buttonStyle;
    _imgFrame = imgFrame;
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    
    CGFloat originX = 0;
    CGFloat originY = 0;
    CGFloat width   = 0;
    CGFloat height  = 0;
    CGRect rec = CGRectZero;
    
    switch (_buttonStyle) {
        case ImageLeftTitleRight:
        {
            originX = _imgFrame.origin.x + _imgFrame.size.width;
            originY = 0;
            width   = contentRect.size.width - originX;
            height  = contentRect.size.height;
            rec     = CGRectMake(originX, originY, width, height);
        }
            break;
        case ImageRightTitleLeft:
        {
            originX = 0;
            originY = 0;
            width   = contentRect.size.width - _imgFrame.size.width;
            height  = contentRect.size.height;
            rec     = CGRectMake(originX, originY, width, height);
        }
            break;
        case ImageTopTitleDown:
        {
            originX = 0;
            originY =  _imgFrame.origin.y + _imgFrame.size.height;
            width   = contentRect.size.width;
            height  = contentRect.size.height - originY;
            rec     = CGRectMake(originX, originY, width, height);
        }
            break;
        case ImageDownTitleTop:
        {
            originX = 0;
            originY = 0;
            width   = contentRect.size.width;
            height  = contentRect.size.height - _imgFrame.size.height;
            rec     = CGRectMake(originX, originY, width, height);
        }
            break;
        default:
            break;
    }
    return rec;
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    
    return _imgFrame;
}

//iOS8，去掉button的下划线
- (void)setUnderlineNone:(BOOL)flag forTitle:(NSString *)title forState:(UIControlState)state {
    
    if (flag) {
        
        if (!title) {
            
            title = @"";
        }
        
        NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:title];
        
        if (isIOS8) {
            
            [str addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInt:NSUnderlineStyleNone] range:NSMakeRange(0, title.length)];
        }
        [self setAttributedTitle:str forState:state];
    }
}

- (void)setTitle:(nullable NSString *)title forState:(UIControlState)state {
    
    if (isIOS8) {

        [self setUnderlineNone:YES forTitle:title forState:state];
    }
    else {
        
        [self setTitle:title forState:state];
    }
}

@end

