//
//  TagTransformer.m
//  qtKitTest
//
//  Created by ka010 on 4/5/10.
//  Copyright 2010 HdM. All rights reserved.
//

#import "TagTransformer.h"


@implementation TagTransformer

+(Class)transformedValueClass {
	return [NSString class];
}

+ (BOOL)allowsReverseTransformation {
	return NO;
}

- (NSString *)transformedValue:(PlaybackItem *)item {
	//NSString *title = [tag artist];
	//title = [title stringByAppendingString:@" - "];
	//title = [title stringByAppendingString:[tag title]];
//	title = [title stringByAppendingString:@" - "];
//	title = [title stringByAppendingString:[tag album]];
	NSString *path = [[item tag]title];
	return path;
}


@end
