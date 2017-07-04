//
//  LoginViewController.h
//  AnQuanBaoV2
//
//  Created by yyfwptz on 2017/7/3.
//  Copyright © 2017年 yyfwptz. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol secondViewDelegate
-(void)passViewController:(NSString*)str;//1a.定义协议与方法
@end
@interface LoginViewController : UIViewController
@property(retain,nonatomic)id<secondViewDelegate>secondDelegate;
@property (strong, nonatomic) IBOutlet UIButton *vcodeBtn;//获取验证码
@property (strong, nonatomic) IBOutlet UIImageView *icon;
@property (strong, nonatomic) IBOutlet UIImageView *line;
@property (strong, nonatomic) IBOutlet UITextField *input;
@property (strong, nonatomic) IBOutlet UIImageView *toastImage;
@property (strong, nonatomic) IBOutlet UILabel *toastLabel;

@end
