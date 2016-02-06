//
//  SKK_MSStyleBasicFill.m
//  SketchKit
//
//  Created by John Coates on 2/2/16.
//  Copyright © 2016 John Coates. All rights reserved.
//

#import "SKK_MSStyleBasicFill-Private.h"
#import "SKK_MSStylePart-Private.h"

@interface SKK_MSStyleBasicFill ()

@property (strong) STUB_MSStyleBasicFill *basicFill;

@end

@implementation SKK_MSStyleBasicFill

- (instancetype)initWithBasicFill:(STUB_MSStyleBasicFill *)basicFill {
    self = [super initWithStylePart:basicFill];

    if (self) {
        _basicFill = basicFill;
    }
    
    return self;
}


- (SKK_MSColor *)color {
    if (![self selectorCheck:self.basicFill selector:@selector(color)]) {
        return nil;
    }
    
    STUB_MSColor *stubColor = self.basicFill.color;
    if (!stubColor) {
        return nil;
    }
    
    return [[SKK_MSColor alloc] initWithColor:stubColor];
}

- (void)setColor:(SKK_MSColor *)color {
    if (![self selectorCheck:self.basicFill selector:@selector(setColor:)]) {
        return;
    }
    
    [self.basicFill setColor:color.color];
}

#pragma mark - XML

- (NSXMLElement *)XMLRepresentation {
    NSXMLElement *element = [super XMLRepresentation];
    
    NSXMLElement *color = self.color.XMLRepresentation;
    if (color) {
        [element addChild:color];
    }
    
    return element;
}

@end
