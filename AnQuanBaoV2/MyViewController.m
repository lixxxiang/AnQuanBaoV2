//
//  MyViewViewController.m
//  AnQuanBaoV2
//
//  Created by yyfwptz on 2017/7/3.
//  Copyright © 2017年 yyfwptz. All rights reserved.
//

#import "MyViewController.h"
#import "ViewController.h"
@interface MyViewController ()

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _tel.text = @"188****2121";
    [_quitLogin setBackgroundImage:[UIImage imageNamed:@"redbtn"] forState:UIControlStateNormal];
    
    
    UIImage *selectedImage=[UIImage imageNamed: @"backbtn"];
    selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc]initWithImage:selectedImage style:UIBarButtonItemStylePlain target:self action:@selector(click:)];
    UINavigationItem *item = [[UINavigationItem alloc] initWithTitle:@"安全宝"];
    item.leftBarButtonItem = rightButton;
    item.hidesBackButton = YES;
    rightButton.tintColor=[UIColor redColor];
    [_navibar pushNavigationItem:item animated:NO];
}

-(void) click:(id)sender{
    NSLog(@"ddf");
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
//    ViewController *vc = [ViewController alloc];
///    [self.view1 setHidden:YES];
//    [self presentModalViewController:vc animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
