//
//  ActionClippingNodeTest.m
//  keshin
//
//  Created by wang feng on 13/02/15.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "ActionClippingNodeTest.h"


@implementation ActionClippingNodeTest

- (void)setupAction
{
    CGSize s = [[CCDirector sharedDirector] winSize];
    
    CCSprite *stencil = [CCSprite spriteWithFile:@"mask.png"];
    stencil.position = ccp(0, 0);
    
    CCClippingNode *clipper = [CCClippingNode clippingNode];
    clipper.anchorPoint = ccp(0.5, 0.5);
    clipper.position = ccp(s.width / 2, s.height / 2);
    clipper.stencil = stencil;
    clipper.alphaThreshold  = 0.1;
    [self addChild:clipper];
    
    CCSprite *content = [CCSprite spriteWithFile:@"gradeB.png"];
    content.position = ccp(0, 0);
    content.color = ccRED;
    [clipper addChild:content];

    [content setBlendFunc:(ccBlendFunc){GL_ONE, GL_ONE}];
    
//    CCMoveTo *moveTo = [CCMoveTo actionWithDuration:2.0f position:ccp(s.width / 2 - 50, s.height * 1.5f)];
//    CCScaleTo *scaleTo = [CCScaleTo actionWithDuration:1.0f scaleX:0.2f scaleY:1.0f];
//    CCSpawn *spawn = [CCSpawn actions:moveTo, scaleTo, nil];
//    [clipper runAction:spawn];
    
    
}

- (void)test
{
    CCSprite *content = [CCSprite spriteWithFile:@"Default.png"];
    content.position = ccp(50, 50);
    
    // stencil これでマスクする
    //        CCDrawNode *stencil = [CCDrawNode node];
    //        [stencil drawPolyWithVerts:triangle count:3 fillColor:red borderWidth:0 borderColor:red];
    CCSprite *stencil = [CCSprite spriteWithFile:@"mask.png"];
    stencil.position    = ccp(50, 50);
    stencil.scale       = 1.5f;
    [stencil runAction:[CCRepeatForever actionWithAction:[CCRotateBy actionWithDuration:1 angle:90]]];
    
    CCClippingNode *clippingNode = [CCClippingNode clippingNode];
    clippingNode.anchorPoint     = ccp(0.5f, 0.5f);
    clippingNode.stencil         = stencil;
    clippingNode.alphaThreshold  = 0.01;
    
    [clippingNode addChild:content];
    
    CGSize s = [[CCDirector sharedDirector] winSize];
    clippingNode.position = ccp(s.width/2 -50, s.height/2 - 50);
    [self addChild:clippingNode];
}



@end
