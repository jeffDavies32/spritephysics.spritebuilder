
#import "Obstacle.h"

@implementation Obstacle {
    CCSprite9Slice *_obstacle1;
}

- (void)didLoadFromCCB {
    _obstacle1.physicsBody.collisionType = @"objectC";
    _obstacle1.physicsBody.sensor = TRUE;
}

@end
