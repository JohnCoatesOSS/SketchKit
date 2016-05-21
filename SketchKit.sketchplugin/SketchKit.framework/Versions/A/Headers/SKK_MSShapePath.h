//
//  SKK_MSShapePath.h
//  SketchKit
//
//  Created by John Coates on 4/11/16.
//  Copyright © 2016 John Coates. All rights reserved.
//

#import <SketchKit/SketchKit.h>

@interface SKK_MSShapePath : SKKProxyObject

@property (strong) STUB_MSShapePath *shapePath;
@property(retain, nonatomic) NSArray *points;

- (instancetype)initWithShapePath:(STUB_MSShapePath *)shapePath;

@end
