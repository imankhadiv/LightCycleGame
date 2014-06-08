//
//  ViewController.m
//  acp13ir
//
//  Created by Iman Rastkhadivmasouleh on 11/11/2013.
//  Copyright (c) 2013 Iman Rastkhadiv. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    Grid *grid;
    ComputerPlayer *computer ;
    HumanPlayer *human;
    GridView *gridView ;
    NSTimer *timer ;
    NSString *result;
    int touchedNumber ;
    int count;
    
    
    
    
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //Do any additional setup after loading the view, typically from a nib.
    grid = [[Grid alloc] init];
    computer = [[ComputerPlayer alloc] initWithGrid:grid];
    human = [[HumanPlayer alloc] initWithGrid:grid];
    gridView = [[GridView alloc] initWithFrame:CGRectMake(5,15,306,306)];
    
    [self.view addSubview:gridView];
    for (int i = 0; i<400; i++) {
        [gridView changeSubView:i withStatus:[grid.cells[i] intValue]];
        
    }
    self.view.backgroundColor = [UIColor blackColor];
    
    
    touchedNumber = 0 ;
    [self.view addSubview:_resultView];
    [_resultView addSubview:_resultLabel];
    _resultView.alpha = 0;
    
    count = 0 ;
    _timeLabel.text=@"0";
    _timeLabel.backgroundColor = [UIColor blueColor];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

- (IBAction)startGame:(id)sender {
    
    NSLog(@"Play button pressed");
    if(timer){
        [timer invalidate];
    }
    if(gridView)
        [gridView removeFromSuperview];
    if(self.resultView)
        [self.resultView removeFromSuperview];
    
    [self viewDidLoad];
    
    
    
    timer =[NSTimer scheduledTimerWithTimeInterval:(0.5) target:self selector:@selector(onTimer) userInfo:nil repeats:(YES)];
    
    
}
-(void)onTimer{
    self.timeLabel.text = [[NSNumber numberWithInt:count] stringValue];
    count ++;
    [computer move];
    int computerHead = computer.computerHeadPositon ;
    [gridView changeSubView:computerHead withStatus:2];
    
    [human moveTo:touchedNumber];
    int humanHead = human.playerHeadPosition;
    [gridView changeSubView:humanHead withStatus:1];
    if( humanHead == computerHead) {
        [gridView changeSubView:computerHead withStatus:3];
        result = @"Draw";
        [self gameOver];
        
        
    }
    else if([computer checkCollsion:computerHead]) {
        [gridView changeSubView:computerHead withStatus:3];
        result = @"You Won";
        
        [self gameOver];
        self.view.backgroundColor = [UIColor redColor];
        
        
    }
    else if ([human checkCollsion:humanHead]) {
        [gridView changeSubView:humanHead withStatus:3];
        result = @"Computer Won!";
        // self.view.backgroundColor = [UIColor greenColor];
        [self gameOver];
        
    }
    else {
        
        [grid changeCellState:computerHead with:2];
        [grid changeCellState:humanHead with:1];
        
    }
}
-(void)gameOver {
    gridView.alpha =.3 ;
    self.resultLabel.text = result ;
    self.resultLabel.alpha =1;
    self.resultView.alpha=1;
    
    
    [self.view setNeedsDisplay];
    [timer invalidate];
    [timer invalidate];
    
    
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [touches anyObject];
    
    if ([touch view] == [self upArrow])
    {
        
        touchedNumber =0;
        
    }
    if ([touch view] == [self rightArrow])
    {
        
        touchedNumber=1;
        
    }
    if ([touch view] == [self downArrow])
    {
        touchedNumber=2;
        
    }
    if ([touch view] == [self leftArrow])
    {
        
        touchedNumber=3;
        
    }
    
    
}


@end
