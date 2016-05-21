//
//  STUB_MSLayer.h
//  SketchKit
//
//  Created by John Coates on 2/1/16.
//  Copyright © 2016 John Coates. All rights reserved.
//

#import <Foundation/Foundation.h>

@class STUB_MSStyle;

@interface STUB_MSLayer : STUB_MSModelBase <NSCoding>

@property NSString *name;
@property (readonly) NSArray *layers;
@property (readonly) NSString *objectID;
@property(nonatomic) struct CGRect frameInArtboard;
@property(nonatomic) struct CGRect rect;
@property (readonly) STUB_MSStyle *style;


// OLD Version of invalidateCachedImmutableModelObjects
// version < 3.5
- (void)invalidateLightweightCopy:(id)arg1;
// version >= 3.5
- (void)invalidateCachedImmutableModelObjects;

// groups only
// version < 3.5
- (BOOL)resizeRoot:(BOOL)resize;
// version >= 3.5
- (BOOL)resizeToFitChildrenWithOption:(long long)option;


- (void)hideSelectionTemporarily;

- (void)addLayers:(NSArray <STUB_MSLayer *> *)layers;
@end
