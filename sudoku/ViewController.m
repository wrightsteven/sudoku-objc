//
//  ViewController.m
//  sudoku
//
//  Created by Steven Wright on 12/28/20.
//

#import "ViewController.h"

@interface ViewController (){
    NSMutableArray *board;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self genrateSudoku];
}

-(void)genrateSudoku{
    [self fillEmptyGrid];
    @autoreleasepool {
        int n = 3;
        BOOL flag=NO;
        for (int i = 0; i < n*n; i++) {

            for (int j = 0; j < n*n; j++){
                if ([board[i][j] isEqualToString:@"_"]) {
                    if (![self fileValue:i and:j]) {
                        flag=YES;
                        break;
                    }
                }else{
                    continue;
                }
            }
            if (flag) {
                break;
            }
        }

        if (flag) {
            [self genrateSudoku];
        }else{
            NSLog(@"board fill =%@",board);
        }
    }
}
-(void)fillEmptyGrid{
      int n = 3;
    board=[[NSMutableArray alloc]init];
    for (int i = 0; i < n*n; i++) {
        NSMutableArray *a=[[NSMutableArray alloc]init];
        [board addObject:a];
        for (int j = 0; j < n*n; j++){
            [board[i] addObject:[NSString stringWithFormat:@"_"]];
        }
    }
}
-(BOOL)fileValue:(int)i and:(int)j{
    NSMutableArray *rowArray=board[i];
    NSMutableArray *cellArray=[self boxArray:i and:j];
    NSMutableArray *columnArray=[self colArray:i and:j];
    NSString *value =[self getRandomCol:columnArray rowA:rowArray box:cellArray];
    if (value==nil) {
        return NO;
    }else{
        board[i][j]=value;
        return YES;
    }

}

-(NSMutableArray *)boxArray:(int)i and:(int)j {
    int x= (i<3)?0:((i<6)?3:6);
    int y=(j<3)?0:((j<6)?3:6);

    NSMutableArray *ar=[[NSMutableArray alloc]init];

    for (int a=x; a<x+3; a++) {
        for (int b=y; b<y+3; b++) {
            [ar addObject:board[a][b]];
        }
    }
    return ar;
}
-(NSMutableArray *)colArray:(int)i and:(int)j{
    NSMutableArray *ar=[[NSMutableArray alloc]init];
        for (int b=0; b<9; b++) {
            [ar addObject:board[b][j]];
        }
    return ar;
}

-(NSString *)getRandomCol:(NSMutableArray *)col rowA:(NSMutableArray *)row box:(NSMutableArray *)box{
    NSMutableArray *array=[[NSMutableArray alloc]initWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9", nil];

    [array removeObjectsInArray:row];
    [array removeObjectsInArray:box];
    [array removeObjectsInArray:col];
    if (array.count>0) {
        int x=arc4random()%array.count;
        return array[x];
    }
    else{
        return nil;
    }
}

/*-(BOOL)isValid{
    
}*/
@end
