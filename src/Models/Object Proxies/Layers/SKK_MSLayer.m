//
//  SKK_MSLayer.m
//  SketchKit
//
//  Created by John Coates on 2/1/16.
//  Copyright © 2016 John Coates. All rights reserved.
//

#import "SKK_MSLayer-Private.h"
#import "NSObject+TreeAsDictionarySupport.h"
#import "STUB_MSImmutableShapeGroup.h"

@interface SKK_MSLayer ()

@property (strong) STUB_MSLayer *layer;

@end

@implementation SKK_MSLayer

+ (id)layerFromLayer:(STUB_MSLayer *)layer {
    id idLayer = layer;
    if ([layer isKindOfClass:NSClassFromString(@"MSPage")]) {
        return [[SKK_MSPage alloc] initWithPage:idLayer];
    }
    else if ([layer isKindOfClass:NSClassFromString(@"MSShapeGroup")]) {
        return [[SKK_MSShapeGroup alloc] initWithShapeGroup:idLayer];
    }
    else {
        return [[self alloc] initWithLayer:layer];
    }
}

- (instancetype)initWithLayer:(STUB_MSLayer *)layer {
    self = [super initWithTarget:layer];

    if (self) {
        _layer = layer;
    }
    
    return self;
}

- (NSString *)name {
    NSObject *object = self.layer;
    SEL selector = @selector(name);
    if (![object respondsToSelector:selector]) {
        NSLog(@"Error: %@ doesn't respond to %@",
              NSStringFromClass(object.class),
              NSStringFromSelector(selector)
              );
        return nil;
    }

    return self.layer.name;
}

- (void)setName:(NSString *)name {
    NSObject *object = self.layer;
    SEL selector = @selector(setName:);
    if (![object respondsToSelector:selector]) {
        NSLog(@"Error: %@ doesn't respond to %@",
              NSStringFromClass(object.class),
              NSStringFromSelector(selector)
              );
        return;
    }
    
    [self.layer setName:name];
}

- (BOOL)isPage {
    if ([self.layer isKindOfClass:NSClassFromString(@"MSPage")]) {
        return TRUE;
    }
    return FALSE;
}

- (BOOL)isGroup {
    if ([self.layer isKindOfClass:NSClassFromString(@"MSLayerGroup")]
        && ![self.layer isMemberOfClass:NSClassFromString(@"MSShapeGroup")]) {
        return TRUE;
    }
    return FALSE;
}

- (BOOL)isArtboard {
    if ([self.layer isKindOfClass:NSClassFromString(@"MSArtboardGroup")]) {
        return TRUE;
    }
    return FALSE;
}


- (NSArray <SKK_MSLayer *> *)layers {
    SEL selector = @selector(layers);
    if (![self.layer respondsToSelector:selector]) {
        NSLog(@"Error: %@ doesn't respond to %@",
              NSStringFromClass(self.layer.class),
              NSStringFromSelector(selector)
              );
        return nil;
    }
    
    NSArray *stubLayers = self.layer.layers;
    
    if (!stubLayers) {
        return nil;
    }
    
    NSMutableArray *layers = [NSMutableArray new];
    for (STUB_MSLayer *stubLayer in stubLayers) {
        SKK_MSLayer *layer = [SKK_MSLayer layerFromLayer:stubLayer];
        [layers addObject:layer];
    }
    
    return layers;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"<%@ encapsulating %@>", NSStringFromClass([self class]), self.layer];
}

- (void)addLayers:(NSArray <SKK_MSLayer *> *)layers {
    NSObject *object = self.layer;
    SEL selector = @selector(addLayers:);
    if (![object respondsToSelector:selector]) {
        NSLog(@"Error: %@ doesn't respond to %@",
              NSStringFromClass(object.class),
              NSStringFromSelector(selector)
              );
        return;
    }
    
    NSMutableArray <STUB_MSLayer *> *stubLayers = [NSMutableArray new];
    
    for (SKK_MSLayer *layer in layers) {
        STUB_MSLayer *stubLayer = layer.layer;
        
        if (stubLayer) {
            [stubLayers addObject:stubLayer];
        }
        else {
            NSLog(@"Error: SKK_MSLayer missing backing MSLayer");
        }
    }
    
    [self.layer addLayers:stubLayers];
}

- (SKK_MSStyle *)style {
    if (![self selectorCheck:self.layer selector:@selector(style)]) {
        return nil;
    }
    
    STUB_MSStyle *stubStyle = self.layer.style;
    if (!stubStyle) {
        return nil;
    }
    
    SKK_MSStyle *style = [[SKK_MSStyle alloc] initWithStyle:stubStyle];
    return style;
}

#pragma mark - XML Output

- (NSString *)XMLElementName {
    return @"layer";
}

- (NSXMLElement *)XMLRepresentation {
    NSXMLElement *element = [NSXMLElement elementWithName:[self XMLElementName]];
    
    if ([self.layer conformsToProtocol:@protocol(NSCoding)]) {
        NSLog(@"tree: %@", (id)self.layer.treeAsDictionary);
//        STUB_MSImmutableShapeGroup *immutableShapeGroup = [NSClassFromString(@"MSImmutableShapeGroup") new];
//        NSLog(@"shape group: %@", immutableShapeGroup);
//        if (immutableShapeGroup) {
//            [immutableShapeGroup performInitWithMutableModelObject:self.layer];
//            NSData *data = [NSKeyedArchiver archivedDataWithRootObject:immutableShapeGroup];
//            NSDictionary *tree = [(id)data treeAsDictionary];
//            NSLog(@"tree: %@", tree);
//        }
    }
    else {
        NSLog(@"%@ doesn't conform to protocol %@", self.layer, NSStringFromProtocol(@protocol(NSCoding)));
    }
    
//    NSLog(@"encoded layer: %@", )
    
    [element addAttribute:[NSXMLNode attributeWithName:@"name" stringValue:self.name]];
    
    NSXMLElement *styleElement = self.style.XMLRepresentation;
    if (styleElement) {
        [element addChild:styleElement];
    }
    
    return element;
}

- (NSString *)XMLString {
    return [self.XMLRepresentation XMLStringWithOptions:NSXMLNodePrettyPrint | NSXMLNodeCompactEmptyElement];
}

#pragma mark - XML Input

- (void)hydrateWithXMLElement:(NSXMLElement *)element {
    NSXMLNode *nameAttribute = [element attributeForName:@"name"];
    if (nameAttribute) {
        self.name = nameAttribute.stringValue;
    }
}

@end
