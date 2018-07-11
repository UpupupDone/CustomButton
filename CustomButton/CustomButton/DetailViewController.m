//
//  DetailViewController.m
//  CutomButton
//
//  Created by NBCB on 2018/1/24.
//  Copyright © 2018年 MInimalismC. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@property (strong, nonatomic) CustomButton *button;

@end

@implementation DetailViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupSubViews];
}

- (void)setupSubViews {
    
    [self.view addSubview:self.button];
    
    switch (self.pushFlag) {
        case 0:
        {
            [self.button setButonStyle:ImageLeftTitleRight imgFrame:CGRectMake(0, (self.button.frame.size.height - 30) / 2.0, 30, 30)];
        }
            break;
            
        case 1:
        {
            [self.button setButonStyle:ImageRightTitleLeft imgFrame:CGRectMake(70, (self.button.frame.size.height - 30) / 2.0, 30, 30)];
        }
            break;
            
        case 2:
        {
            [self.button setButonStyle:ImageTopTitleDown imgFrame:CGRectMake((self.button.frame.size.width - 20) / 2.0, 5, 30, 30)];
            [self.button.titleLabel setTextAlignment:NSTextAlignmentCenter];
        }
            break;
            
        case 3:
        {
            [self.button setButonStyle:ImageDownTitleTop imgFrame:CGRectMake((self.button.frame.size.width - 30) / 2.0, 25, 30, 30)];
            [self.button.titleLabel setTextAlignment:NSTextAlignmentCenter];
        }
            break;
            
        default:
            break;
    }
    
    [self.button setTitle:@"美好时光" forState:UIControlStateNormal];
    self.button.center = CGPointMake(self.view.center.x, self.view.center.y - 32);
}

- (CustomButton *)button {
    
    if (!_button) {
        
        self.button = [CustomButton buttonWithType:UIButtonTypeCustom];
        _button.adjustsImageWhenHighlighted = NO;
        [_button setImage:[UIImage imageNamed:@"icon_personal_n"] forState:UIControlStateNormal];
        [_button setImage:[UIImage imageNamed:@"icon_personal_h"] forState:UIControlStateSelected];
        [_button addTarget:self action:@selector(touch:) forControlEvents:UIControlEventTouchUpInside];
        _button.frame = CGRectMake(15, 100, 130, 60);
    }
    return _button;
}

- (void)touch:(UIButton *)sender {
    
    sender.selected = !sender.selected;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
