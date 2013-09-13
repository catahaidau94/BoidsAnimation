//
//  TendToPlaceRule.m
//  BoidsAnimation
//
//  Created by Training on 9/13/13.
//  Copyright (c) 2013 Training. All rights reserved.
//

#import "TendToPlaceRule.h"

@implementation TendToPlaceRule

- (void)applyToBoid:(Boid *)boid inBoidsGroup:(BoidGroup *)boidGroup withDt:(float)dt{
    
    float x = 150;
    float y = 250;
    float speed = 100;
    
    x = (x - boid.position.x) / speed;
    y = (y - boid.position.y) / speed;
    
    boid.velocity = CGPointMake(x + boid.velocity.x, y + boid.velocity.y);
}

@end
