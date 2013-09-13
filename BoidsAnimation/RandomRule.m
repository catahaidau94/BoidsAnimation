//
//  RandomRule.m
//  BoidsAnimation
//
//  Created by Training on 9/11/13.
//  Copyright (c) 2013 Training. All rights reserved.
//

#import "RandomRule.h"

@implementation RandomRule

- (id)init
{
    self = [super init];
    if (self) {
        float r = arc4random() % 210 + 10;
        float t = arc4random() % 361;

        t = t / 180 * 3.14;
        
        self.velocity = CGPointMake(r * cos(t), r * sin(t));
    }
    return self;
}

- (void)applyToBoid:(Boid *)boid inBoidsGroup:(BoidGroup *)boidGroup withDt:(float)dt{
    boid.velocity = CGPointMake(boid.velocity.x + self.velocity.x * 0.001,
                                boid.velocity.y + self.velocity.y * 0.001);
}

@end
