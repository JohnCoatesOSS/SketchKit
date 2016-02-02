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

- (NSXMLElement *)bezierPathXML {
    NSBezierPath *bezierPath = self.bezierPath;
    
    if (!bezierPath) {
        return nil;
    }
    
    NSXMLElement *element = [NSXMLElement elementWithName:@"bezierPath"];
    
    NSInteger elementCount = bezierPath.elementCount;
    for (int i=0; i < elementCount; i++) {
        NSPoint points[3];
        
        NSBezierPathElement type = [bezierPath elementAtIndex:i
                                             associatedPoints:points];
        
        switch (type) {
            case NSMoveToBezierPathElement: {
                NSXMLElement *pathElement = [NSXMLElement elementWithName:@"moveTo"];
                NSXMLNode *xAttribute = [NSXMLNode attributeWithName:@"x" stringValue:@(points[0].x).stringValue];
                NSXMLNode *yAttribute = [NSXMLNode attributeWithName:@"y" stringValue:@(points[0].y).stringValue];
                [pathElement addAttribute:xAttribute];
                [pathElement addAttribute:yAttribute];
                [element addChild:pathElement];
//                NSLog(@"move to: %f, %f", points[0].x, points[0].y);
                break;
            }
            case NSLineToBezierPathElement: {
                NSXMLElement *pathElement = [NSXMLElement elementWithName:@"lineTo"];
                NSXMLNode *xAttribute = [NSXMLNode attributeWithName:@"x" stringValue:@(points[0].x).stringValue];
                NSXMLNode *yAttribute = [NSXMLNode attributeWithName:@"y" stringValue:@(points[0].y).stringValue];
                [pathElement addAttribute:xAttribute];
                [pathElement addAttribute:yAttribute];
                [element addChild:pathElement];
//                NSLog(@"Line to: %f, %f", points[0].x, points[0].y);
                break;
            }
            case NSCurveToBezierPathElement: {
                NSXMLElement *pathElement = [NSXMLElement elementWithName:@"curveTo"];
                [pathElement addAttribute:[NSXMLNode attributeWithName:@"x" stringValue:@(points[0].x).stringValue]];
                [pathElement addAttribute:[NSXMLNode attributeWithName:@"y" stringValue:@(points[0].y).stringValue]];
                [pathElement addAttribute:[NSXMLNode attributeWithName:@"controlPoint1x" stringValue:@(points[1].x).stringValue]];
                [pathElement addAttribute:[NSXMLNode attributeWithName:@"controlPoint1y" stringValue:@(points[1].y).stringValue]];
                [pathElement addAttribute:[NSXMLNode attributeWithName:@"controlPoint2x" stringValue:@(points[2].x).stringValue]];
                [pathElement addAttribute:[NSXMLNode attributeWithName:@"controlPoint2y" stringValue:@(points[2].y).stringValue]];
                [element addChild:pathElement];
//                NSLog(@"curve to: %f, %f; %f, %f; %f, %f",
//                      points[0].x, points[0].y,
//                      points[1].x, points[1].y,
//                      points[2].x, points[2].y
//                      );
                break;
            }
            case NSClosePathBezierPathElement: {
                NSXMLElement *pathElement = [NSXMLElement elementWithName:@"closePath"];
                [element addChild:pathElement];
                NSLog(@"close path");
                break;
                }
        } // switch type
    } // elements
    return element;
}

#pragma mark - XML Input

//+ (instancetype)shapeWithXMLElement:(NSXMLElement *)element {
//    
//}

@end
