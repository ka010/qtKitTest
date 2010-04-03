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
	tagRdr = [[tagReader alloc]init];
}

- (void) acceptFilenameDrag:(NSString *) filename {
		
	[arrayController addObject:filename];
	
}

- (IBAction)play:(id)sender {
	    
	NSArray *selection = [arrayController selectedObjects];
	NSString *path = [selection objectAtIndex:0];
		
	// pass file to player and start playback
	[player playFile:path];
	
//	NSArray *splittedPath =  [path componentsSeparatedByString:@"/"];
//	NSString * filename = [splittedPath objectAtIndex:[splittedPath count]-1];
	
	[tagRdr initWithFile:path];
	
	NSString *title = [tagRdr title];
	title = [title stringByAppendingString:@" - "];
	title = [title stringByAppendingString:[tagRdr artist]];
	title = [title stringByAppendingString:@" - "];
	title = [title stringByAppendingString:[tagRdr album]];
	
	NSLog(@"tag: = %@ ", title);
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
