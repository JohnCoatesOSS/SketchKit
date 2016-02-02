//
//  SKK_MSStylePart.m
//  SketchKit
//
//  Created by John Coates on 2/2/16.
//  Copyright © 2016 John Coates. All rights reserved.
//

#import "SKK_MSStylePart-Private.h"

@interface SKK_MSStylePart ()

@property (strong) STUB_MSStylePart *stylePart;

@end

@implementation SKK_MSStylePart

+ (instancetype)stylePartWithStylePart:(STUB_MSStylePart *)stubStylePart {
    
    if ([stubStylePart isKindOfClass:NSClassFromString(@"MSStyleBorder")]) {
        STUB_MSStyleBorder *stubBorder = (STUB_MSStyleBorder *)stubStylePart;
        return [[SKK_MSStyleBorder alloc] initWithBorder:stubBorder];
    }
    
    return [[SKK_MSStylePart alloc] initWithStylePart:stubStylePart];
}

- (instancetype)initWithStylePart:(STUB_MSStylePart *)stylePart {
    self = [super init];

    if (self) {
        _stylePart = stylePart;
    }
    
    return self;
}

- (NSString *)XMLElementName {
    return @"stylePart";
}

- (NSXMLElement *)XMLRepresentation {
    NSXMLElement *element = [NSXMLElement elementWithName:[self XMLElementName]];
    
    return element;
}

- (NSString *)XMLString {
    return [self.XMLRepresentation XMLStringWithOptions:NSXMLNodePrettyPrint | NSXMLNodeCompactEmptyElement];
}

@end
