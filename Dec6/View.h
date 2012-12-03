//
//  View.h
//  Dec6
//
//  Created by Hachi on 12/1/12.
//  Copyright (c) 2012 Hachi. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BackView;
@class BallView;

@interface View : UIView{
	UIView *paddle;
	//UIView *ball;
	CGFloat dx,dy,delta;
    BackView *back;
	BallView *ball;
}

-(void)move:(CADisplayLink *)displayLink;

@end
