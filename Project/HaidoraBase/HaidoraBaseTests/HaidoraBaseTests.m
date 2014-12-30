//
//  HaidoraBaseTests.m
//  HaidoraBaseTests
//
//  Created by DaiLingchi on 14-7-22.
//  Copyright (c) 2014年 Haidora. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface HaidoraBaseTests : XCTestCase

@end

@implementation HaidoraBaseTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the
    // class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the
    // class.
    [super tearDown];
}

- (void)testExample
{
    XCTFail(@"No implementation for \"%s\"", __PRETTY_FUNCTION__);
}

- (void)testStringEmpty
{
    //    NSString *value1;
    //    NSString *value2 = @"";
    //    NSString *value3 = @"   ";
    //    XCTAssertTrue(HABM_StringIsEmpty(value1) == YES, @"");
    //    XCTAssertTrue(HABM_StringIsEmpty(value2) == YES, @"");
    //    XCTAssertTrue(HABM_StringIsEmpty(value3) == NO, @"");
    //    XCTAssertFalse([[value3 trim] isEqualToString:value3], @"");
    //    XCTAssertTrue(HABM_StringIsEmpty([value3 trim]) == YES, @"");
}

@end