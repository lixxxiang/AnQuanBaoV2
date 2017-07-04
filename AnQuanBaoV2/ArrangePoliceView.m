//
//  ArrangePoliceView.m
//  AnQuanBaoV2
//
//  Created by yyfwptz on 2017/7/4.
//  Copyright © 2017年 yyfwptz. All rights reserved.
//

#import "ArrangePoliceView.h"

@implementation ArrangePoliceView
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
    self.arrangeView = [[[NSBundle mainBundle]loadNibNamed:@"ArrangePoliceView" owner:self options:nil]lastObject];
    self.arrangeView.frame = self.bounds;
    [self addSubview:self.arrangeView];
    
    [_s addTarget:self action:@selector(s:) forControlEvents:UIControlEventTouchUpInside];
    [_f addTarget:self action:@selector(f:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)s:(id)sender{
    NSLog(@"sds");
    [delegate s];
}

-(void)f:(id)sender{
    [delegate f];
}

@end
