//
//  SKK_MSTextLayer.m
//  SketchKit
//
//  Created by John Coates on 2/5/16.
//  Copyright © 2016 John Coates. All rights reserved.
//

#import "SKK_MSTextLayer-Private.h"

@interface SKK_MSTextLayer ()

@property (strong) STUB_MSTextLayer *textLayer;

@end

@implementation SKK_MSTextLayer

- (instancetype)initWithTextLayer:(STUB_MSTextLayer *)textLayer {
    self = [super init];

    if (self) {
        _textLayer = textLayer;
    }
    
    return self;
}

#pragma mark - Properties

- (NSFont *)font {
    if (![self selectorCheck:self.textLayer selector:@selector(font)]) {
        return nil;
    }
    
    return self.textLayer.font;
}

- (void)setFont:(NSFont *)font {
    if (![self selectorCheck:self.textLayer selector:@selector(setFont:)]) {
        return;
    }
    
    [self.textLayer setFont:font];
}

- (double)lineSpacing {
    if (![self selectorCheck:self.textLayer selector:@selector(lineSpacing)]) {
        return 0;
    }
    
    return self.textLayer.lineSpacing;
}

- (void)setLineSpacing:(double)lineSpacing {
    if (![self selectorCheck:self.textLayer selector:@selector(setLineSpacing:)]) {
        return;
    }
    
    [self.textLayer setLineSpacing:lineSpacing];
}

- (double)characterSpacing {
    if (![self selectorCheck:self.textLayer selector:@selector(characterSpacing)]) {
        return 0;
    }
    
    return self.textLayer.lineSpacing;
}

- (void)setCharacterSpacing:(double)characterSpacing {
    if (![self selectorCheck:self.textLayer selector:@selector(setCharacterSpacing:)]) {
        return;
    }
    
    [self.textLayer setCharacterSpacing:characterSpacing];
}


@end
