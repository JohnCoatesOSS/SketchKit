//
//  SKK_MSStyleBorder.m
//  SketchKit
//
//  Created by John Coates on 2/2/16.
//  Copyright © 2016 John Coates. All rights reserved.
//

#import "SKK_MSStyleBorder-Private.h"
#import "SKK_MSStyleBasicFill-Private.h"

@interface SKK_MSStyleBorder ()

@property (strong) STUB_MSStyleBorder *border;

@end

@implementation SKK_MSStyleBorder

- (instancetype)initWithBorder:(STUB_MSStyleBorder *)border {
    self = [super initWithBasicFill:border];

    if (self) {
        _border = border;
    }
    
    return self;
}

#pragma mark - Properties

- (double)thickness {
    if (![self selectorCheck:self.border selector:@selector(thickness)]) {
        return 0;
    }
    return self.border.thickness;
}

- (void)setThickness:(double)thickness {
    if (![self selectorCheck:self.border selector:@selector(setThickness:)]) {
        return;
    }
    [self.border setThickness:thickness];
}

- (long long)position {
    if (![self selectorCheck:self.border selector:@selector(position)]) {
        return 0;
    }
    return self.border.position;
}

- (void)setPosition:(long long)position {
    if (![self selectorCheck:self.border selector:@selector(setPosition:)]) {
        return;
    }
    [self.border setPosition:position];
}

#pragma mark - XML Output

- (NSString *)XMLElementName {
    return @"styleBorder";
}

- (NSXMLElement *)XMLRepresentation {
    NSXMLElement *element = [super XMLRepresentation];
    
    [element addAttribute:[NSXMLNode attributeWithName:@"thickness"
                                           stringValue:@(self.thickness).stringValue]];
    [element addAttribute:[NSXMLNode attributeWithName:@"position"
                                           stringValue:@(self.position).stringValue]];
    
    return element;
}

- (NSString *)XMLString {
    return [self.XMLRepresentation XMLStringWithOptions:NSXMLNodePrettyPrint | NSXMLNodeCompactEmptyElement];
}

@end
