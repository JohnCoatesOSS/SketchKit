//
//  SKKProxyObject-Private.h
//  SketchKit
//
//  Created by John Coates on 2/2/16.
//  Copyright © 2016 John Coates. All rights reserved.
//

#import "SKKProxyObject.h"

@interface SKKProxyObject (Private)

- (BOOL)selectorCheck:(NSObject *)instance selector:(SEL)selector;
- (BOOL)classSelectorCheck:(Class)class selector:(SEL)selector;
- (BOOL)classInstancesSelectorCheck:(Class)class selector:(SEL)selector;
+ (BOOL)selectorCheck:(NSObject *)instance selector:(SEL)selector;
+ (BOOL)classSelectorCheck:(Class)class selector:(SEL)selector;
+ (BOOL)classInstancesSelectorCheck:(Class)class selector:(SEL)selector;

@end