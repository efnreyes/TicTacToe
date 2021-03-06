//
//  ViewController.m
//  TicTacToe
//
//  Created by Efrén Reyes Torres on 7/24/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIWebViewDelegate>
@property (strong, nonatomic) IBOutlet UILabel *myLabelOne;
@property (strong, nonatomic) IBOutlet UILabel *myLabelTwo;
@property (strong, nonatomic) IBOutlet UILabel *myLabelThree;
@property (strong, nonatomic) IBOutlet UILabel *myLabelFour;
@property (strong, nonatomic) IBOutlet UILabel *myLabelFive;
@property (strong, nonatomic) IBOutlet UILabel *myLabelSix;
@property (strong, nonatomic) IBOutlet UILabel *myLabelSeven;
@property (strong, nonatomic) IBOutlet UILabel *myLabelEight;
@property (strong, nonatomic) IBOutlet UILabel *myLabelNine;
@property (strong, nonatomic) IBOutlet UILabel *whichPlayerLabel;
@property (strong, nonatomic) NSString *lastTurn;
@property int numberOfMoves;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.lastTurn = @"O";
    self.numberOfMoves = 0;
    self.whichPlayerLabel.textColor = [UIColor blueColor];
    self.whichPlayerLabel.text = @"X";
}

-(UILabel *)findLabelUsingPoint:(CGPoint)point {
    UILabel *labelPressed = nil;

    if (CGRectContainsPoint(self.myLabelOne.frame, point)) {
        labelPressed = self.myLabelOne;
    } else if (CGRectContainsPoint(self.myLabelTwo.frame, point)) {
        labelPressed = self.myLabelTwo;
    } else if (CGRectContainsPoint(self.myLabelThree.frame, point)) {
        labelPressed = self.myLabelThree;
    } else if (CGRectContainsPoint(self.myLabelFour.frame, point)) {
        labelPressed = self.myLabelFour;
    } else if (CGRectContainsPoint(self.myLabelFive.frame, point)) {
        labelPressed = self.myLabelFive;
    } else if (CGRectContainsPoint(self.myLabelSix.frame, point)) {
        labelPressed = self.myLabelSix;
    } else if (CGRectContainsPoint(self.myLabelSeven.frame, point)) {
        labelPressed = self.myLabelSeven;
    } else if (CGRectContainsPoint(self.myLabelEight.frame, point)) {
        labelPressed = self.myLabelEight;
    } else if (CGRectContainsPoint(self.myLabelNine.frame, point)) {
        labelPressed = self.myLabelNine;
    }
    return labelPressed;
}

-(IBAction)onLabelTapped:(UITapGestureRecognizer *)tapGestureRecognizer {
    CGPoint point = [tapGestureRecognizer locationInView:self.view];
    UILabel *labelPressed = [self findLabelUsingPoint:point];
    if (labelPressed != nil) {
        UIAlertView *alertView = [[UIAlertView alloc] init];
        alertView.delegate = self;
        NSString *winner;
        [self assignValueToLabel:labelPressed];
        winner = [self whoWon];
        if (![winner isEqualToString:@"NONE"]) {
            alertView.title = @"Winner!!!";
            alertView.message = [NSString stringWithFormat:@"The winner is %@", winner];
            [alertView addButtonWithTitle:@"OK"];
            [alertView show];
        } else if (self.numberOfMoves >= 9) {
            alertView.title = @"Try again";
            alertView.message = @"Draw game";
            [alertView addButtonWithTitle:@"OK"];
            [alertView show];
        }
    }
}

-(BOOL)assignValueToLabel:(UILabel *)labelPressed {
    if ([labelPressed.text isEqualToString:@""]) {
        if ([self.lastTurn isEqualToString:@"O"]) {
            labelPressed.textColor = [UIColor blueColor];
            labelPressed.text = @"X";
            self.whichPlayerLabel.textColor = [UIColor redColor];
            self.whichPlayerLabel.text = self.lastTurn;
            self.lastTurn = @"X";
        } else {
            labelPressed.textColor = [UIColor redColor];
            labelPressed.text = @"O";
            self.whichPlayerLabel.textColor = [UIColor blueColor];
            self.whichPlayerLabel.text = self.lastTurn;
            self.lastTurn = @"O";
        }
        self.numberOfMoves++;
        return YES;
    } else {
        self.whichPlayerLabel.textColor = [UIColor yellowColor];
        self.whichPlayerLabel.text = @"Position already taken";
        return NO;
    }
}

-(NSString *)whoWon {
    NSString *winner = @"NONE";

    return winner;
}

-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    self.myLabelOne.text = @"";
    self.myLabelTwo.text = @"";
    self.myLabelThree.text = @"";
    self.myLabelFour.text = @"";
    self.myLabelFive.text = @"";
    self.myLabelSix.text = @"";
    self.myLabelSeven.text = @"";
    self.myLabelEight.text = @"";
    self.myLabelNine.text = @"";
    self.numberOfMoves = 0;
}

@end
