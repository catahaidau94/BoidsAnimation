//
//  KeepDistanceRule.m
//  BoidsAnimation
//
//  Created by Training on 9/12/13.
//  Copyright (c) 2013 Training. All rights reserved.
//

#import "KeepDistanceRule.h"

@implementation KeepDistanceRule

- (void)applyToBoid:(Boid *)boid inBoidsGroup:(BoidGroup *)boidGroup withDt:(float)dt{
    float x = 0;
    float y = 0;
    
    for (Boid *boid2 in boidGroup.boids){
        if (boid != boid2){
            float distance = sqrt ((boid2.position.x - boid.position.x) * (boid2.position.x - boid.position.x) + (boid2.position.y - boid.position.y) * (boid2.position.y - boid.position.y));
            
            if (distance < boid.size * 1.2){
                x = x - (boid2.position.x - boid.position.x);
                y = y - (boid2.position.y - boid.position.y);
            }
        }
    }
    
    float speed = 3;
    
    boid.velocity = CGPointMake(boid.velocity.x + speed * x, boid.velocity.y + speed * y);
}


@end
