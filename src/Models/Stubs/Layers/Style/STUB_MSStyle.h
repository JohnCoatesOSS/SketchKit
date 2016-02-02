//
//  STUB_MSStyle.h
//  SketchKit
//
//  Created by John Coates on 2/2/16.
//  Copyright © 2016 John Coates. All rights reserved.
//

#import <Foundation/Foundation.h>

@class STUB_MSStylePartCollection;

@interface STUB_MSStyle : NSObject

//@property (readonly) STUB_MSStyleBorder *border;
//@property (readonly) CSK_MSStyleShadow *shadow;
//@property (readonly) CSK_MSStyleShadow *innerShadow;
//@property(retain, nonatomic) CSK_MSStyleFill *fill;
@property(retain, nonatomic) STUB_MSStylePartCollection *borders;
//@property(retain, nonatomic) CSK_MSStylePartCollection *shadows;
@property(retain, nonatomic) STUB_MSStylePartCollection *fills;

@end
