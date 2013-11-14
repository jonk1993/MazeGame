//
//  Grid.m
//  MazeGame
//
//  Created by Jerry Jei-Rui Bao on 10/30/13.
//
//

#import "Grid.h"
#import "TileSpace.h"

@implementation Grid

#define WIDTH_TILE 80
#define HEIGHT_TILE 80
#define WIDTH_WINDOW 320
#define HEIGHT_WINDOW 480
#define DELAY_IN_SECONDS 0.15
#define Y_OFF_SET 0
#define HEIGHT_GAME HEIGHT_WINDOW
#define WIDTH_GAME WIDTH_WINDOW
#define NUM_ROWS (HEIGHT_GAME / HEIGHT_TILE)
#define NUM_COLUMNS (WIDTH_GAME / WIDTH_TILE)
bool endLevel = false;

-(id) init {
    if ((self = [super init])) {
        
        [self schedule:@selector(nextFrame) interval:DELAY_IN_SECONDS];
        [self scheduleUpdate];
        
    }
    return self;
}

-(void) initWidth:(int)w initHeight:(int)h {
        
    gameSpace = [[NSMutableArray alloc] init];
    for (int width = 0; width < w; width++) {
        
        NSMutableArray* subArr = [[NSMutableArray alloc] init];
        for (int height = 0; height < h; height++) {
            [subArr addObject: [[TileSpace alloc] initWithDoor:false initWithKey:false initWithCheckpoint:false initWithPlayer:false initWithNumStepsAllowed:1]];

        }
        [gameSpace addObject: subArr];
    }
}

-(void) draw
{
    ccColor4F rectColor = ccc4f(0.5, 0.5, 0.5, 1.0); //parameters correspond to red, green, blue, and alpha (transparancy)
    ccDrawSolidRect(ccp(0,0 + Y_OFF_SET), ccp(WIDTH_GAME, HEIGHT_GAME + Y_OFF_SET), rectColor);
    
    
    for(int row = 0; row < HEIGHT_GAME; row += WIDTH_TILE)
    {
        ccDrawLine(ccp(0, row + Y_OFF_SET), ccp(WIDTH_GAME, row + Y_OFF_SET));
        
    }
    
    for(int col = 0; col <= WIDTH_GAME; col += WIDTH_TILE)
    {
        ccDrawLine(ccp(col, 0 + Y_OFF_SET), ccp(col, HEIGHT_GAME + Y_OFF_SET));
    }
    
}

-(void) update: (ccTime) delta
{
    KKInput* input = [KKInput sharedInput];
    input.gestureSwipeEnabled = YES;
    
    if (input.gestureSwipeRecognizedThisFrame) {
        KKSwipeGestureDirection dir = input.gestureSwipeDirection;
        switch (dir) {
            case KKSwipeGestureDirectionDown:
                NSLog(@"Swipe down detected");
                
                break;
            case KKSwipeGestureDirectionLeft:
                NSLog(@"Swipe left detected");
                break;
            case KKSwipeGestureDirectionRight:
                NSLog(@"Swipe right detected");
                break;
            case KKSwipeGestureDirectionUp:
                NSLog(@"Swipe up detected");
                break;
        }
    }

}

-(void) nextFrame
{
    
}

-(void) updateGrid
{
    //updates the grid array after there is a move
}

@end
