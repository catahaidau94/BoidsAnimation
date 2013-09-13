//
//  CenterRule.m
//  BoidsAnimation
//
//  Created by Training on 9/12/13.
//  Copyright (c) 2013 Training. All rights reserved.
//

#import "CenterRule.h"
#import "BoidGroup.h"

@implementation CenterRule


- (void)applyToBoid:(Boid *)boid inBoidsGroup:(BoidGroup *)boidGroup withDt:(float)dt{
    float x = 0;
    float y = 0;
    
    for (Boid *boid2 in boidGroup.boids){
        if (boid2 != boid){
            x += boid2.position.x;
            y += boid2.position.y;
        }
    }
    
    x /= boidGroup.boids.count - 1;
    y /= boidGroup.boids.count - 1;
    
    float speed = 50;
    
    boid.velocity = CGPointMake(boid.velocity.x + (x - boid.position.x) / speed,
                                boid.velocity.y + (y - boid.position.y) / speed);
    
}

@end
