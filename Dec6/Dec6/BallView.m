//
//  BallView.m
//  Dec6
//
//  Created by Hachi on 12/2/12.
//  Copyright (c) 2012 Hachi. All rights reserved.
//

#import "BallView.h"

@implementation BallView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
	UIImage *image = [UIImage imageNamed:@"ball_obama.jpg"];
	CGPoint point = CGPointMake(0,0);
	[image drawAtPoint: point];
 
 
}


@end
