//
//  SKK_MShapeGroup.h
//  SketchKit
//
//  Created by John Coates on 2/1/16.
//  Copyright © 2016 John Coates. All rights reserved.
//

@interface SKK_MSShapeGroup : SKK_MSLayer

@property (retain, nonatomic) NSBezierPath *bezierPath;


// XML
+ (instancetype)shapeWithXMLElement:(NSXMLElement *)element;

@end
