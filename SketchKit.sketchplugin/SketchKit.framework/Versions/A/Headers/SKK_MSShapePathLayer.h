//
//  SKK_MSShapePathLayer.h
//  SketchKit
//
//  Created by John Coates on 4/11/16.
//  Copyright © 2016 John Coates. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "STUB_MSShapePathLayer.h"
#import "SKK_MSLayer-Private.h"
@class SKK_MSShapePath;

@interface SKK_MSShapePathLayer : SKK_MSLayer {
    __strong SKK_MSShapePath *_path;
}

@property (retain, nonatomic) SKK_MSShapePath *path;

- (instancetype)initWithShapePathLayer:(STUB_MSShapePathLayer *)shapePathLayer;

@end
