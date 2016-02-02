//
//  SKK_MSStyle.m
//  SketchKit
//
//  Created by John Coates on 2/2/16.
//  Copyright © 2016 John Coates. All rights reserved.
//

#import "SKK_MSStyle-Private.h"

@interface SKK_MSStyle ()

@property (strong) STUB_MSStyle *style;

@end

@implementation SKK_MSStyle

- (instancetype)initWithStyle:(STUB_MSStyle *)style {
    self = [super init];

    if (self) {
        _style = style;
    }
    
    return self;
}

#pragma mark - Properties

- (SKK_MSStylePartCollection *)borders {
    if (![self selectorCheck:self.style selector:@selector(borders)]) {
        return nil;
    }
    
    STUB_MSStylePartCollection *stubBorders = self.style.borders;
    if (!stubBorders) {
        return nil;
    }
    
    return [[SKK_MSStylePartCollection alloc] initWithCollection:stubBorders];
}

#pragma mark - XML Output

- (NSXMLElement *)XMLRepresentation {
    NSXMLElement *element = [NSXMLElement elementWithName:@"style"];
    
    NSXMLElement *borders = [self bordersXML];
    if (borders) {
        [element addChild:borders];
    }
    
    return element;
}

- (NSString *)XMLString {
    return [self.XMLRepresentation XMLStringWithOptions:NSXMLNodePrettyPrint | NSXMLNodeCompactEmptyElement];
}

- (NSXMLElement *)bordersXML {
    SKK_MSStylePartCollection *borders = self.borders;
    if (!borders) {
        return nil;
    }
    
    NSXMLElement *element = [NSXMLElement elementWithName:@"borders"];
    
    for (SKK_MSStyleBorder *border in borders) {
        NSLog(@"SKK border: %@ (%p)", border, border);
        NSXMLElement *borderElement = border.XMLRepresentation;
        if (borderElement) {
            [element addChild:borderElement];
        }
    }
    
    return element;
}

@end
