//
//  ViewController.m
//  分布图
//
//  Created by 孙玉震 on 17/2/22.
//  Copyright © 2017年 孙玉震. All rights reserved.
//

#import "ViewController.h"
#import "DrawBoard.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    DrawBoard *view = [[DrawBoard alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:view];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
