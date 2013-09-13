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
        
    NSArray *colors = @[[UIColor redColor], [UIColor blueColor], [UIColor greenColor], [UIColor orangeColor], [UIColor purpleColor], [UIColor yellowColor], [UIColor grayColor], [UIColor brownColor]];
    
//    BoidGroup *chasingBoidGroup = [resultSceneManager createBoidGroup:[UIColor redColor]];
//    BoidGroup *chasedBoidGroup = [resultSceneManager createBoidGroup:[UIColor greenColor]];
//    BoidGroup *chasedBoidGroup2 = [resultSceneManager createBoidGroup:[UIColor blueColor]];
    
    SpeedLimitRule *speedLimitRule = [SpeedLimitRule new];
    
//    [chasingBoidGroup.ruls addObject:speedLimitRule];
//    [chasedBoidGroup.ruls addObject:speedLimitRule];
//    speedLimitRule.speedLimit = 80;
//    
//    speedLimitRule = [SpeedLimitRule new];
//    [chasedBoidGroup2.ruls addObject:speedLimitRule];
//    speedLimitRule.speedLimit = 120;
    
//    [resultSceneManager group1Chasing:chasingBoidGroup group2:chasedBoidGroup];
//    [resultSceneManager group1Chasing:chasedBoidGroup group2:chasedBoidGroup2];
//    [resultSceneManager group1Chasing:chasedBoidGroup2 group2:chasingBoidGroup];
//

//    [resultSceneManager.boidsGroups addObject:chasingBoidGroup];
//    [resultSceneManager.boidsGroups addObject:chasedBoidGroup];
//    [resultSceneManager.boidsGroups addObject:chasedBoidGroup2];
    
    int numberOfBoidsGroups = 8;
    
    for (int i = 1; i <= numberOfBoidsGroups; ++ i){
        BoidGroup *newBoidGroup = [resultSceneManager createBoidGroup:colors[i - 1]];
        
        speedLimitRule = [SpeedLimitRule new];
        [newBoidGroup.ruls addObject:speedLimitRule];
        speedLimitRule.speedLimit = arc4random() % 80 + 80;
        
        [resultSceneManager.boidsGroups addObject:newBoidGroup];
        if (i > 1){
            [resultSceneManager group1Chasing:resultSceneManager.boidsGroups[i - 2] group2:newBoidGroup];
        }
        if (i == numberOfBoidsGroups){
            [resultSceneManager group1Chasing:newBoidGroup group2:resultSceneManager.boidsGroups[0]];
        }
    }    
    
    return resultSceneManager;
}

- (float)getFloat{
    float randomNumber = (arc4random() % 250) / 332.0 + 0.25;
    return randomNumber;
}


- (void)group1Chasing:(BoidGroup *)boidGroup1 group2:(BoidGroup *)boidGroup2{
    ChaseRule *chaseRule = [ChaseRule new];
    [boidGroup1.ruls addObject:chaseRule];
    chaseRule.chasedGroup = boidGroup2;
    
    EscapeRule *escapeRule = [EscapeRule new];
    [boidGroup2.ruls addObject:escapeRule];
    escapeRule.chasingGroup = boidGroup1;
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
