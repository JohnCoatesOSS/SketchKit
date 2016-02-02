//
//  main.m
//  Test Launcher
//
//  Created by John Coates on 2/1/16.
//  Copyright © 2016 John Coates. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // Close Sketch
        NSArray *sketches = [NSRunningApplication
                             runningApplicationsWithBundleIdentifier:@"com.bohemiancoding.sketch3"];
        if (sketches.count) {
            NSRunningApplication *sketch = sketches[0];
            [sketch forceTerminate];
        }
        
        // launch Sketch
        NSString *currentSourcePath = [NSString stringWithFormat:@"%s", __FILE__];
        NSString *launcherFolder =  [currentSourcePath stringByDeletingLastPathComponent];
        NSString *projectFolder = [launcherFolder stringByDeletingLastPathComponent];
//        NSString *sketchDocumentsFolder = [projectFolder stringByAppendingPathComponent:@"Sketch Documents"];
//        NSString *shapeTestPath = [sketchDocumentsFolder stringByAppendingPathComponent:@"SketchKit Shape Test.sketch"];
        
        // TODO: change to relative path
//        [[NSWorkspace sharedWorkspace] openFile:shapeTestPath];
//        NSLog(@"shape test: %@", shapeTestPath);
        //    [[NSWorkspace sharedWorkspace] openFile:@"/Users/macbook/Dev/Extensions/Sketch/CSSketch/Examples/flexBox.sketch"];
        
        // sleep for a bit while Sketch launches
//        sleep(2);
        
        NSString *scriptPath = [projectFolder stringByAppendingPathComponent:@"SketchKit-remote.coscript"];
        NSLog(@"script path: %@", scriptPath);
        NSPipe *pipe = [NSPipe pipe];
        NSFileHandle *file = pipe.fileHandleForReading;
        
        NSTask *task = [[NSTask alloc] init];
        task.launchPath = @"/usr/local/bin/coscript";
        task.arguments = @[scriptPath];
        task.standardOutput = pipe;
        
        [task launch];
        [file closeFile];
        
        sleep(4);
    }
    return 0;
}
