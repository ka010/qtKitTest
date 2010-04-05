//
//  AlbumTransformer.m
//  qtKitTest
//
//  Created by ka010 on 4/5/10.
//  Copyright 2010 HdM. All rights reserved.
//

#import "AlbumTransformer.h"


@implementation AlbumTransformer
+(Class)transformedValueClass {
	return [NSString class];
}

+ (BOOL)allowsReverseTransformation {
	return NO;
}

- (NSString *)transformedValue:(PlaybackItem *)item {

	NSString *path = [[item tag]album];
	return path;
}
@end
