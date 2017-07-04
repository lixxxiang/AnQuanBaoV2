//
//  CallPoliceView.m
//  AnQuanBaoV2
//
//  Created by yyfwptz on 2017/6/30.
//  Copyright © 2017年 yyfwptz. All rights reserved.
//

#import "CallPoliceView.h"

@implementation CallPoliceView
@synthesize delegate;
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
UISwipeGestureRecognizer * recognizer;
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self awakeFromNib];
    }
    return self;
}

- (void)awakeFromNib{
    [super awakeFromNib];
    self.cpView = [[[NSBundle mainBundle]loadNibNamed:@"CallPoliceView" owner:self options:nil]lastObject];
    self.cpView.frame = self.bounds;
    [self addSubview:self.cpView];
    [_imageView setImage:[UIImage imageNamed:@"image"]];
    _imageView.userInteractionEnabled = YES;//打开用户交互
    [_imageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickCategory:)]];
    
    recognizer = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipeFrom:)];
    [recognizer setDirection:(UISwipeGestureRecognizerDirectionUp)];
    [self addGestureRecognizer:recognizer];
    
    recognizer = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipeFrom:)];
    [recognizer setDirection:(UISwipeGestureRecognizerDirectionDown)];
    [self addGestureRecognizer:recognizer];
    
    
}

- (void)handleSwipeFrom:(UISwipeGestureRecognizer *)recognizer{
    if(recognizer.direction == UISwipeGestureRecognizerDirectionDown) {
        NSLog(@"swipe down");
        [delegate slideDown];
    }
    if(recognizer.direction == UISwipeGestureRecognizerDirectionUp) {
        NSLog(@"swipe up");
        [delegate slideUp];
    }
}

-(void)clickCategory:(UITapGestureRecognizer* )gestureRecognizer
{
    UIView *viewClicked=[gestureRecognizer view];
    if (viewClicked==_imageView) {
        [delegate callPolice];
    }
}

-(void)click:(UIButton *)sender {
    [delegate callPolice];
}


-(void)click2:(UIButton *)sender {
    [delegate answer];
}



@end
