//
//  MVFloatCenterTab.h
//  FloatingTabs
//
//  Created by Mrugrajsinh Vansadia on 28/05/15.
//  Copyright (c) 2015 MV. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MVFloatCenterTab : UIControl
@property(nonatomic,assign)BOOL isOpen;
@property(nonatomic,strong)UIImage *closeImage,*openImage;
@property(nonatomic,weak)IBOutlet UIImageView *imgView;
@end
