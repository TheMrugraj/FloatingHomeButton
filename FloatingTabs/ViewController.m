//
//  ViewController.m
//  FloatingTabs
//
//  Created by indianic on 27/05/15.
//  Copyright (c) 2015 MV. All rights reserved.
//

#import "ViewController.h"
#import "MVFloatCenterTab.h"

#import "MVFloatingTabView.h"

@interface ViewController (){
    MVFloatingTabView *mvFloat;
}
@property (weak, nonatomic) IBOutlet MVFloatCenterTab *centerButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    mvFloat = [MVFloatingTabView floatingTabView];
    mvFloat.openStateImage = [UIImage imageNamed:@"home.png"];
    mvFloat.closeStateImage = [UIImage imageNamed:@"plus.png"];
    CGRect rect = mvFloat.frame;
    rect.origin.x = (self.view.frame.size.width-mvFloat.frame.size.width)/2;
    rect.origin.y = (self.view.frame.size.height-mvFloat.frame.size.height)-50;
    mvFloat.frame = rect;
    [self.view addSubview:mvFloat];

    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
