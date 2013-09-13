//
//  ChaseRule.m
//  BoidsAnimation
//
//  Created by Training on 9/13/13.
//  Copyright (c) 2013 Training. All rights reserved.
//

#import "ChaseRule.h"

@implementation ChaseRule

- (void)applyToBoid:(Boid *)boid inBoidsGroup:(BoidGroup *)boidGroup withDt:(float)dt{
    
    float x = self.chasedGroup.centerOfTheGroup.x;
    float y = self.chasedGroup.centerOfTheGroup.y;
    float speed = 150;
    
    x = (x - boid.position.x) / speed;
    y = (y - boid.position.y) / speed;
    
    boid.velocity = CGPointMake(x + boid.velocity.x, y + boid.velocity.y);
}


@end
