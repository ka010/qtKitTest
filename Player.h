//
//  Player.h
//  qtKitTest
//
//  Created by ka010 on 3/31/10.
//  Copyright 2010 HdM. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <QTKit/QTKit.h>

@interface Player : NSObject {
	QTMovie * audio;
	NSString *currentFile;
}

@property(retain) QTMovie *audio;

@property(readwrite) NSString *currentFile;

- (void)playList:(NSArray *)list;

- (void)playFile: (NSString *)file;

- (void)play;

- (void)stop;

- (void)setVol:(float)volume;

@end
