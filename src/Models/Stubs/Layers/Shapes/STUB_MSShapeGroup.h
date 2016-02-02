//
//  STUB_MSShapeGroup.h
//  SketchKit
//
//  Created by John Coates on 2/1/16.
//  Copyright © 2016 John Coates. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface STUB_MSShapeGroup : STUB_MSLayer

+ (instancetype)shapeWithBezierPath:(NSBezierPath *)bezierPath;

@property(retain, nonatomic) NSBezierPath *bezierPath;
@property(readonly, nonatomic) NSBezierPath *bezierPathWithTransforms;

@end
