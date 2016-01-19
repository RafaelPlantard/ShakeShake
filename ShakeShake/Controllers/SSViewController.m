//
//  ViewController.m
//  ShakeShake
//
//  Created by Rafael Ferreira on 1/19/16.
//  Copyright © 2016 Data Empire. All rights reserved.
//

#import "SSViewController.h"
#import "SSShakeShakeView.h"

@interface SSViewController ()

@end

@implementation SSViewController

- (void)createShakeShakeView:(CGPoint)position withColor:(UIColor *)color {
    CGRect rect = CGRectMake(position.x, position.y, 60, 60);
    
    SSShakeShakeView *s = [[SSShakeShakeView alloc] initWithFrame:rect];
    s.backgroundColor = color;
    
    [self.view addSubview:s];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self createShakeShakeView:CGPointMake(50, 50) withColor:[UIColor redColor]];
    [self createShakeShakeView:CGPointMake(200, 150) withColor:[UIColor greenColor]];
    [self createShakeShakeView:CGPointMake(110, 250) withColor:[UIColor blueColor]];
}

@end