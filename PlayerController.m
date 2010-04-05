//
//  PlayerController.m
//  qtKitTest
//
//  Created by ka010 on 3/31/10.
//  Copyright 2010 HdM. All rights reserved.
//

#import "DragDropTableView.h"
#import "PlayerController.h"


@implementation PlayerController

- (void) awakeFromNib {
	
	filenames = [[NSMutableArray alloc] init];
	[fileTable setDoubleAction:@selector(play:)];
	[fileTable setTarget:self];

	// init player 
	player = [[Player alloc]init];
	
	// init tagReader
	tagLibWrapper = [[tagLib alloc]init];
	
}

- (void) acceptFilenameDrag:(NSString *) filename {
		
	tagLib *tag = [[tagLib alloc]init];
	[tag initWithFile:filename];

	PlaybackItem *item = [[PlaybackItem alloc]init];
	[item setPath:filename];
	[item setTag:tag];

	[arrayController addObject:item];
	
	
}

- (IBAction)play:(id)sender {
	    
	NSArray *selection = [arrayController selectedObjects];
	PlaybackItem *item = [selection objectAtIndex:0];
	NSString *p = [item path];
	NSLog(@"path: = %@" ,p);
	
	// pass file to player and start playback
	[player playFile:p];
	
	tagLib *tag = [item tag];
	
	// build now-playing string
	NSString *title = [tag artist];
	title = [title stringByAppendingString:@" - "];
	title = [title stringByAppendingString:[tag title]];
	title = [title stringByAppendingString:@" - "];
	title = [title stringByAppendingString:[tag album]];
	
	// log the entire tag to console 
	[[item tag]log];
	
	// display tag in now-playing field 	
	[pathField setStringValue:title];

}

- (IBAction)next:(id)sender {
	[arrayController setSelectionIndex:[arrayController selectionIndex]+1];

	[self play:self];
	
//	NSLog(@"selection: = %@",[arrayController selectedObjects]);
	
}

- (IBAction)prev:(id)sender {
	[arrayController setSelectionIndex:[arrayController selectionIndex]-1];
	
	[self play:self];
	//NSLog(@"selection: = %@",[arrayController selectedObjects]);

}

- (IBAction)stop:(id)sender {
	[player stop];
	[startButton setNextState];
	
}

- (IBAction)setVol:(id)sender {
	float vol = [volSlider floatValue];
	[player setVol:vol];
}



@end
