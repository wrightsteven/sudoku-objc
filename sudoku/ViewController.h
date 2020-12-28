//
//  ViewController.h
//  sudoku
//
//  Created by Steven Wright on 12/28/20.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
-(void)genrateSudoku;
-(void)fillEmptyGrid;
-(BOOL)fileValue;
-(NSMutableArray *)boxArray;
-(NSMutableArray *)colArray;
-(NSString *)getRandomCol;
-(NSMutableArray *)board;


@end

