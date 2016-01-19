//
//  SSShakeShakeView.m
//  ShakeShake
//
//  Created by Rafael Ferreira on 1/19/16.
//  Copyright © 2016 Data Empire. All rights reserved.
//

#import "SSShakeShakeView.h"
#import <QuartzCore/QuartzCore.h>

#define RADIANS(degrees)    ((degrees * M_PI) / 180.0) /*! @brief Radians from degrees value. */

@interface SSShakeShakeView ()

/*! @brief Register the LongPress and DoubleTap gesture. */
- (void)registerGestures;

/*! @brief Add a custom style for the view. */
- (void)decorateView;

@end

@implementation SSShakeShakeView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        [self decorateView];
        [self registerGestures];
    }
    
    return self;
}

- (void)registerGestures {
    UILongPressGestureRecognizer *longGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(beginShake:)];
    longGesture.minimumPressDuration = 0.3;
    
    [self addGestureRecognizer:longGesture];
    
    UITapGestureRecognizer *doubleTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(stopShake:)];
    doubleTapGesture.numberOfTapsRequired = 2;
    
    [self addGestureRecognizer:doubleTapGesture];
}

- (void)beginShake:(UIGestureRecognizer *)gesture {
    CGAffineTransform leftTilt = CGAffineTransformRotate(CGAffineTransformIdentity, RADIANS(-5.0));
    CGAffineTransform rightTilt = CGAffineTransformRotate(CGAffineTransformIdentity, RADIANS(5.0));
    
    self.transform = leftTilt;
    
    UIViewAnimationOptions animationOptions = UIViewAnimationOptionRepeat | UIViewAnimationOptionAllowUserInteraction | UIViewAnimationOptionAutoreverse | UIViewAnimationOptionCurveEaseInOut;
    
    [UIView animateWithDuration:0.1 delay:0 options:animationOptions animations:^{
        self.transform = rightTilt;
    } completion:nil];
}

- (void)stopShake:(UIGestureRecognizer *)gesture {
    UIViewAnimationOptions animateOption = UIViewAnimationOptionBeginFromCurrentState;
    
    [UIView animateWithDuration:0 delay:0 options:animateOption animations:^{
        self.transform = CGAffineTransformIdentity;
    } completion:nil];
}

- (void)decorateView {
    self.layer.masksToBounds = NO;
    self.layer.cornerRadius = 5;
    self.layer.shadowOffset = CGSizeMake(-2, 2);
    self.layer.shadowRadius = 2;
    self.layer.shadowOpacity = 0.5;
}

@end
