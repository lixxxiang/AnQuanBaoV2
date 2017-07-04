//
//  CompleteView.m
//  AnQuanBaoV2
//
//  Created by yyfwptz on 2017/7/3.
//  Copyright © 2017年 yyfwptz. All rights reserved.
//

#import "CompleteView.h"

@implementation CompleteView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

//UISwipeGestureRecognizer * recognizer;
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self awakeFromNib];
    }
    return self;
}

- (void)awakeFromNib{
    [super awakeFromNib];
    self.completeView = [[[NSBundle mainBundle]loadNibNamed:@"CompleteView" owner:self options:nil]lastObject];
    self.completeView.frame = self.bounds;
    [self addSubview:self.completeView];
    [_completeImage setImage:[UIImage imageNamed:@"complete"]];
    
//    recognizer = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipeFrom:)];
//    [recognizer setDirection:(UISwipeGestureRecognizerDirectionUp)];
//    [self addGestureRecognizer:recognizer];
//    
//    recognizer = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipeFrom:)];
//    [recognizer setDirection:(UISwipeGestureRecognizerDirectionDown)];
//    [self addGestureRecognizer:recognizer];

}

- (void)handleSwipeFrom:(UISwipeGestureRecognizer *)recognizer{
    if(recognizer.direction == UISwipeGestureRecognizerDirectionDown) {
        NSLog(@"swipe down");
//        [delegate slideDown];
    }
    if(recognizer.direction == UISwipeGestureRecognizerDirectionUp) {
        NSLog(@"swipe up");
//        [delegate slideUp];
    }
}

@end
