//
//  SKKProxyObject.h
//  SketchKit
//
//  Created by John Coates on 2/2/16.
//  Copyright © 2016 John Coates. All rights reserved.
//

#import "STUBObject.h"

@interface SKKProxyObject : NSObject

@property (strong) STUBObject *targetObject;

- (instancetype)initWithTarget:(STUBObject *)targetObject;

@end
