//
//  SKKTestController.m
//  SketchKit
//
//  Created by John Coates on 2/1/16.
//  Copyright © 2016 John Coates. All rights reserved.
//

#import "SKKTestController.h"


@interface SKKTestController ()

//@property (weak) CSK_MSDocument *document;
//@property (strong) CSK_MSPluginCommand *pluginCommand;

@end

@implementation SKKTestController

+ (instancetype)sharedInstance {
    static SKKTestController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [SKKTestController new];
        
        if (NSClassFromString(@"MSLayer")) {
            sharedInstance.inSketch = TRUE;
        }
        else {
            sharedInstance.inSketch = FALSE;
        }
        
        if ([sharedInstance inSketch]) {
            if (DEBUG){
                // redirect log output to file
                [sharedInstance redirectConsoleLogToDocumentFolder];
            }
        }
        
    });
    
    return sharedInstance;
}

- (instancetype)init {
    self = [super init];
    
    return self;
}

#pragma mark - Logging

- (void)redirectConsoleLogToDocumentFolder {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                         NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *logPath = [documentsDirectory stringByAppendingPathComponent:@"sketch.log"];
    freopen([logPath fileSystemRepresentation],"a+",stderr);
    
}


#pragma mark - Plugin Entrypoints

- (void)testWithContext:(NSDictionary *)context {
    dispatch_async(dispatch_get_main_queue(), ^{
//        CSK_MSDocument *document = context[@"document"];
//        CSK_MSPage *page = document.currentPage;
//        CSK_MSPluginCommand *command = context[@"command"];
        
        NSLog(@"SKK Context: %@", context);
    }); // async dispatch
}


@end
