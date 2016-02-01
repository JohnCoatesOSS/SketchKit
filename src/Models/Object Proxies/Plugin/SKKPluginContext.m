//
//  SKKPluginContext.m
//  SketchKit
//
//  Created by John Coates on 2/1/16.
//  Copyright © 2016 John Coates. All rights reserved.
//

#import "SKKPluginContext.h"

@interface SKKPluginContext ()

@end

@implementation SKKPluginContext

- (instancetype)initWithSketchContext:(NSDictionary *)sketchContext {
    self = [super init];
    if (self) {
        _sketchContext = sketchContext;
    }
    
    return self;
}

- (SKK_MSDocument *)document {
    STUB_MSDocument *document = _sketchContext[@"document"];
    if (!document) {
        return nil;
    }
    
    SKK_MSDocument *documentProxy = [[SKK_MSDocument alloc]
                                     initWithMSDocument:document];
    
    return documentProxy;
}

@end
