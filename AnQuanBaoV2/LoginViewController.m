//
//  LoginViewController.m
//  AnQuanBaoV2
//
//  Created by yyfwptz on 2017/7/3.
//  Copyright © 2017年 yyfwptz. All rights reserved.
//

#import "LoginViewController.h"
#import "VCodeViewController.h"



@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [_icon setImage:[UIImage imageNamed:@"icon1"]];
    [_line setImage:[UIImage imageNamed:@"line"]];
    [_input addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    [_vcodeBtn addTarget:self action:@selector(vcodeValidate:) forControlEvents:UIControlEventTouchUpInside];
    [_vcodeBtn setBackgroundImage:[UIImage imageNamed:@"btngray"] forState:UIControlStateNormal];
    _input.keyboardType = UIKeyboardTypeNumberPad;
}

-(void)textFieldDidChange :(UITextField *)theTextField{
    [_vcodeBtn setBackgroundImage:[UIImage imageNamed:@"btnorange"] forState:UIControlStateNormal];
    if(theTextField.text.length == 0){
        [_vcodeBtn setBackgroundImage:[UIImage imageNamed:@"btngray"] forState:UIControlStateNormal];
    }
}

-(void)vcodeValidate:(id)sender{
    BOOL str = [self valiMobile:_input.text];//判断是否合法手机号
    NSLog(@"%d",str);
    //str = 1;//test
    if(str == 1){//1 合法 0 非法
        //发送验证码
        NSURL *url = [NSURL URLWithString:[URLPrefix stringByAppendingString:@"mobile/common/sendMessage/"]];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:0 timeoutInterval:2.0f];
        request.HTTPMethod = @"POST";
        NSString *tel = [@"telephone=" stringByAppendingString : _input.text];
        request.HTTPBody = [tel dataUsingEncoding : NSUTF8StringEncoding];
        [[[NSURLSession sharedSession] dataTaskWithRequest : request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            NSLog(@"return:%@",[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
        }] resume];

        
        //跳转
        VCodeViewController *vvc = [[VCodeViewController alloc]init];
        self.secondDelegate = vvc;
        [self.secondDelegate passViewController:_input.text];
        [self presentViewController:vvc animated:YES completion:nil];
    }else{
        [_vcodeBtn setUserInteractionEnabled:NO];
        [_input setUserInteractionEnabled:NO];
        _toastImage.hidden = NO;
        _toastLabel.hidden = NO;
        [_toastImage setImage:[UIImage imageNamed:@"toast"]];
        int64_t delayInSeconds = 2.0;
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            // do something
            _toastImage.hidden = YES;
            _toastLabel.hidden = YES;
            [_vcodeBtn setUserInteractionEnabled:YES];
            [_input setUserInteractionEnabled:YES];
        });
        
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)valiMobile:(NSString *)mobile
{
    mobile = [mobile stringByReplacingOccurrencesOfString:@" " withString:@""];
    if (mobile.length != 11)
    {
        return NO;
    }else{

        NSString *CM_NUM = @"^((13[4-9])|(147)|(15[0-2,7-9])|(178)|(18[2-4,7-8]))\\d{8}|(1705)\\d{7}$";
        NSString *CU_NUM = @"^((13[0-2])|(145)|(15[5-6])|(176)|(18[5,6]))\\d{8}|(1709)\\d{7}$";
        NSString *CT_NUM = @"^((133)|(153)|(177)|(18[0,1,9]))\\d{8}$";
        NSPredicate *pred1 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM_NUM];
        BOOL isMatch1 = [pred1 evaluateWithObject:mobile];
        NSPredicate *pred2 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU_NUM];
        BOOL isMatch2 = [pred2 evaluateWithObject:mobile];
        NSPredicate *pred3 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT_NUM];
        BOOL isMatch3 = [pred3 evaluateWithObject:mobile];
        
        if (isMatch1 || isMatch2 || isMatch3) {
            return YES;
        }else{
            return NO;
        }
    }
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
