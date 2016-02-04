//
//  SKK_MSDocumentData.m
//  SketchKit
//
//  Created by John Coates on 2/4/16.
//  Copyright © 2016 John Coates. All rights reserved.
//

#import "SKK_MSDocumentData-Private.h"

@interface SKK_MSDocumentData ()

@property STUB_MSDocumentData *data;

@end

@implementation SKK_MSDocumentData

- (instancetype)initWithData:(STUB_MSDocumentData *)data {
    if (!data) {
        NSLog(@"initWithData error: data is nil");
        return nil;
    }
    
    self = [super init];
    if (self) {
        _data = data;
    }
    
    return self;
}

- (id)immutableModelObject {
    if (![self selectorCheck:self.data selector:@selector(immutableModelObject)]) {
        return nil;
    }
    
    NSLog(@"getting immutableModelObject from %@", self.data);
    return self.data.immutableModelObject;
}

@end
