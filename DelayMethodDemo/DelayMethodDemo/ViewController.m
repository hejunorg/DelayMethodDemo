//
//  ViewController.m
//  DelayMethodDemo
//
//  Created by hejun on 9/7/16.
//  Copyright © 2016 teamleader. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
- (IBAction)clickButton:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	// 1.performSelector
//	[self delayMethod];
	
//	[self performSelector];
	
//	[self nsTimer];
	
//	[self sleep];
//	dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//	dispatch_async(queue, ^{
//		[self sleep];
//	});
	
	[self dispatchAfter];
}

/**
 * 1. performSelector
 */
- (void)performSelector {
	[self performSelector:@selector(delayMethod) withObject:nil afterDelay:3];
	NSLog(@"start : %@", [NSDate date]);
	
	[NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(delayMethod) object:nil];
}

/**
 * 2. NSTimer
 */
- (void)nsTimer {
	NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(delayMethod) userInfo:nil repeats:NO];
	NSLog(@"start : %@", [NSDate date]);
	
	[timer invalidate];
}

/**
 * 3. sleep
 */
- (void)sleep {
	NSLog(@"start : %@", [NSDate date]);
	[NSThread sleepForTimeInterval:3.f];
//	[NSThread exit];
	
	[self delayMethod];
}

/**
 * 4.
 */
- (void)dispatchAfter {
	NSLog(@"start : %@", [NSDate date]);
	dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
		[self delayMethod];
	});
}

- (void)delayMethod {
	NSLog(@"execute : %@", [NSDate date]);
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (IBAction)clickButton:(id)sender {
	NSLog(@"%s", __func__);
}
@end
