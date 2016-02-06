//
//  STUB_MSImmutableShapeGroup.h
//  SketchKit
//
//  Created by John Coates on 2/1/16.
//  Copyright © 2016 John Coates. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface STUB_MSImmutableShapeGroup : NSObject <NSCoding>

- (void)performInitWithMutableModelObject:(id)arg1;

@property(readonly, nonatomic) NSBezierPath *bezierPath;
@property(readonly, nonatomic) NSBezierPath *bezierPathWithTransforms;

@end
