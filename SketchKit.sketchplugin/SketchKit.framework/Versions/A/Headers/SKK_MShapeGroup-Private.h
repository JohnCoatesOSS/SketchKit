//
//  SKK_MShapeGroup-Private.h
//  SketchKit
//
//  Created by John Coates on 2/1/16.
//  Copyright © 2016 John Coates. All rights reserved.
//

#import "SKK_MShapeGroup.h"

@interface SKK_MSShapeGroup (Private)

+ (instancetype)shapeWithBezierPath:(NSBezierPath *)bezierPath;

- (instancetype)initWithShapeGroup:(STUB_MSShapeGroup *)shapeGroup;

@end
