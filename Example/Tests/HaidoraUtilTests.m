//
//  HaidoraUtilTests.m
//  HaidoraBase
//
//  Created by Dailingchi on 15/10/15.
//  Copyright © 2015年 mrdaios. All rights reserved.
//
#import <HaidoraBase.h>

SpecBegin(HDUtilUserDefaults)

    describe(@"Subscript", ^{
      it(@"isEqual", ^{
        [HDUtilUserDefaults shareUserDefault][@"testkey"] = @"testvalue";
        expect([HDUtilUserDefaults shareUserDefault][@"testkey"])
            .to.equal([HDUtilUserDefaults objectForKey:@"testkey"]);
        expect([HDUtilUserDefaults objectForKey:@"testkey"])
            .to.equal([HDUtilUserDefaults shareUserDefault][@"testkey"]);
      });
      it(@"notEqual", ^{
        [HDUtilUserDefaults shareUserDefault][@"testkey"] = @"testvalue1";
        expect([HDUtilUserDefaults shareUserDefault][@"testkey"])
            .toNot.equal([HDUtilUserDefaults objectForKey:@"testkey1"]);
      });

      it(@"will wait and succeed", ^{
        waitUntil(^(DoneCallback done) {
          done();
        });
      });
    });

SpecEnd
