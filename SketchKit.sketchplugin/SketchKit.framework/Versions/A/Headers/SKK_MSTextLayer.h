//
//  SKK_MSTextLayer.h
//  SketchKit
//
//  Created by John Coates on 2/5/16.
//  Copyright © 2016 John Coates. All rights reserved.
//

@interface SKK_MSTextLayer : SKKProxyObject

@property (nonatomic) NSFont *font;

// AKA line-height
@property (nonatomic) double lineSpacing;

// AKA letter-spacing
@property(nonatomic) double characterSpacing;

@end
