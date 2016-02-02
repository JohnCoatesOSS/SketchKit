//
//  STUB_MSDocument.h
//  SketchKit
//
//  Created by John Coates on 2/1/16.
//  Copyright © 2016 John Coates. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface STUB_MSDocument : NSObject
    @property(retain, nonatomic) NSWindow *documentWindow;
    - (STUB_MSPage *)currentPage;
//    - (CSK_MSContentDrawView *)currentView;
    - (void)displayMessage:(NSString *)message;
    - (void)reloadInspector;
@end
