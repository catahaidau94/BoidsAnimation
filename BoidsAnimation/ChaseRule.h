//
//  ChaseRule.h
//  BoidsAnimation
//
//  Created by Training on 9/13/13.
//  Copyright (c) 2013 Training. All rights reserved.
//

#import "Rule.h"

@interface ChaseRule : Rule

@property BoidGroup *chasedGroup;

- (void)applyToBoid:(Boid *)boid inBoidsGroup:(BoidGroup *)boidGroup withDt:(float)dt;


@end
