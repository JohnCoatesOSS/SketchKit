//
//  SKK_MSStyleBorder.h
//  SketchKit
//
//  Created by John Coates on 2/2/16.
//  Copyright © 2016 John Coates. All rights reserved.
//

#import "SKK_MSStyleBasicFill.h"

@interface SKK_MSStyleBorder : SKK_MSStyleBasicFill

@property (nonatomic) double thickness;
@property (nonatomic) long long position;
@property (readonly, nonatomic) unsigned long long fillType;

@end
