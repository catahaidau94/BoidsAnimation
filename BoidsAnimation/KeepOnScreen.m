//
//  KeepOnScreen.m
//  BoidsAnimation
//
//  Created by Training on 9/12/13.
//  Copyright (c) 2013 Training. All rights reserved.
//

#import "KeepOnScreen.h"

@implementation KeepOnScreen

- (void)applyToBoid:(Boid *)boid inBoidsGroup:(BoidGroup *)boidGroup withDt:(float)dt{
    
    float speed = 120;
    float inSet = 100;
    float x = 0;
    float y = 0;
    CGSize screenSize = boid.superview.frame.size;
    
    if (boid.position.x < 10){
        x = speed;
    }
    else if (boid.position.x > screenSize.width - inSet){
        x = - speed;
    }
    
    if (boid.position.y < inSet){
        y = speed;
    }
    else if (boid.position.y > screenSize.height - inSet){
        y = - speed;
    }
    
    boid.velocity = CGPointMake(boid.velocity.x + x, boid.velocity.y + y);
}

@end
