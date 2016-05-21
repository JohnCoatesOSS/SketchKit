//
//  SKK_MSShapePathLayer.m
//  SketchKit
//
//  Created by John Coates on 4/11/16.
//  Copyright © 2016 John Coates. All rights reserved.
//

#import "SKK_MSShapePathLayer.h"
#import "SKK_MSShapePath.h"

@interface SKK_MSShapePathLayer ()

@property (strong) STUB_MSShapePathLayer *shapePathLayer;

@end

@implementation SKK_MSShapePathLayer

- (instancetype)initWithShapePathLayer:(STUB_MSShapePathLayer *)shapePathLayer {
    self = [super initWithLayer:shapePathLayer];
    if (self) {
        self.shapePathLayer = shapePathLayer;
    }
    
    return self;
}


- (SKK_MSShapePath *)path {
    if (!_path) {
        STUB_MSShapePath *path = self.shapePathLayer.path;
        if (!path) {
            return nil;
        }
        
        _path = [[SKK_MSShapePath alloc] initWithShapePath:path];
    }
    
    return _path;
}

- (void)setPath:(SKK_MSShapePath *)path {
    _path = path;
    self.shapePathLayer.path = path.shapePath;
}

@end
