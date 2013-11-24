/*
 * Copyright 2010-2013 Amazon.com, Inc. or its affiliates. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License").
 * You may not use this file except in compliance with the License.
 * A copy of the License is located at
 *
 *  http://aws.amazon.com/apache2.0
 *
 * or in the "license" file accompanying this file. This file is distributed
 * on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 * express or implied. See the License for the specific language governing
 * permissions and limitations under the License.
 */

#import "EC2ReservedInstancesUnmarshaller.h"
#ifdef AWS_MULTI_FRAMEWORK
#import <AWSRuntime/AmazonServiceExceptionUnmarshaller.h>
#else
#import "../AmazonServiceExceptionUnmarshaller.h"
#endif

@implementation EC2ReservedInstancesUnmarshaller


-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    [super parser:parser didStartElement:elementName namespaceURI:namespaceURI qualifiedName:qName attributes:attributeDict];


    if ([elementName isEqualToString:@"tagSet"]) {
        AmazonListUnmarshaller *listUnmarshaller = [[[AmazonListUnmarshaller alloc] initWithCaller:self withParentObject:self.response.tags withSetter:@selector(addObjectsFromArray:)] autorelease];
        listUnmarshaller.endListElementName = @"tagSet";
        listUnmarshaller.entryElementName   = @"item";
        listUnmarshaller.delegateClass      = [EC2TagUnmarshaller class];

        [parser setDelegate:listUnmarshaller];
    }

    if ([elementName isEqualToString:@"recurringCharges"]) {
        AmazonListUnmarshaller *listUnmarshaller = [[[AmazonListUnmarshaller alloc] initWithCaller:self withParentObject:self.response.recurringCharges withSetter:@selector(addObjectsFromArray:)] autorelease];
        listUnmarshaller.endListElementName = @"recurringCharges";
        listUnmarshaller.entryElementName   = @"item";
        listUnmarshaller.delegateClass      = [EC2RecurringChargeUnmarshaller class];

        [parser setDelegate:listUnmarshaller];
    }



    if ([elementName isEqualToString:@"Error"]) {
        [parser setDelegate:[[[AmazonServiceExceptionUnmarshaller alloc] initWithCaller:self withParentObject:self.response withSetter:@selector(setException:)] autorelease]];
    }
}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    [super parser:parser didEndElement:elementName namespaceURI:namespaceURI qualifiedName:qName];


    if ([[elementName lowercaseString] isEqualToString:@"requestid"]) {
        if (parentObject != nil && [parentObject respondsToSelector:@selector(setRequestId:)]) {
            [parentObject performSelector:@selector(setRequestId:) withObject:self.currentText];
        }
    }

    if ([elementName isEqualToString:@"reservedInstancesId"]) {
        self.response.reservedInstancesId = self.currentText;
        return;
    }

    if ([elementName isEqualToString:@"instanceType"]) {
        self.response.instanceType = self.currentText;
        return;
    }

    if ([elementName isEqualToString:@"availabilityZone"]) {
        self.response.availabilityZone = self.currentText;
        return;
    }

    if ([elementName isEqualToString:@"start"]) {
        self.response.start = [AmazonSDKUtil convertStringToDate:self.currentText];
        return;
    }

    if ([elementName isEqualToString:@"end"]) {
        self.response.end = [AmazonSDKUtil convertStringToDate:self.currentText];
        return;
    }

    if ([elementName isEqualToString:@"duration"]) {
        self.response.duration = [AmazonSDKUtil convertStringToNumber:self.currentText];
        return;
    }

    if ([elementName isEqualToString:@"usagePrice"]) {
        self.response.usagePrice = [AmazonSDKUtil convertStringToNumber:self.currentText];
        return;
    }

    if ([elementName isEqualToString:@"fixedPrice"]) {
        self.response.fixedPrice = [AmazonSDKUtil convertStringToNumber:self.currentText];
        return;
    }

    if ([elementName isEqualToString:@"instanceCount"]) {
        self.response.instanceCount = [AmazonSDKUtil convertStringToNumber:self.currentText];
        return;
    }

    if ([elementName isEqualToString:@"productDescription"]) {
        self.response.productDescription = self.currentText;
        return;
    }

    if ([elementName isEqualToString:@"state"]) {
        self.response.state = self.currentText;
        return;
    }

    if ([elementName isEqualToString:@"instanceTenancy"]) {
        self.response.instanceTenancy = self.currentText;
        return;
    }

    if ([elementName isEqualToString:@"currencyCode"]) {
        self.response.currencyCode = self.currentText;
        return;
    }

    if ([elementName isEqualToString:@"offeringType"]) {
        self.response.offeringType = self.currentText;
        return;
    }

    if ([elementName isEqualToString:@"reservedInstances"]) {
        if (caller != nil) {
            [parser setDelegate:caller];
        }

        if (parentObject != nil && [parentObject respondsToSelector:parentSetter]) {
            [parentObject performSelector:parentSetter withObject:self.response];
        }

        return;
    }
}

-(EC2ReservedInstances *)response
{
    if (nil == response) {
        response = [[EC2ReservedInstances alloc] init];
    }
    return response;
}


-(void)dealloc
{
    [response release];
    [super dealloc];
}

@end
