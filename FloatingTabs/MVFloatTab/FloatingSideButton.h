//
//  FloatingSideButton.h
//  FloatingTabs
//
//  Created by indianic on 28/05/15.
//  Copyright (c) 2015 MV. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    kButtonDirectionRight,
    kButtonDirectionLeft,
} ButtonDirection;

@interface FloatingSideButton : UIView
@property(nonatomic,weak)IBOutlet UIButton *button;
@property(nonatomic,assign) ButtonDirection direction;
-(void)openAnimated:(BOOL)shouldAnimate;
-(void)closeAnimated:(BOOL)shouldAnimate;
@end
