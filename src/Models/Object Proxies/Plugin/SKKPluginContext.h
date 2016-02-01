//
//  SKKPluginContext.h
//  SketchKit
//
//  Created by John Coates on 2/1/16.
//  Copyright © 2016 John Coates. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SKKPluginContext : NSObject

@property (strong) NSDictionary *sketchContext;
@property (nonatomic, readonly) SKK_MSDocument *document;


- (instancetype)initWithSketchContext:(NSDictionary *)sketchContext;

@end
