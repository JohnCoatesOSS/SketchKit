//
//  SKK_MSPage.m
//  SketchKit
//
//  Created by John Coates on 2/1/16.
//  Copyright © 2016 John Coates. All rights reserved.
//

#import "SKK_MSPage-Private.h"

@interface SKK_MSPage ()

@property (strong) STUB_MSPage *page;

@end

@implementation SKK_MSPage

- (instancetype)initWithPage:(STUB_MSPage *)page {
    self = [super initWithLayer:page];
    
    if (self) {
        _page = page;
    }
    
    return self;
}

@end
