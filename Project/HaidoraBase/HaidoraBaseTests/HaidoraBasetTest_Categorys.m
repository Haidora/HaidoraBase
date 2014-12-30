//
//  HaidoraBasetTest_Categorys.m
//  HaidoraBase
//
//  Created by DaiLingchi on 14-12-30.
//  Copyright (c) 2014年 Haidora. All rights reserved.
//

//#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>
#import "NSDate+HABUtils.h"

@interface HaidoraBasetTest_Categorys : XCTestCase

@end

@implementation HaidoraBasetTest_Categorys

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

- (void)testDateFormat
{
    NSDate *nowDate = [NSDate date];
    NSLog(@"-------------%@", [nowDate hab_DateWithFormat:nil]);
    NSLog(@"-------------%@", [NSDate hab_Date:[NSDate date] withFormat:nil]);
    NSLog(@"-------------%@",
          [NSDate hab_DateWithString:[nowDate hab_DateWithFormat:nil] withFormat:nil]);
}

@end
