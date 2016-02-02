//
//  SKKTestController.m
//  SketchKit
//
//  Created by John Coates on 2/1/16.
//  Copyright © 2016 John Coates. All rights reserved.
//

#import "SKKTestController.h"


@interface SKKTestController ()

//@property (weak) SKK_MSDocument *document;
//@property (strong) CSK_MSPluginCommand *pluginCommand;
@property (strong) SKKPluginContext *pluginContext;

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

- (void)testWithContext:(NSDictionary *)sketchContext {
    dispatch_async(dispatch_get_main_queue(), ^{
        SKKPluginContext *pluginContext = [[SKKPluginContext alloc] initWithSketchContext:sketchContext];
        self.pluginContext = pluginContext;
        
//        CSK_MSDocument *document = context[@"document"];
//        CSK_MSPage *page = document.currentPage;
//        CSK_MSPluginCommand *command = context[@"command"];
        SKK_MSDocument *document = pluginContext.document;
        SKK_MSPage *page = document.currentPage;
        
        [self walkLayerTree:page];
    }); // async dispatch
}

- (void)walkLayerTree:(SKK_MSLayer *)layer {
    NSLog(@"walking layer: %@", layer);
    
    if (layer.isGroup) {
        NSArray *children = layer.layers;
        
        NSLog(@"sublayers: %@", children);
        
        for (SKK_MSLayer *childLayer in children) {
            [self walkLayerTree:childLayer];
        }
    }
    
    if ([layer isKindOfClass:[SKK_MSShapeGroup class]]) {
        SKK_MSShapeGroup *shapeGroup = (SKK_MSShapeGroup *)layer;
        
//        NSLog(@"xml: %@", layer.XMLString);
//        NSLog(@"bezier path: %@", shapeGroup.bezierPath);
        SKK_MSPage *currentPage = self.pluginContext.document.currentPage;
//
        if (currentPage) {
            [self duplicateShapeGroup:shapeGroup inLayer:currentPage];
        }
    }
}

- (void)duplicateShapeGroup:(SKK_MSShapeGroup *)shapeGroup inLayer:(SKK_MSLayer *)layer {
    NSXMLElement *element = shapeGroup.XMLRepresentation;
    SKK_MSShapeGroup *duplicate = [SKK_MSShapeGroup shapeWithXMLElement:element];
//    shapeGroup = [SKK_MSShapeGroup shapeWithBezierPath:bezierPath];
    
    NSLog(@"original XML: %@", shapeGroup.XMLString);
    NSLog(@"duplicate XML: %@", duplicate.XMLString);
    
    [layer addLayers:@[duplicate]];
}

@end
