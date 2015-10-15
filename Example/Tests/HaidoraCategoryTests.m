//
//  HaidoraCategoryTests.m
//  HaidoraBase
//
//  Created by Dailingchi on 15/10/13.
//  Copyright © 2015年 mrdaios. All rights reserved.
//

#import <HaidoraBase.h>

SpecBegin(HaidoraBaseCategory)

    describe(@"Category", ^{
      it(@"HDCurrentExtend", ^{
        expect([self hd_currentController]).notTo.beNil();
      });

      it(@"HDApplicationInfoExtend", ^{
        [UIApplication sharedApplication].hd_applicationInfo[@"testKey"] = @"testValue";
        expect([UIApplication sharedApplication].hd_applicationInfo[@"testKey"])
            .to.equal(@"testValue");
      });

      it(@"will wait and succeed", ^{
        waitUntil(^(DoneCallback done) {
          done();
        });
      });
    });

SpecEnd
