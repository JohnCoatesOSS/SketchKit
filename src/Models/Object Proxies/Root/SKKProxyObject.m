//
//  SKKProxyObject.m
//  SketchKit
//
//  Created by John Coates on 2/2/16.
//  Copyright © 2016 John Coates. All rights reserved.
//

#import "SKKProxyObject-Private.h"

@interface SKKProxyObject ()

@end

@implementation SKKProxyObject

- (instancetype)initWithTarget:(STUBObject *)targetObject {
    self = [super init];

    if (self) {
        _targetObject = targetObject;
    }
    
    return self;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"<%@ encapsulating %@>",
            NSStringFromClass([self class]), self.targetObject];
}

- (BOOL)selectorCheck:(NSObject *)instance selector:(SEL)selector {
    if (![instance respondsToSelector:selector]) {
        NSLog(@"Error: %@ doesn't respond to %@",
              NSStringFromClass(instance.class),
              NSStringFromSelector(selector)
              );
        return NO;
    }
    
    return YES;
}

- (BOOL)classSelectorCheck:(Class)class selector:(SEL)selector {
    if (![class respondsToSelector:selector]) {
        NSLog(@"Error: %@ doesn't respond to %@",
              NSStringFromClass(class),
              NSStringFromSelector(selector)
              );
        return NO;
    }
    
    return YES;
}

- (BOOL)classInstancesSelectorCheck:(Class)class selector:(SEL)selector {
    if (![class instancesRespondToSelector:selector]) {
        NSLog(@"Error: %@'s instances don't respond to %@",
              NSStringFromClass(class),
              NSStringFromSelector(selector)
              );
        return NO;
    }
    
    return YES;
}

+ (BOOL)selectorCheck:(NSObject *)instance selector:(SEL)selector {
    if (![instance respondsToSelector:selector]) {
        NSLog(@"Error: %@ doesn't respond to %@",
              NSStringFromClass(instance.class),
              NSStringFromSelector(selector)
              );
        return NO;
    }
    
    return YES;
}

+ (BOOL)classSelectorCheck:(Class)class selector:(SEL)selector {
    if (![class respondsToSelector:selector]) {
        NSLog(@"Error: %@ doesn't respond to %@",
              NSStringFromClass(class),
              NSStringFromSelector(selector)
              );
        return NO;
    }
    
    return YES;
}
+ (BOOL)classInstancesSelectorCheck:(Class)class selector:(SEL)selector {
    if (![class instancesRespondToSelector:selector]) {
        NSLog(@"Error: %@'s instances don't respond to %@",
              NSStringFromClass(class),
              NSStringFromSelector(selector)
              );
        return NO;
    }
    
    return YES;
}

@end
