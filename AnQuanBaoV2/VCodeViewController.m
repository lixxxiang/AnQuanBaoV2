//
//  VCodeViewController.m
//  AnQuanBaoV2
//
//  Created by yyfwptz on 2017/7/4.
//  Copyright © 2017年 yyfwptz. All rights reserved.
//

#import "VCodeViewController.h"
#import "ViewController.h"
@interface VCodeViewController (){
    int secondsCountDown; //倒计时总时长
    NSTimer *countDownTimer;
    NSString *tel;
}

@end

@implementation VCodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [_loginbtn setBackgroundImage:[UIImage imageNamed:@"btngray"] forState:UIControlStateNormal];
    [_line setImage:[UIImage imageNamed:@"line"]];
    _vcodeInfo.text = [@"验证码已发送到" stringByAppendingString:tel];
    [_backBtn setBackgroundImage:[UIImage imageNamed:@"backbtn"] forState:UIControlStateNormal];
    [_backBtn addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
    [_inputVcode addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    
    
    secondsCountDown = 60;
    countDownTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeFireMethod) userInfo:nil repeats:YES];
    _countdown.text=[NSString stringWithFormat:@"%d秒后 重新发送验证码", secondsCountDown];
    UITapGestureRecognizer *labelTapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(labelClick)];
    [_resend addGestureRecognizer:labelTapGestureRecognizer];
    _resend.userInteractionEnabled = YES;
    [_loginbtn addTarget:self action:@selector(login:) forControlEvents:UIControlEventTouchUpInside];
    [_wrongVcode setImage:[UIImage imageNamed:@"toast"]];
    
}

-(void)passViewController:(NSString *)str{
    NSLog(@"-----------%@",str);
    tel = str;
}

-(void)timeFireMethod{
    secondsCountDown--;
    _countdown.text = [NSString stringWithFormat:@"%d秒后 重新发送验证码", secondsCountDown];
    if(secondsCountDown == 0){
        _countdown.hidden = YES;
        _resend.hidden = NO;
        
    }
}

- (void)labelClick {
    _countdown.hidden = NO;
    _resend.hidden = YES;
    secondsCountDown = 60;
    countDownTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeFireMethod) userInfo:nil repeats:YES];
    _countdown.text=[NSString stringWithFormat:@"%d秒后 重新发送验证码", secondsCountDown];
}

-(void)textFieldDidChange :(UITextField *)theTextField{
    [_loginbtn setBackgroundImage:[UIImage imageNamed:@"btnorange"] forState:UIControlStateNormal];
    if(theTextField.text.length == 0){
        [_loginbtn setBackgroundImage:[UIImage imageNamed:@"btngray"] forState:UIControlStateNormal];
    }
}

- (void)back:(id)sender{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)login:(id)sender{
    BOOL *b = 1;
    if(b == 1){
        //login
        ViewController *vc = [ViewController alloc];
//        [self presentViewController:vc animated:YES completion:nil];
        UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main"bundle:nil];
        [self presentViewController:[story instantiateInitialViewController] animated:YES completion:nil];
    }else{
        _wrongVcode.hidden = NO;
        _wrongVcodelabel.hidden = NO;
        [_loginbtn setUserInteractionEnabled:NO];
        [_inputVcode setUserInteractionEnabled:NO];
    }
    
    int64_t delayInSeconds = 2.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        // do something
        _wrongVcode.hidden = YES;
        _wrongVcodelabel.hidden = YES;
        [_loginbtn setUserInteractionEnabled:YES];
        [_inputVcode setUserInteractionEnabled:YES];
    });
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
