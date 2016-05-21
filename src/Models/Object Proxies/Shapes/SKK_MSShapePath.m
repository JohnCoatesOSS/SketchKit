//
//  SKK_MSShapePath.m
//  SketchKit
//
//  Created by John Coates on 4/11/16.
//  Copyright © 2016 John Coates. All rights reserved.
//

#import "SKK_MSShapePath.h"

@implementation SKK_MSShapePath

- (instancetype)initWithShapePath:(STUB_MSShapePath *)shapePath {
    self = [super initWithTarget:shapePath];
    
    if (self) {
        _shapePath = shapePath;
    }
    
    return self;
}

- (NSArray *)points {
    return self.shapePath.points;
}

@end
