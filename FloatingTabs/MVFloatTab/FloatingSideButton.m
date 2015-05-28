//
//  FloatingSideButton.m
//  FloatingTabs
//
//  Created by indianic on 28/05/15.
//  Copyright (c) 2015 MV. All rights reserved.
//

#import "FloatingSideButton.h"

@implementation FloatingSideButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)awakeFromNib{
    if(_direction==kButtonDirectionRight){
        [self roundCornersOnView:self onTopLeft:NO topRight:YES bottomLeft:NO bottomRight:YES radius:self.frame.size.height/2.0];
        [self roundCornersOnView:self.button onTopLeft:NO topRight:YES bottomLeft:NO bottomRight:YES radius:self.frame.size.height/2.0];
    
    }else{
        [self roundCornersOnView:self onTopLeft:YES topRight:NO bottomLeft:YES bottomRight:NO radius:self.frame.size.height/2.0];
        [self roundCornersOnView:self.button onTopLeft:YES topRight:NO bottomLeft:YES bottomRight:NO radius:self.frame.size.height/2.0];
    }
}

-(void)setDirection:(ButtonDirection)direction{
    _direction =  direction;
    if(_direction==kButtonDirectionRight){
        [self roundCornersOnView:self onTopLeft:NO topRight:YES bottomLeft:NO bottomRight:YES radius:self.frame.size.height/2.0];
        [self roundCornersOnView:self.button onTopLeft:NO topRight:YES bottomLeft:NO bottomRight:YES radius:self.frame.size.height/2.0];
        
    }else{
        [self roundCornersOnView:self onTopLeft:YES topRight:NO bottomLeft:YES bottomRight:NO radius:self.frame.size.height/2.0];
        [self roundCornersOnView:self.button onTopLeft:YES topRight:NO bottomLeft:YES bottomRight:NO radius:self.frame.size.height/2.0];
    }
}

-(UIView *)roundCornersOnView:(UIView *)view onTopLeft:(BOOL)tl topRight:(BOOL)tr bottomLeft:(BOOL)bl bottomRight:(BOOL)br radius:(float)radius {
    
    if (tl || tr || bl || br) {
        UIRectCorner corner = 0; //holds the corner
        //Determine which corner(s) should be changed
        if (tl) {
            corner = corner | UIRectCornerTopLeft;
        }
        if (tr) {
            corner = corner | UIRectCornerTopRight;
        }
        if (bl) {
            corner = corner | UIRectCornerBottomLeft;
        }
        if (br) {
            corner = corner | UIRectCornerBottomRight;
        }
        
        UIView *roundedView = view;
        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:roundedView.bounds byRoundingCorners:corner cornerRadii:CGSizeMake(radius, radius)];
        CAShapeLayer *maskLayer = [CAShapeLayer layer];
        maskLayer.frame = roundedView.bounds;
        maskLayer.path = maskPath.CGPath;
        roundedView.layer.mask = maskLayer;
        return roundedView;
    } else {
        return view;
    }
    
}

-(void)closeAnimated:(BOOL)shouldAnimate{
    if(shouldAnimate){
        [UIView animateWithDuration:0.3 delay:0.0 usingSpringWithDamping:1 initialSpringVelocity:0.5 options:1 animations:^{
            [self setViewToClose];
        } completion:^(BOOL finished) {
            self.hidden = YES;
        }];
    }else{
         [self setViewToClose];
         self.hidden = YES;
    }
}

-(void)openAnimated:(BOOL)shouldAnimate{
    [self setViewToClose];
    self.hidden=NO;
    if(shouldAnimate){
        [UIView animateWithDuration:0.4 delay:0.0 usingSpringWithDamping:1 initialSpringVelocity:0.5 options:1 animations:^{
            _button.transform =  CGAffineTransformIdentity;
        } completion:^(BOOL finished) {

        }];
    }else{
        _button.transform =  CGAffineTransformIdentity;
    }
}

-(void)setViewToClose{
    _button.transform = CGAffineTransformTranslate(CGAffineTransformIdentity, _direction==kButtonDirectionRight?-_button.frame.size.width:self.frame.size.width, 0);
}

@end
