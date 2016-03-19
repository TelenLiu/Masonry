//
//  ViewController.m
//  masonry
//
//  Created by Telen on 16/3/19.
//  Copyright © 2016年 Telen. All rights reserved.
//

#import "ViewController.h"

#import "Masonry.h"

@interface ViewController ()

@end

@implementation ViewController
{
    UIView* viewRed;
    UIView* viewGreen;
    UIView* viewYellow;
    NSInteger index;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    viewRed = [[UIView alloc] init];
    viewRed.layer.borderColor = [[UIColor redColor] colorWithAlphaComponent:0.5].CGColor;
    viewRed.layer.borderWidth = 4;
    [self.view addSubview:viewRed];
    [viewRed mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(50);
        make.centerX.mas_offset(0);
        make.centerY.mas_offset(0);
    }];
    
    
    viewGreen = [[UIView alloc] init];
    viewGreen.layer.borderColor = [[UIColor greenColor] colorWithAlphaComponent:0.5].CGColor;
    viewGreen.layer.borderWidth = 4;
    [self.view addSubview:viewGreen];
    [viewGreen mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(50);
        make.centerX.mas_offset(20);
        make.centerY.mas_offset(20);
    }];
    
    
    viewYellow = [[UIView alloc] init];
    viewYellow.layer.borderColor = [[UIColor yellowColor] colorWithAlphaComponent:0.8].CGColor;
    viewYellow.layer.borderWidth = 4;
    [self.view addSubview:viewYellow];
    [viewYellow mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(50);
        make.centerX.mas_offset(60);
        make.centerY.mas_offset(60);
    }];
    
    index = 0;
    [self.view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)]];
}


- (void)tap:(UITapGestureRecognizer*)tp
{
    CGPoint pt = [tp locationInView:tp.view];
    UIView* view = nil;
    NSUInteger rd = rand();
    rd %= 150;
    rd += 50;
    CGFloat ratio = rd*1.0/100;
    switch (index%3) {
        case 0:
            view = viewRed;
            break;
        case 1:
            view = viewGreen;
            break;
        case 2:
            view = viewYellow;
            break;
        default:
            break;
    }
    CGPoint ct = self.view.center;
    pt = CGPointMake(pt.x-ct.x, pt.y-ct.y);
    [view mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(50*ratio);
        make.height.mas_equalTo(50*ratio);
        make.centerX.mas_offset(pt.x);
        make.centerY.mas_offset(pt.y);
    }];
    [UIView animateWithDuration:0.3 animations:^{
        [view.superview layoutIfNeeded];
    }];
    index++;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
