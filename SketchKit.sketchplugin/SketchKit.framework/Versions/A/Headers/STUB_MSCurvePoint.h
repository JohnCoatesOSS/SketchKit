//
//  STUB_MSCurvePoint.h
//  SketchKit
//
//  Created by John Coates on 4/11/16.
//  Copyright © 2016 John Coates. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(long long, MSCurveMode) {
    MSCurveModeStraight = 1,
    MSCurveModeMirrored = 2,
    MSCurveModeAsymmetric = 3,
    MSCurveModeDisconnected = 4
};

@interface STUB_MSCurvePoint : STUBObject

@property(readonly, nonatomic) BOOL hasCurveFrom;
@property(readonly, nonatomic) BOOL hasCurveTo;
@property(readonly, nonatomic) double cornerRadius;
@property(readonly, nonatomic) struct CGPoint curveFrom;
@property(readonly, nonatomic) MSCurveMode curveMode;
@property(readonly, nonatomic) struct CGPoint curveTo;
@property(readonly, nonatomic) struct CGPoint point;

- (void)changeCurveModeTo:(MSCurveMode)arg1;

- (void)movePointTo:(struct CGPoint)arg1;
- (void)moveCurveFromTo:(struct CGPoint)arg1 rect:(struct CGRect)arg2 flags:(long long)arg3;
- (void)moveCurveToTo:(struct CGPoint)arg1 rect:(struct CGRect)arg2 flags:(long long)arg3;
- (void)setCornerRadius:(double)arg1;

@end
