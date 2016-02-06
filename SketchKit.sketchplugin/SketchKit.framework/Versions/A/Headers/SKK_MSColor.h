//
//  SKK_MSColor.h
//  SketchKit
//
//  Created by John Coates on 2/2/16.
//  Copyright © 2016 John Coates. All rights reserved.
//

@interface SKK_MSColor : SKKProxyObject <SKKXMLProtocol>

@property(readonly, nonatomic) double red;
@property(readonly, nonatomic) double green;
@property(readonly, nonatomic) double blue;
@property(readonly, nonatomic) double alpha;

+ (instancetype)colorWithRed:(double)red
             green:(double)green
              blue:(double)blue
             alpha:(double)alpha;

@end
