//
//  SKK_MSDocumentFile.h
//  SketchKit
//
//  Created by John Coates on 2/4/16.
//  Copyright © 2016 John Coates. All rights reserved.
//

@class SKK_MSDocumentData;

@interface SKK_MSDocumentFile : SKKProxyObject

- (instancetype)initWithURL:(NSURL *)url;
- (SKK_MSDocumentData *)readDataWithError:(NSError **)error;

@end
