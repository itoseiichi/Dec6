//
//  ViewController.m
//  Dec6
//
//  Created by Hachi on 12/1/12.
//  Copyright (c) 2012 Hachi. All rights reserved.
//

#import "ViewController.h"
#import "View.h"

@implementation ViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)loadView
{
	CGRect frame = [UIScreen mainScreen].applicationFrame;
	self.view = [[View alloc] initWithFrame:frame];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
	displayLink = [CADisplayLink displayLinkWithTarget:self.view selector:@selector(move:)];
	displayLink.frameInterval = 1;
	NSRunLoop *loop = [NSRunLoop currentRunLoop];
	[displayLink addToRunLoop:loop forMode:NSDefaultRunLoopMode];
}


-(void)viewDidUnload
{
	[super viewDidUnload];
}


-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return interfaceOrientation == UIInterfaceOrientationLandscapeLeft;
}


-(void)dealloc
{
	NSRunLoop *loop = [NSRunLoop currentRunLoop];
	[displayLink removeFromRunLoop:loop forMode:NSDefaultRunLoopMode];
}


@end
