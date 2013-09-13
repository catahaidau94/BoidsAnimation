//
//  SpeedLimitRule.m
//  BoidsAnimation
//
//  Created by Training on 9/12/13.
//  Copyright (c) 2013 Training. All rights reserved.
//

#import "SpeedLimitRule.h"

@implementation SpeedLimitRule

- (void)applyToBoid:(Boid *)boid inBoidsGroup:(BoidGroup *)boidGroup withDt:(float)dt{
    
    float speed = 0.7;
    float x = 1;

    if (sqrt (boid.velocity.x * boid.velocity.x + boid.velocity.y * boid.velocity.y) >= self.speedLimit){
        x = speed;
    }
    
    boid.velocity = CGPointMake(boid.velocity.x * x, boid.velocity.y * x);
}

@end
