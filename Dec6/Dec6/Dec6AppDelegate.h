//
//  Dec6AppDelegate.h
//  Dec6
//
//  Created by Hachi on 12/1/12.
//  Copyright (c) 2012 Hachi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVAudioPlayer.h>
@class ViewController;

@interface Dec6AppDelegate : UIResponder <UIApplicationDelegate>{
	UIWindow *_window;
	AVAudioPlayer *player;
}


@property (strong, nonatomic) UIWindow *window;

@end
