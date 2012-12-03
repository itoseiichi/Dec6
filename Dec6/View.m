//
//  View.m
//  Dec6
//
//  Created by Hachi on 12/1/12.
//  Copyright (c) 2012 Hachi. All rights reserved.
//

#import "View.h"
#import "backView.h"
#import "BallView.h"

@implementation View

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
		self.backgroundColor = [UIColor clearColor];
		
		frame = self.bounds;
		back = [[BackView alloc] initWithFrame:frame];
		[self addSubview:back];
		 
		// Create paddle
		frame = CGRectMake(100,400,100,20);
		paddle = [[UIView alloc] initWithFrame:frame];
		paddle.backgroundColor = [UIColor purpleColor];
		[self addSubview:paddle];
		
		// Create ball
		frame = CGRectMake(0,0,40,40);
		ball = [[BallView alloc] initWithFrame:frame];
		[self addSubview:ball];
		
		//inital ball direction & speed
		dx = 2;
		dy = 2;
		delta = 2;
	}
    return self;
}

//Change ball direction & speed

-(void)bounce{
	//define next motion
	CGRect horizontal = ball.frame;
	horizontal.origin.x += dx;
	CGRect vertical = ball.frame;
	vertical.origin.y += dy;
	
	//wall bounce
	if (!CGRectEqualToRect(horizontal , CGRectIntersection(horizontal , self.bounds))){
		dx = -dx;
	}
	if (!CGRectEqualToRect(vertical , CGRectIntersection(vertical , self.bounds))){
		dy = -dy;
	}

	//paddle hit
	if(!CGRectIntersectsRect(ball.frame , paddle.frame)){
		if (CGRectIntersectsRect(horizontal , paddle.frame)){
			dx = -(dx + delta * dx/abs(dx));
			dy =  (dy + delta * dy/abs(dy));
		}
		if (CGRectIntersectsRect(vertical , paddle.frame)){
			dx =  (dx + delta * dx/abs(dx));
			dy = -(dy + delta * dy/abs(dy));
		}
	}
 
	if (abs(dx)==20){
		delta = -2;
	}
	if (abs(dx)==2){
		delta = 2;
	}

}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
	UITouch *touch = [touches anyObject];
	CGPoint p = [touch locationInView:self];
	CGFloat x = p.x;
	CGFloat y = p.y;

	//paddle limitation
	CGFloat half_x = paddle.bounds.size.width /2;
	CGFloat half_y = paddle.bounds.size.height / 2;
	x = MIN(x , self.bounds.size.width - half_x);
	x = MAX(x, half_x);
	y = MIN(y , self.bounds.size.height - half_y);
	y = MAX(y, half_y);
	
	paddle.center = CGPointMake(x , y);
	[self bounce];
}


-(void)move:(CADisplayLink *)displayLink{
	ball.center = CGPointMake(ball.center.x + dx , ball.center.y + dy);
	[self bounce];
}




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
