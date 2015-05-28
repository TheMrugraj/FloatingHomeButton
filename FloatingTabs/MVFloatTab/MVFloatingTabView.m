//
//  MVFloatingTabView.m
//  FloatingTabs
//
//  Created by Mrugrajsinh Vansadia on 28/05/15.
//  Copyright (c) 2015 MV. All rights reserved.
//

#import "MVFloatingTabView.h"

@implementation MVFloatingTabView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
+(instancetype)floatingTabView{
    MVFloatingTabView *floatingView = [[NSBundle mainBundle]loadNibNamed:@"MVFloatingTabView" owner:self options:nil].firstObject;
    [floatingView setUpView];
    return floatingView;
}

-(void)setUpView{
    _leftButton.direction =  kButtonDirectionLeft;
    _rightButton.direction = kButtonDirectionRight;
    _centerButton.layer.cornerRadius = _centerButton.frame.size.width*0.5;
    _centerButton.layer.borderColor = [UIColor whiteColor].CGColor;
    _centerButton.layer.borderWidth = 3.0;
    
    [_leftButton closeAnimated:NO];
    [_rightButton closeAnimated:NO];
    _isOpen = NO;
    
    
}

-(void)didMoveToSuperview{
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panHanlder:)];
    [_centerButton addGestureRecognizer:panGesture];

}
-(void)panHanlder:(UIPanGestureRecognizer*)sender{
    CGPoint pntTranslation = [sender translationInView:sender.view];
    CGFloat xPoints = pntTranslation.x;
    CGFloat velocityX = [sender velocityInView:sender.view].x;
    NSTimeInterval duration = xPoints / velocityX;
    CGPoint offScreenCenter = self.center;
    offScreenCenter.x += xPoints;
    [UIView animateWithDuration:duration animations:^{
            self.transform =  CGAffineTransformTranslate(self.transform, pntTranslation.x, pntTranslation.y);
        
    }];
    [sender setTranslation:CGPointZero inView:sender.view];
    
}

- (IBAction)toggleAction:(MVFloatCenterTab *)sender {
    if(!_isOpen){
        [self openAction];
    }else{
        [self closeAction];
    }
}

-(void)openAction{
    [_leftButton openAnimated:YES];
    [_rightButton openAnimated:YES];
    _isOpen = YES;
    
    [UIView animateWithDuration:0.2 animations:^{
        _centerButton.imgView.transform = CGAffineTransformScale(_centerButton.imgView.transform, 0.0, 0.0);
    } completion:^(BOOL finished) {
        _centerButton.imgView.image = _openStateImage;
        [UIView animateWithDuration:0.2 delay:0.0 usingSpringWithDamping:0.8 initialSpringVelocity:1.0 options:1.0 animations:^{
            _centerButton.imgView.transform =CGAffineTransformIdentity;
        } completion:nil];
    }];
}

-(void)closeAction{
    [_leftButton closeAnimated:YES];
    [_rightButton closeAnimated:YES];
    _isOpen = NO;
    
    [UIView animateWithDuration:0.2 animations:^{
        _centerButton.imgView.transform = CGAffineTransformScale(_centerButton.imgView.transform, 0.0, 0.0);
    } completion:^(BOOL finished) {
        _centerButton.imgView.image = _closeStateImage;
        [UIView animateWithDuration:0.2 delay:0.0 usingSpringWithDamping:0.8 initialSpringVelocity:1.0 options:1.0 animations:^{
            _centerButton.imgView.transform =CGAffineTransformIdentity;
        } completion:nil];
    }];
}
@end
