//
//  PlayerController.m
//  qtKitTest
//
//  Created by ka010 on 3/31/10.
//  Copyright 2010 HdM. All rights reserved.
//

#import "PlayerController.h"

@implementation PlayerController

- (IBAction)play:(id)sender {
	NSString *path;
	
	// init player 
	player = [[Player alloc]init];
    
	// get file to play
	path = [pathField stringValue];
	
	// pass file to player and start playback
	[player playFile:path];
	
	
}

- (IBAction)stop:(id)sender {
	[player stop];
}

- (IBAction)setVol:(id)sender {
	float vol = [volSlider floatValue];
	[player setVol:vol];
}

@end
