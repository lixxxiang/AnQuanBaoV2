//
//  FailedPoliceView.h
//  AnQuanBaoV2
//
//  Created by yyfwptz on 2017/7/4.
//  Copyright © 2017年 yyfwptz. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol fDelegate<NSObject>

-(void)makecall;
@end
@protocol secondViewDelegate
-(void)passViewController:(NSString*)str;//1a.定义协议与方法
@end
@interface FailedPoliceView : UIView
@property(retain,nonatomic)id<secondViewDelegate>secondDelegate;
@property (strong, nonatomic) IBOutlet UIButton *fail;
@property (strong, nonatomic) IBOutlet UIView *failview;
@property (strong, nonatomic) id<fDelegate> delegate;
@end
