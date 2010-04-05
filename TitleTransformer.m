//
//  TitleTransformer.m
//  qtKitTest
//
//  Created by ka010 on 4/5/10.
//  Copyright 2010 HdM. All rights reserved.
//

#import "TitleTransformer.h"


@implementation TitleTransformer
+(Class)transformedValueClass {
	return [NSString class];
}

+ (BOOL)allowsReverseTransformation {
	return NO;
}

- (NSString *)transformedValue:(PlaybackItem *)item {

	NSString *path = [[item tag]title];
	return path;
}
@end
