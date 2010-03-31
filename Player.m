//
//  Player.m
//  qtKitTest
//
//  Created by ka010 on 3/31/10.
//  Copyright 2010 HdM. All rights reserved.
//

#import "Player.h"


@implementation Player
@synthesize audio;
@synthesize currentFile;

- (void)playFile:(NSString *)file{

	self.audio = [[QTMovie alloc] initWithFile:file error:nil];
	[self.audio play];
}

- (void)play {
	self.audio = [[QTMovie alloc] initWithFile:self.currentFile error:nil];
	[self.audio play];
}

- (void)stop {
	[self.audio stop];
//	[self.audio dealloc];
}

-(void)setVol:(float)volume {
	[self.audio setVolume:volume];
}

@end
