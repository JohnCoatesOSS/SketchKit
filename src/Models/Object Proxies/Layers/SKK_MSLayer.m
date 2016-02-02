//
//  SKK_MSLayer.m
//  SketchKit
//
//  Created by John Coates on 2/1/16.
//  Copyright © 2016 John Coates. All rights reserved.
//

#import "SKK_MSLayer-Private.h"

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
    self = [super init];

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

#pragma mark - XML Output

- (NSString *)XMLElementName {
    return @"layer";
}

- (NSXMLElement *)XMLRepresentation {
    NSXMLElement *element = [NSXMLElement elementWithName:[self XMLElementName]];
    
    [element addAttribute:[NSXMLNode attributeWithName:@"name" stringValue:self.name]];
    
    return element;
}

#pragma mark - XML Input

@end
