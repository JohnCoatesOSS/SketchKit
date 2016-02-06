//
//  STUB_MSDocumentFile.h
//  SketchKit
//
//  Created by John Coates on 2/4/16.
//  Copyright © 2016 John Coates. All rights reserved.
//

#import <Foundation/Foundation.h>

@class STUB_MSDocumentData;

@interface STUB_MSDocumentFile : NSObject

@property(retain, nonatomic) NSURL *documentURL; // @synthesize documentURL=_documentURL;
//@property(retain, nonatomic) BCStructuredFile *file; // @synthesize file=_file;
@property(retain, nonatomic) NSDictionary *metadata; // @synthesize metadata=_metadata;
@property(retain, nonatomic) NSArray *usedFontNames; // @synthesize usedFontNames=_usedFontNames;
@property(retain, nonatomic) NSDictionary *UIMetadata; // @synthesize UIMetadata=_UIMetad

- (id)initWithURL:(NSURL *)url;
- (STUB_MSDocumentData *)readDataWithError:(NSError **)error;
- (BOOL)writeImmutableDocumentData:(NSData *)data error:(NSError **)error;

@end
