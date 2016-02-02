//
//  SKK_MSColor.m
//  SketchKit
//
//  Created by John Coates on 2/2/16.
//  Copyright © 2016 John Coates. All rights reserved.
//

#import "SKK_MSColor-Private.h"

@interface SKK_MSColor ()

@property (strong) STUB_MSColor *color;

@end

@implementation SKK_MSColor

- (instancetype)initWithColor:(STUB_MSColor *)color {
    self = [super init];

    if (self) {
        _color = color;
    }
    
    return self;
}

+ (instancetype)colorWithRed:(double)red
             green:(double)green
              blue:(double)blue
             alpha:(double)alpha {
    
    Class class = NSClassFromString(@"MSColor");
    if (![self classSelectorCheck:class selector:@selector(colorWithRed:green:blue:alpha:)]) {
        return nil;
    }
    
    STUB_MSColor *colorStub = [class colorWithRed:red
                                            green:green
                                             blue:blue
                                            alpha:alpha];
    
    if (!colorStub) {
        return nil;
    }
    
    return [[SKK_MSColor alloc] initWithColor:colorStub];
}

#pragma mark - Properties

- (double)red {
    if (![self selectorCheck:self.color selector:@selector(red)]) {
        return 0;
    }
    return self.color.red;
}

- (double)green {
    if (![self selectorCheck:self.color selector:@selector(green)]) {
        return 0;
    }
    return self.color.green;
}

- (double)blue {
    if (![self selectorCheck:self.color selector:@selector(blue)]) {
        return 0;
    }
    return self.color.blue;
}

- (double)alpha {
    if (![self selectorCheck:self.color selector:@selector(alpha)]) {
        return 0;
    }
    return self.color.alpha;
}

#pragma mark - XML

- (NSString *)XMLElementName {
    return @"color";
}

- (NSXMLElement *)XMLRepresentation {
    NSXMLElement *element = [NSXMLElement elementWithName:[self XMLElementName]];
    
    [element addAttribute:[NSXMLNode attributeWithName:@"red" stringValue:@(self.red).stringValue]];
    [element addAttribute:[NSXMLNode attributeWithName:@"green" stringValue:@(self.green).stringValue]];
    [element addAttribute:[NSXMLNode attributeWithName:@"blue" stringValue:@(self.blue).stringValue]];
    [element addAttribute:[NSXMLNode attributeWithName:@"alpha" stringValue:@(self.alpha).stringValue]];
    
    return element;
}

- (NSString *)XMLString {
    return [self.XMLRepresentation XMLStringWithOptions:NSXMLNodePrettyPrint | NSXMLNodeCompactEmptyElement];
}

@end
