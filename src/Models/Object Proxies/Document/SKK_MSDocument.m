//
//  SKK_MSDocument.m
//  SketchKit
//
//  Created by John Coates on 2/1/16.
//  Copyright © 2016 John Coates. All rights reserved.
//

#import "SKK_MSDocument.h"

@interface SKK_MSDocument ()

@property (strong) STUB_MSDocument *document;

@end

@implementation SKK_MSDocument

- (instancetype)initWithMSDocument:(STUB_MSDocument *)document {
    self = [super init];
    if (self) {
        _document = document;
    }
    
    return self;
}

- (void)displayMessage:(NSString *)message {
    SEL selector = @selector(displayMessage:);
    if (![self.document respondsToSelector:selector]) {
        NSLog(@"Error: %@ doesn't respond to %@",
              NSStringFromClass(self.document.class),
              NSStringFromSelector(selector)
              );
        return;
    }
    
    [self.document displayMessage:message];
}

- (void)reloadInspector {
    SEL selector = @selector(reloadInspector);
    if (![self.document respondsToSelector:selector]) {
        NSLog(@"Error: %@ doesn't respond to %@",
              NSStringFromClass(self.document.class),
              NSStringFromSelector(selector)
              );
        return;
    }
    
    [self.document reloadInspector];
}

- (SKK_MSPage *)currentPage {
    SEL selector = @selector(currentPage);
    if (![self.document respondsToSelector:selector]) {
        NSLog(@"Error: %@ doesn't respond to %@",
              NSStringFromClass(self.document.class),
              NSStringFromSelector(selector)
              );
        return nil;
    }
    
    STUB_MSPage *stubPage = [self.document currentPage];
    
    if (!stubPage) {
        return nil;
    }
    
    SKK_MSPage *page = [[SKK_MSPage alloc] initWithPage:stubPage];
    
    return page;
}

@end
