//
//  SKK_MSLayer.h
//  SketchKit
//
//  Created by John Coates on 2/1/16.
//  Copyright © 2016 John Coates. All rights reserved.
//

@class SKK_MSStyle;

@interface SKK_MSLayer : SKKProxyObject

@property (nonatomic) NSString *name;
@property (nonatomic, readonly) SKK_MSStyle *style;

@property (nonatomic, readonly) BOOL isPage;
@property (nonatomic, readonly) BOOL isGroup;
@property (nonatomic, readonly) BOOL isArtboard;

// child layers
@property (nonatomic, readonly) NSArray <SKK_MSLayer *> *layers;

- (void)addLayers:(NSArray <SKK_MSLayer *> *)layers;

// XML
- (NSString *)XMLElementName;
- (NSXMLElement *)XMLRepresentation;
- (void)hydrateWithXMLElement:(NSXMLElement *)element;
@property (nonatomic, readonly) NSString *XMLString;

@end
