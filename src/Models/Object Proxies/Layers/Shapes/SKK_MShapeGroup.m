//
//  SKK_MShapeGroup.m
//  SketchKit
//
//  Created by John Coates on 2/1/16.
//  Copyright © 2016 John Coates. All rights reserved.
//

#import "SKK_MShapeGroup-Private.h"

@interface SKK_MSShapeGroup ()

@property (strong) STUB_MSShapeGroup *shapeGroup;

@end

@implementation SKK_MSShapeGroup

+ (instancetype)shapeWithBezierPath:(NSBezierPath *)bezierPath {
    Class class = NSClassFromString(@"MSShapeGroup");
    SEL selector = @selector(shapeWithBezierPath:);
    if (![class respondsToSelector:selector]) {
        NSLog(@"Error: %@ doesn't respond to %@",
              NSStringFromClass(class),
              NSStringFromSelector(selector)
              );
        return nil;
    }
    
    STUB_MSShapeGroup *stubLayer = [class shapeWithBezierPath:bezierPath];
    
    if (!stubLayer) {
        NSLog(@"Error: Couldn't create MSShapeGroup with shapeWithBezierPath:");
        return nil;
    }
    
    return [[SKK_MSShapeGroup alloc] initWithShapeGroup:stubLayer];
}

- (instancetype)initWithShapeGroup:(STUB_MSShapeGroup *)shapeGroup {
    self = [super initWithLayer:shapeGroup];

    if (self) {
        _shapeGroup = shapeGroup;
    }
    
    return self;
}


- (NSBezierPath *)bezierPath {
    NSObject *object = self.shapeGroup;
    SEL selector = @selector(bezierPath);
    if (![object respondsToSelector:selector]) {
        NSLog(@"Error: %@ doesn't respond to %@",
              NSStringFromClass(object.class),
              NSStringFromSelector(selector)
              );
        return nil;
    }
    
    return [self.shapeGroup bezierPath];
}

- (void)setBezierPath:(NSBezierPath *)bezierPath {
    NSObject *object = self.shapeGroup;
    SEL selector = @selector(setBezierPath:);
    if (![object respondsToSelector:selector]) {
        NSLog(@"Error: %@ doesn't respond to %@",
              NSStringFromClass(object.class),
              NSStringFromSelector(selector)
              );
        return;
    }
    
    [self.shapeGroup setBezierPath:bezierPath];
}


#pragma mark - XML Output

- (NSString *)XMLElementName {
    return @"shapeGroup";
}

- (NSXMLElement *)XMLRepresentation {
    NSXMLElement *element = [super XMLRepresentation];
    
    NSXMLElement *bezierPathXML = [self bezierPathXML];
    
    if (bezierPathXML) {
        [element addChild:bezierPathXML];
    }
    
    return element;
}

static NSString * const kXMLElementBezierPath = @"bezierPath";
static NSString * const kXMLElementBezierPathMoveTo = @"moveTo";
static NSString * const kXMLElementBezierPathLineTo = @"lineTo";
static NSString * const kXMLElementBezierPathCurveTo = @"curveTo";
static NSString * const kXMLElementBezierPathClosePath = @"closePath";
static NSString * const kXMLElementBezierPathAttributeX = @"x";
static NSString * const kXMLElementBezierPathAttributeY = @"y";
static NSString * const kXMLElementBezierPathAttributeControlPoint1x = @"controlPoint1x";
static NSString * const kXMLElementBezierPathAttributeControlPoint1y = @"controlPoint1y";
static NSString * const kXMLElementBezierPathAttributeControlPoint2x = @"controlPoint2x";
static NSString * const kXMLElementBezierPathAttributeControlPoint2y = @"controlPoint2y";

- (NSXMLElement *)bezierPathXML {
    NSBezierPath *bezierPath = self.bezierPath;
    
    if (!bezierPath) {
        return nil;
    }
    
    NSXMLElement *element = [NSXMLElement elementWithName:kXMLElementBezierPath];
    
    NSInteger elementCount = bezierPath.elementCount;
    for (int i=0; i < elementCount; i++) {
        NSPoint points[3];
        NSBezierPathElement type = [bezierPath elementAtIndex:i
                                             associatedPoints:points];
        switch (type) {
            case NSMoveToBezierPathElement: {
                NSXMLElement *pathElement = [NSXMLElement elementWithName:kXMLElementBezierPathMoveTo];
                NSXMLNode *xAttribute = [NSXMLNode attributeWithName:kXMLElementBezierPathAttributeX
                                                         stringValue:@(points[0].x).stringValue];
                NSXMLNode *yAttribute = [NSXMLNode attributeWithName:kXMLElementBezierPathAttributeY
                                                         stringValue:@(points[0].y).stringValue];
                [pathElement addAttribute:xAttribute];
                [pathElement addAttribute:yAttribute];
                [element addChild:pathElement];
                break;
            }
            case NSLineToBezierPathElement: {
                NSXMLElement *pathElement = [NSXMLElement elementWithName:kXMLElementBezierPathLineTo];
                NSXMLNode *xAttribute = [NSXMLNode attributeWithName:kXMLElementBezierPathAttributeX
                                                         stringValue:@(points[0].x).stringValue];
                NSXMLNode *yAttribute = [NSXMLNode attributeWithName:kXMLElementBezierPathAttributeY
                                                         stringValue:@(points[0].y).stringValue];
                [pathElement addAttribute:xAttribute];
                [pathElement addAttribute:yAttribute];
                [element addChild:pathElement];
                break;
            }
            case NSCurveToBezierPathElement: {
                NSXMLElement *pathElement = [NSXMLElement elementWithName:kXMLElementBezierPathCurveTo];
                [pathElement addAttribute:[NSXMLNode attributeWithName:kXMLElementBezierPathAttributeX
                                                           stringValue:@(points[2].x).stringValue]];
                [pathElement addAttribute:[NSXMLNode attributeWithName:kXMLElementBezierPathAttributeY
                                                           stringValue:@(points[2].y).stringValue]];
                [pathElement addAttribute:[NSXMLNode attributeWithName:kXMLElementBezierPathAttributeControlPoint1x
                                                           stringValue:@(points[0].x).stringValue]];
                [pathElement addAttribute:[NSXMLNode attributeWithName:kXMLElementBezierPathAttributeControlPoint1y
                                                           stringValue:@(points[0].y).stringValue]];
                [pathElement addAttribute:[NSXMLNode attributeWithName:kXMLElementBezierPathAttributeControlPoint2x
                                                           stringValue:@(points[1].x).stringValue]];
                [pathElement addAttribute:[NSXMLNode attributeWithName:kXMLElementBezierPathAttributeControlPoint2y
                                                           stringValue:@(points[1].y).stringValue]];
                [element addChild:pathElement];
                break;
            }
            case NSClosePathBezierPathElement: {
                NSXMLElement *pathElement = [NSXMLElement elementWithName:kXMLElementBezierPathClosePath];
                [element addChild:pathElement];
                break;
                }
        } // switch type
    } // elements
    return element;
}

#pragma mark - XML Input

+ (instancetype)shapeWithXMLElement:(NSXMLElement *)element {
    // Ensure bezier path existence
    NSXMLElement *bezierPathElement = nil;
    
    for (NSXMLNode *childNode in element.children) {
        if (childNode.kind == NSXMLElementKind) {
            NSXMLElement *childElement = (NSXMLElement *)childNode;
            
            if ([childElement.name isEqualToString:kXMLElementBezierPath]) {
                bezierPathElement = childElement;
            }
        }
    }
    
    if (!bezierPathElement) {
        NSLog(@"Error: Shape group's XML has no bezier path element.");
        return nil;
    }
    
    NSBezierPath *bezierPath = [self bezierPathFromXML:bezierPathElement];
    if (!bezierPath) {
        NSLog(@"Error: Couldn't construct bezier path from element");
        return nil;
    }
    
    SKK_MSShapeGroup *instance = [self shapeWithBezierPath:bezierPath];
    [instance hydrateWithXMLElement:element];    
    return instance;
    
}

+ (NSBezierPath *)bezierPathFromXML:(NSXMLElement *)bezierPathElement {
    NSBezierPath *bezierPath = [NSBezierPath bezierPath];
    
    for (NSXMLNode *childNode in bezierPathElement.children) {
        if (childNode.kind == NSXMLElementKind) {
            NSXMLElement *childElement = (NSXMLElement *)childNode;
            
            if ([childElement.name isEqualToString:kXMLElementBezierPathMoveTo]) {
                NSNumber *x = [self numberFromElement:childElement attribute:kXMLElementBezierPathAttributeX];
                NSNumber *y = [self numberFromElement:childElement attribute:kXMLElementBezierPathAttributeY];
                
                if (!x || !y) {
                    NSLog(@"%@ is missing an attribute (%@).", childElement.name, childElement.XMLString);
                    continue;
                }
                
                [bezierPath moveToPoint:CGPointMake(x.floatValue, y.floatValue)];
            }
            else if ([childElement.name isEqualToString:kXMLElementBezierPathLineTo]) {
                NSNumber *x = [self numberFromElement:childElement attribute:kXMLElementBezierPathAttributeX];
                NSNumber *y = [self numberFromElement:childElement attribute:kXMLElementBezierPathAttributeY];
                
                if (!x || !y) {
                    NSLog(@"%@ is missing an attribute (%@).", childElement.name, childElement.XMLString);
                    continue;
                }
                
                [bezierPath lineToPoint:CGPointMake(x.floatValue, y.floatValue)];
            }
            else if ([childElement.name isEqualToString:kXMLElementBezierPathCurveTo]) {
                NSNumber *x = [self numberFromElement:childElement attribute:kXMLElementBezierPathAttributeX];
                NSNumber *y = [self numberFromElement:childElement attribute:kXMLElementBezierPathAttributeY];
                NSNumber *controlPoint1x = [self numberFromElement:childElement attribute:kXMLElementBezierPathAttributeControlPoint1x];
                NSNumber *controlPoint1y = [self numberFromElement:childElement attribute:kXMLElementBezierPathAttributeControlPoint1y];
                NSNumber *controlPoint2x = [self numberFromElement:childElement attribute:kXMLElementBezierPathAttributeControlPoint2x];
                NSNumber *controlPoint2y = [self numberFromElement:childElement attribute:kXMLElementBezierPathAttributeControlPoint2y];
                
                if (!x || !y || !controlPoint1x || !controlPoint1y || !controlPoint2x || !controlPoint2y) {
                    NSLog(@"%@ is missing an attribute (%@).", childElement.name, childElement.XMLString);
                    continue;
                }
                NSLog(@"curveTo xml: %@", childElement.XMLString);
                NSLog(@"curveTo %@, %@; %@, %@; %@, %@", x, y, controlPoint1x, controlPoint1y, controlPoint2x, controlPoint2y);
                
                [bezierPath curveToPoint:CGPointMake(x.floatValue, y.floatValue)
                           controlPoint1:CGPointMake(controlPoint1x.floatValue, controlPoint1y.floatValue)
                           controlPoint2:CGPointMake(controlPoint2x.floatValue, controlPoint2y.floatValue)];
            }
            else if ([childElement.name isEqualToString:kXMLElementBezierPathClosePath]) {
                [bezierPath closePath];
            }
            
        } // Element Node
    } // Children node enumerate
    
    return bezierPath;
}

/// Converts an element's attribute into an NSNumber
+ (NSNumber *)numberFromElement:(NSXMLElement *)element attribute:(NSString *)attributeName {
    NSXMLNode *attribute = [element attributeForName:attributeName];
    if (!attribute) {
        return nil;
    }
    
    NSString *attributeValue = attribute.stringValue;
    if (!attributeValue) {
        return nil;
    }
    
    NSNumberFormatter *numberFormatter = [NSNumberFormatter new];
    numberFormatter.numberStyle = NSNumberFormatterDecimalStyle;
    NSNumber *number = [numberFormatter numberFromString:attributeValue];
    return number;
}

@end
