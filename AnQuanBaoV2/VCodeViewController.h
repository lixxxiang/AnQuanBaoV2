//
//  VCodeViewController.h
//  AnQuanBaoV2
//
//  Created by yyfwptz on 2017/7/4.
//  Copyright © 2017年 yyfwptz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VCodeViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIButton *backBtn;
@property (strong, nonatomic) IBOutlet UILabel *countdown;
@property (strong, nonatomic) IBOutlet UILabel *vcodeInfo;
@property (strong, nonatomic) IBOutlet UITextField *inputVcode;
@property (strong, nonatomic) IBOutlet UIButton *loginbtn;
@property (strong, nonatomic) IBOutlet UIImageView *line;
@property (strong, nonatomic) IBOutlet UILabel *otherCountDown;
@property (strong, nonatomic) IBOutlet UILabel *resend;
@property (strong, nonatomic) IBOutlet UIImageView *wrongVcode;
@property (strong, nonatomic) IBOutlet UILabel *wrongVcodelabel;

@end
