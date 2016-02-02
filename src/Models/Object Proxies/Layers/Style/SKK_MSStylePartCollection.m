//
//  SKK_MSStylePartCollection.m
//  SketchKit
//
//  Created by John Coates on 2/2/16.
//  Copyright © 2016 John Coates. All rights reserved.
//

#import "SKK_MSStylePartCollection-Private.h"

@interface SKK_MSStylePartCollection () {
    __unsafe_unretained SKK_MSStylePart **_proxyCollectionWeak;
}

@property (strong) STUB_MSStylePartCollection *collection;
@property (strong, nonatomic) NSArray *proxyCollection;

@end

@implementation SKK_MSStylePartCollection

- (instancetype)initWithCollection:(STUB_MSStylePartCollection *)collection {
    self = [super init];

    if (self) {
        _collection = collection;
    }
    
    return self;
}

- (void)dealloc {
    if (_proxyCollectionWeak) {
        free(_proxyCollectionWeak);
        _proxyCollectionWeak = nil;
    }
}

- (NSArray *)proxyCollection {
    NSMutableArray *proxyCollection = [NSMutableArray new];
    
    for (STUB_MSStylePart *stubStylePart in self.collection) {
        SKK_MSStylePart *stylePart = [SKK_MSStylePart stylePartWithStylePart:stubStylePart];
        
        [proxyCollection addObject:stylePart];
    }
    
    _proxyCollection = proxyCollection;
    
    if (_proxyCollectionWeak) {
        free(_proxyCollectionWeak);
        _proxyCollectionWeak = nil;
    }
    
    _proxyCollectionWeak = (__unsafe_unretained SKK_MSStylePart **)malloc(sizeof(SKK_MSStylePart *) * proxyCollection.count);
    int index = 0;
    for (SKK_MSStylePart *stylePart in _proxyCollection) {
        _proxyCollectionWeak[index] = stylePart;
        index++;
    }
    
    return proxyCollection;
}

- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state objects:(id __unsafe_unretained [])buffer count:(NSUInteger)len {
    NSArray *proxyCollection = self.proxyCollection;
    if (state->state >= proxyCollection.count) {
        return 0;
    }
    
    state->itemsPtr = _proxyCollectionWeak;
    state->state = proxyCollection.count;
    state->mutationsPtr = &state->extra[0];
    
    return proxyCollection.count;
}

@end
