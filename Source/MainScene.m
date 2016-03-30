#import "MainScene.h"
#import "Obstacle.h"

@implementation MainScene {
    CCSprite *_objectA;
    CCSprite *_objectB;
    CCPhysicsNode *_physicsNode;
}

-(void)didLoadFromCCB {
    _physicsNode.collisionDelegate = self;
    _objectA.physicsBody.collisionType = @"objectA";
    _objectB.physicsBody.collisionType = @"objectB";
    [self loadObstacle];
    [self moveBothObjects];
}

-(void)loadObstacle {
    Obstacle *newObstacle = (Obstacle*)[CCBReader load:@"Obstacle"];
    newObstacle.positionType = CCPositionTypeMake(CCPositionUnitPoints, CCPositionUnitPoints, CCPositionReferenceCornerTopLeft);
    newObstacle.position = ccp(300, 0);
    [_physicsNode addChild:newObstacle];
}

-(void)moveBothObjects {
    CCActionMoveBy *action1 = [CCActionMoveBy actionWithDuration:1.0 position:ccp(1.0, 0)];
    CCActionMoveBy *action2 = [CCActionMoveBy actionWithDuration:1.0 position:ccp(1.0, 0)];
    [_objectA runAction:action1];
    [_objectB runAction:action2];
}

-(BOOL)ccPhysicsCollisionBegin:(CCPhysicsCollisionPair *)pair objectA:(CCNode *)objectA objectC:(CCNode *)objectC {
    
    NSLog(@"Collision Occurred ObjectA");
    [_objectA stopAllActions];
    return TRUE;
}

-(BOOL)ccPhysicsCollisionBegin:(CCPhysicsCollisionPair *)pair objectB:(CCNode *)objectB objectC:(CCNode *)objectC {
    
    NSLog(@"Collision Occurred ObjectB");
    [_objectB stopAllActions];
    return TRUE;
}

@end
