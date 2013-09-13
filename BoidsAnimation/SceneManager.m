//
//  SceneManager.m
//  BoidsAnimation
//
//  Created by Training on 9/11/13.
//  Copyright (c) 2013 Training. All rights reserved.
//

#import "SceneManager.h"
#import "BoidGroup.h"
#import "Rule.h"
#import "ChaseRule.h"
#import "EscapeRule.h"
#import "SpeedLimitRule.h"

#define fps 30

@implementation SceneManager

+ (SceneManager *)createSceneManager:(UIView *)view{
    
    SceneManager *resultSceneManager = [SceneManager new];
    resultSceneManager.view = view;
    
    resultSceneManager.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 / fps target:resultSceneManager selector:@selector(update:) userInfo:nil repeats:YES];
    
    resultSceneManager.boidsGroups = [NSMutableArray new];
    
    BoidGroup *chasingBoidGroup = [resultSceneManager createBoidGroup:[UIColor redColor]];
    BoidGroup *chasedBoidGroup = [resultSceneManager createBoidGroup:[UIColor greenColor]];
    BoidGroup *chasedBoidGroup2 = [resultSceneManager createBoidGroup:[UIColor blueColor]];
    
    SpeedLimitRule *speedLimitRule = [SpeedLimitRule new];
    [chasingBoidGroup.ruls addObject:speedLimitRule];
    [chasedBoidGroup.ruls addObject:speedLimitRule];
    [chasedBoidGroup2.ruls addObject:speedLimitRule];
    
    speedLimitRule.speedLimit = 120;
    
    
    ChaseRule *chaseRule = [ChaseRule new];
    [chasingBoidGroup.ruls addObject:chaseRule];
    chaseRule.chasedGroup = chasedBoidGroup;
    
    EscapeRule *escapeRule = [EscapeRule new];
    [chasedBoidGroup.ruls addObject:escapeRule];
    [chasedBoidGroup2.ruls addObject:escapeRule];

    
    [resultSceneManager.boidsGroups addObject:chasingBoidGroup];
    [resultSceneManager.boidsGroups addObject:chasedBoidGroup];
    [resultSceneManager.boidsGroups addObject:chasedBoidGroup2];
//    [resultSceneManager.boidsGroups addObject:[resultSceneManager createBoidGroup:[UIColor greenColor]]];
//    [resultSceneManager.boidsGroups addObject:[resultSceneManager createBoidGroup:[UIColor purpleColor]]];
//    [resultSceneManager.boidsGroups addObject:[resultSceneManager createBoidGroup:[UIColor orangeColor]]];
    
//    resultSceneManager.boidsGroup = [BoidGroup new];
//    
//    [resultSceneManager.boidsGroup createBoids];
//    resultSceneManager.boidsGroup.color = [UIColor blueColor];
//    for (Boid *boid in resultSceneManager.boidsGroup.boids) {
//        [view addSubview:boid];
//    }
    

    
    return resultSceneManager;
}

- (BoidGroup *)createBoidGroup:(UIColor *)color{
    
    BoidGroup *result = [BoidGroup new];
    
    [result createBoids];
    
    result.color = color;
    for (Boid *boid in result.boids) {
        [self.view addSubview:boid];
    }
        
    return result;
}


- (void)update:(NSTimer *)timer{
    
    
    for (BoidGroup *boidGroup in self.boidsGroups) {
        [boidGroup update:timer.timeInterval];
    }
}

@end
