//
//  PlayerController.h
//  qtKitTest
//
//  Created by ka010 on 3/31/10.
//  Copyright 2010 HdM. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Player.h"
#import <TagLibKit/tagLib.h>
#import "PlaybackItem.h"

@interface PlayerController : NSObject {
	Player *player;
	
	NSMutableArray *filenames;
	
	IBOutlet NSArrayController *arrayController;
	
	IBOutlet NSTextField *pathField;
	IBOutlet NSLevelIndicator *volSlider;
	IBOutlet NSButton *stopButton;
	IBOutlet NSButton *startButton;
	IBOutlet DragDropTableView *fileTable;
	IBOutlet NSLevelIndicator *positionBar;
}

- (IBAction)play:(id)sender;
- (IBAction)stop:(id)sender;
- (IBAction)next:(id)sender;
- (IBAction)prev:(id)sender;
- (IBAction)setVol:(id)sender;


@end
