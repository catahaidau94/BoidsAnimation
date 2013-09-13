//
//  EscapeRule.m
//  BoidsAnimation
//
//  Created by Training on 9/13/13.
//  Copyright (c) 2013 Training. All rights reserved.
//

#import "EscapeRule.h"

@implementation EscapeRule

- (void)applyToBoid:(Boid *)boid inBoidsGroup:(BoidGroup *)boidGroup withDt:(float)dt{
    
    float x = self.chasingGroup.centerOfTheGroup.x - boid.position.x;
    float y = self.chasingGroup.centerOfTheGroup.y - boid.position.y;
    float speed = 0.0225;
    
    x = x * (- speed);
    y = y * (- speed);
    
    boid.velocity = CGPointMake(x + boid.velocity.x, y + boid.velocity.y);
}


@end
