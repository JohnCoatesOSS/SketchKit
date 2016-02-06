//
//  SKKXMLProtocol.h
//  SketchKit
//
//  Created by John Coates on 2/2/16.
//  Copyright © 2016 John Coates. All rights reserved.
//

@protocol SKKXMLProtocol <NSObject>

@required
- (NSString *)XMLElementName;
- (NSXMLElement *)XMLRepresentation;
- (NSString *)XMLString;
@end

