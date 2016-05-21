//
//  STUB_MSTextLayer.h
//  SketchKit
//
//  Created by John Coates on 2/5/16.
//  Copyright © 2016 John Coates. All rights reserved.
//

#import <SketchKit/SketchKit.h>

@interface STUB_MSTextLayer : STUB_MSLayer

@property(nonatomic) double fontSize;
@property(nonatomic) NSFont *font;
@property(nonatomic) unsigned long long textAlignment;
@property(readonly, nonatomic) double defaultLineHeight;
@property(nonatomic) double lineSpacing;

// Sketch 3.8
//@property(nonatomic) NSNumber *characterSpacing;
// Sketch 3.6
@property(nonatomic) double characterSpacing;

@end
