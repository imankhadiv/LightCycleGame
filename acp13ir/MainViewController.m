//
//  MainViewController.m
//  acp13ir
//
//  Created by Iman Rastkhadivmasouleh on 12/11/2013.
//  Copyright (c) 2013 Iman Rastkhadiv. All rights reserved.
//

#import "MainViewController.h"
#import "ViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	// Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor grayColor];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)unwindToMain:(UIStoryboardSegue *)seg {
    
}
-(void)startGame:(id)sender {
    
    
}
//-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//
//
//}


@end
