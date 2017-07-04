//
//  FailedPoliceView.m
//  AnQuanBaoV2
//
//  Created by yyfwptz on 2017/7/4.
//  Copyright © 2017年 yyfwptz. All rights reserved.
//

#import "FailedPoliceView.h"

@implementation FailedPoliceView
@synthesize delegate;
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self awakeFromNib];
    }
    return self;
}

- (void)awakeFromNib{
    [super awakeFromNib];
    self.failview = [[[NSBundle mainBundle]loadNibNamed:@"FailedPoliceView" owner:self options:nil]lastObject];
    self.failview.frame = self.bounds;
    [self addSubview:self.failview];
    [_fail setBackgroundImage:[UIImage imageNamed:@"fail"] forState:UIControlStateNormal];
    [_fail addTarget:self action:@selector(makecall:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)makecall:(id)sender{
    NSLog(@"sds");
    [delegate makecall];
}



@end
