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
	NSString *path = [NSString stringWithFormat:@"%@", [[item tag]track]];
	return path;
}


@end
