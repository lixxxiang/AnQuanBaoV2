//
//  ArrangePoliceView.h
//  AnQuanBaoV2
//
//  Created by yyfwptz on 2017/7/4.
//  Copyright © 2017年 yyfwptz. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol agDelegate<NSObject>
-(void)s;
-(void)f;
@end
@interface ArrangePoliceView : UIView
@property (strong, nonatomic) IBOutlet UIView *arrangeView;
@property (strong, nonatomic) IBOutlet UIButton *s;
@property (strong, nonatomic) IBOutlet UIButton *f;
@property (strong, nonatomic) id<agDelegate> delegate;
@end
