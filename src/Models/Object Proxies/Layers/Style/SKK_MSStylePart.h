//
//  SKK_MSStylePart.h
//  SketchKit
//
//  Created by John Coates on 2/2/16.
//  Copyright © 2016 John Coates. All rights reserved.
//

@interface SKK_MSStylePart : SKKProxyObject <SKKXMLProtocol>

// XML
- (NSString *)XMLElementName;
- (NSXMLElement *)XMLRepresentation;
- (NSString *)XMLString;

@end
