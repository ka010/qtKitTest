//
//  PlaybackItem.h
//  qtKitTest
//
//  Created by ka010 on 4/5/10.
//  Copyright 2010 HdM. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <TagLibKit/tagLib.h>

@interface PlaybackItem : NSObject {

	NSString *path;
	tagLib *tag;
}

@property(copy) NSString *path;
@property(retain) tagLib *tag;

-(NSString *)getPath;

@end
