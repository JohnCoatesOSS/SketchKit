//
//  SKK_MSDocument.h
//  SketchKit
//
//  Created by John Coates on 2/1/16.
//  Copyright © 2016 John Coates. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SKK_MSPage;

@interface SKK_MSDocument : SKKProxyObject

- (SKK_MSPage *)currentPage;

@end
