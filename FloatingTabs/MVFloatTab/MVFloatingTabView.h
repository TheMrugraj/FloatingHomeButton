//
//  MVFloatingTabView.h
//  FloatingTabs
//
//  Created by indianic on 28/05/15.
//  Copyright (c) 2015 MV. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FloatingSideButton.h"
#import "MVFloatCenterTab.h"

@interface MVFloatingTabView : UIView
@property (weak, nonatomic) IBOutlet UIView *gestureView;
@property (weak, nonatomic) IBOutlet MVFloatCenterTab *centerButton;
@property (weak, nonatomic) IBOutlet FloatingSideButton *rightButton;
@property (weak, nonatomic) IBOutlet FloatingSideButton *leftButton;
@property(nonatomic,assign)BOOL isOpen;
@property(nonatomic,strong)UIImage *openStateImage,*closeStateImage;
+(instancetype)floatingTabView;
@end
