//
//  SKK_MSDocumentFile.m
//  SketchKit
//
//  Created by John Coates on 2/4/16.
//  Copyright © 2016 John Coates. All rights reserved.
//

#import "SKK_MSDocumentFile-Private.h"

@interface SKK_MSDocumentFile ()

@property (strong) STUB_MSDocumentFile *documentFile;

@end

@implementation SKK_MSDocumentFile

- (instancetype)initWithURL:(NSURL *)url {
    STUB_MSDocumentFile *documentFile;
    Class class = NSClassFromString(@"MSDocumentFile");
    if (!class) {
        return nil;
    }
    if (![self classInstancesSelectorCheck:class selector:@selector(initWithURL:)]) {
        return nil;
    }
    
    documentFile = [(STUB_MSDocumentFile *)[class alloc] initWithURL:url];
    if (!documentFile) {
        return nil;
    }
    
    self = [super init];
    if (self) {
        NSLog(@"documentFile: %@", documentFile);
        _documentFile = documentFile;
    }
    
    return self;
}

- (SKK_MSDocumentData *)readDataWithError:(NSError **)error {
    if (![self selectorCheck:self.documentFile selector:@selector(readDataWithError:)]) {
        return nil;
    }
    
    STUB_MSDocumentData *data = [self.documentFile readDataWithError:error];
    if (!data) {
        NSLog(@"Error: readDataWithError:, no data returned.");
        return nil;
    }
    
    return [[SKK_MSDocumentData alloc] initWithData:data];
}

@end
