Gesture Recognizers
===================

Gesture recognizers interpret touches to determine whether they correspond to a specific gesture, such as a swipe, pinch, or rotation. If they recognize their assigned gesture, they send an action message to a target object. Gesture recognizers convert low-level event handling code into higher-level actions. They are objects that you attach to a view, which allows the view to respond to actions the way a control does.


TicTacToe
=========


As a user, I want to view the playing board
3 points

    Create a new project and name it TicTacToe
    Add this project to your GitHub account
    Add a grid of 9 UILabels to the Storyboard
    Connect each of the labels to a correspponding outlet in ViewController.m. Name them in series: myLabelOne, myLabelTwo, myLabelThree, etc.

@interface ViewController ()
@property IBOutlet UILabel *myLabelOne;
@property IBOutlet UILabel *myLabelTwo;
@property IBOutlet UILabel *myLabelThree;
@end

    The labels should be arranged from left to right, top to bottom

As a user, I want to see whose turn it is
2 points

    Add a UILabel to your ViewController
    Connect the label to an outlet in your ViewController.m and name it: whichPlayerLabel

As a user, I want to figure out if I touched a specific label
3 points

    Add a method findLabelUsingPoint:(CGPoint)point to your ViewController and implement its logic.
    Add a UITapGestureRecognizer to your ViewController
    Add an action to your ViewController named onLabelTapped:
    Implement logic in onLabelTapped: that finds the label that was tapped using findLabelUsingPoint: and sets that label’s text to X or an O depending on the current player
    Ensure X’s are blue and O’s are red
    Ensure whichPlayerLabel shows either an X or an O indicating the player who should go next.

As a user, I want to determine if user has won the game
3 points

    Implement ­- (NSString*)whoWon
    If player X won, return @"X", etc.

As a user, I want to show the winner of a game
1 point

    At the end of each “turn”, call whoWon, if someone has won, show a UIAlertView proclaiming victory for that player
    Add a button to the alert that when pressed starts a new game


Stretches
=========


As a user, I want to drag an X or an O to a grid position
2 points

    This will require some more UILabels *hint: Use UIPanGestureRecognizer



As a user, I want to limit the amount of time a user takes to make a move
2 points

    At the end of the time, the move is forfeited and they lose their turn. *hint: Look at NSTimer



As a user, I want to display help for users who have never seen Tic, Tac, Toe.
1 point

    Migrate your WebView code from the Safari challenge
    Add a help button to your ViewController in the Storboard
    Present the WebView viewController using a modal segue. Set the WebView’s URL to be the wikpedia page for Tic, Tac, Toe.



As a user, I want to play the computer
3 points

    Implement the logic to play against a human player

