//
//  CenterVelocityRule.m
//  BoidsAnimation
//
//  Created by Training on 9/12/13.
//  Copyright (c) 2013 Training. All rights reserved.
//

#import "CenterVelocityRule.h"

@implementation CenterVelocityRule

- (void)applyToBoid:(Boid *)boid inBoidsGroup:(BoidGroup *)boidGroup withDt:(float)dt{
    float x = 0;
    float y = 0;
    
    for (Boid *boid2 in boidGroup.boids){
        if (boid2 != boid){
            x += boid.velocity.x;
            y += boid.velocity.y;
        }
    }
    
    x /= boidGroup.boids.count - 1;
    y /= boidGroup.boids.count - 1;
    
    float speed = 1.0f;
    
    boid.velocity = CGPointMake(boid.velocity.x + (x - boid.velocity.x) * speed,
                                boid.velocity.y + (y - boid.velocity.y) * speed);
    
}

@end
