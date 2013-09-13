//
//  BoidGroup.m
//  BoidsAnimation
//
//  Created by Training on 9/11/13.
//  Copyright (c) 2013 Training. All rights reserved.
//

#import "BoidGroup.h"
#import "Boid.h"
#import "RandomRule.h"
#import "CenterRule.h"
#import "CenterVelocityRule.h"
#import "KeepDistanceRule.h"
#import "KeepOnScreen.h"
#import "SpeedLimitRule.h"
#import "TendToPlaceRule.h"


@implementation BoidGroup

- (void)createBoids{
    

    self.boids = [NSMutableArray new];
    self.ruls = [NSMutableArray new];
    
    [self.ruls addObject:[CenterRule new]];
//    [self.ruls addObject:[RandomRule new]];
    [self.ruls addObject:[CenterVelocityRule new]];
    [self.ruls addObject:[KeepDistanceRule new]];
    [self.ruls addObject:[KeepOnScreen new]];
  // [self.ruls addObject:[SpeedLimitRule new]];
 //   [self.ruls addObject:[TendToPlaceRule new]];
    
    for (int i = 1; i <= 20; ++ i){
        Boid *boid = [Boid createBoid];
        
        [self.boids addObject:boid];
    }

}

- (void)update:(float)dt{
    
    for (Boid *boid in self.boids) {
        for (Rule *rule in self.ruls) {
            [rule applyToBoid:boid inBoidsGroup:self withDt:dt];
        }
        [boid update:dt];
    }

}

- (void)setColor:(UIColor *)color {
    _color = color;
    
    for (Boid *boid in self.boids) {
        [boid colorBoid:color];
    }
}

- (CGPoint)centerOfTheGroup{
    float x = 0;
    float y = 0;
    
    for (Boid *boid in self.boids) {
        x = x + boid.position.x;
        y = y + boid.position.y;
    }
    
    x /= self.boids.count;
    y /= self.boids.count;
    
    return CGPointMake(x, y);
}


@end
