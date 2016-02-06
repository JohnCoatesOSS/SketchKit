//
//  STUB_MSStyleBorder.h
//  SketchKit
//
//  Created by John Coates on 2/2/16.
//  Copyright © 2016 John Coates. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "STUB_MSStyleBasicFill.h"

@interface STUB_MSStyleBorder : STUB_MSStyleBasicFill

@property(nonatomic) double thickness;
@property(nonatomic) long long position;
//@property(copy, nonatomic) STUB_MSColor *color;
typedef NS_ENUM(long long, MSStyleBorderPosition) {
    MSStyleBorderPositionCenter = 0,
    MSStyleBorderPositionInside = 1,
    MSStyleBorderPositionOutside = 2,
};

@end
