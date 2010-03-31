//
//  PlayerController.h
//  qtKitTest
//
//  Created by ka010 on 3/31/10.
//  Copyright 2010 HdM. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Player.h"

@interface PlayerController : NSObject {
	Player *player;
	
	IBOutlet NSTextField *pathField;
	IBOutlet NSSlider *volSlider;
	IBOutlet NSButton *stopButton;
	IBOutlet NSButton *startButton;
}

- (IBAction)play:(id)sender;
- (IBAction)stop:(id)sender;
- (IBAction)setVol:(id)sender;

@end
