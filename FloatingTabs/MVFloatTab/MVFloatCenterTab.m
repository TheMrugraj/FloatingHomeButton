//
//  MVFloatCenterTab.m
//  FloatingTabs
//
//  Created by Mrugrajsinh Vansadia on 28/05/15.
//  Copyright (c) 2015 MV. All rights reserved.
//

#import "MVFloatCenterTab.h"

@implementation MVFloatCenterTab

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)awakeFromNib{
    
}

-(BOOL)beginTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event{
    
    [UIView animateWithDuration:0.2 animations:^{
        self.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.9, 0.9);
    }];
    return YES;
}

-(void)endTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event{
    [UIView animateWithDuration:0.25 delay:0.0 usingSpringWithDamping:1 initialSpringVelocity:0.5 options:1 animations:^{
        self.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {

    }];
}
@end
