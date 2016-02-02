//
//  SKK_MSLayer.h
//  SketchKit
//
//  Created by John Coates on 2/1/16.
//  Copyright © 2016 John Coates. All rights reserved.
//

@interface SKK_MSLayer : NSObject


@property (nonatomic, readonly) NSString *name;

@property (nonatomic, readonly) BOOL isPage;
@property (nonatomic, readonly) BOOL isGroup;
@property (nonatomic, readonly) BOOL isArtboard;

// child layers
@property (nonatomic, readonly) NSArray <SKK_MSLayer *> *layers;

- (void)addLayers:(NSArray <SKK_MSLayer *> *)layers;

// XML
- (NSString *)XMLElementName;
- (NSXMLElement *)XMLRepresentation;

@end
