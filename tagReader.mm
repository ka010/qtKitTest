//
//  tagReader.m
//  qtKitTest
//
//  Created by ka010 on 4/3/10.
//  Copyright 2010 HdM. All rights reserved.
//

#import "tagReader.h"


@implementation tagReader
@synthesize file;
@synthesize tag;

-(void)initWithFile:(NSString *)f {
	file = taglib_file_new([f cString]);
	tag = taglib_file_tag(file);
}

-(void)read:(NSString *)f {
	
	file = taglib_file_new([f cString]);
	tag = taglib_file_tag(file);
	
	NSString *title;
	title = [NSString stringWithCString: taglib_tag_title(tag)];
}

-(NSString *)title {

	NSString *title = [NSString stringWithCString: taglib_tag_title(tag)];
	
	return title;
}

-(NSString *)artist {
	
	NSString *artist = [NSString stringWithCString: taglib_tag_artist(tag)];
	
	return artist;
}

-(NSString *)album {
	
	NSString *album = [NSString stringWithCString: taglib_tag_album(tag)];
	
	return album;
}
@end
