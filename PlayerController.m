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
	
}

- (void) acceptFilenameDrag:(NSString *) filename {
		
	// create a tag-object for the dragged file
	tagLib *tag = [[tagLib alloc]init];
	[tag initWithFile:filename];

	// create and PlaybackItem
	PlaybackItem *item = [[PlaybackItem alloc]init];
	
	// init PlaybackItem with filename and tag
	[item setPath:filename];
	[item setTag:tag];

	// add PlaybackItem to arrayController
	[arrayController addObject:item];
	
	
}

- (IBAction)play:(id)sender {
	    
	NSArray *selection = [arrayController selectedObjects];

	// get selected PlaybackItem
	PlaybackItem *item = [selection objectAtIndex:0];
	
	// retrieve filepath from PlaybackItem
	NSString *p = [item path];
	
	// pass filepath to player and start playback
	[player playFile:p];
	
	// retrieve tag from PlaybackItem
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
	NSLog(@"time: = %@", [player currentTime]);
	NSLog(@"dur: = %@", [player duration]);
	NSLog(@"cur: = %@", [player currentPosition]);
	[self play:self];
	
}

- (IBAction)prev:(id)sender {
	[arrayController setSelectionIndex:[arrayController selectionIndex]-1];
	
	[self play:self];

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
