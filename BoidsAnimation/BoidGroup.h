//
//  BoidGroup.h
//  BoidsAnimation
//
//  Created by Training on 9/11/13.
//  Copyright (c) 2013 Training. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Boid.h"

@interface BoidGroup : NSObject

@property NSMutableArray *boids;
@property NSMutableArray *ruls;
@property (nonatomic) UIColor *color;

- (void)createBoids;
- (void)update:(float)dt;
- (CGPoint)centerOfTheGroup;

@end