#import "ViewController.h"

enum {  OP_PLUS = 1001,
       OP_MINUS = 1002,
        OP_MULT = 1003,
         OP_DIV = 1004};

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}



-(IBAction)clear:(id)sender{
    
    x = 0;
    
    //    Мой вариант
    //    xStrMut = [NSMutableString stringWithFormat:(@"%d"), 0];
    
    [self calcScreen];
    
}


-(IBAction)clearAll:(id)sender{
    
    x = 0;
    
    y = 0;
    
    butTag = 0;
    
    //    Мой вариант
    //    xStrMut = [NSMutableString stringWithFormat:(@"%d"), 0];
    
    xStr = [NSString stringWithFormat:(@"%d"), 0];
    
    [self calcScreen];
    
}


-(IBAction)digit:(id)sender{
    
    //     Видео версия
    
    x = (10.0f * x)+ [sender tag];
    
    xStr = [NSString stringWithFormat:(@"%1.0f"), x];
    
    [self calcScreen];
    
}
    //    Мой вариант
    //    if (x == 0){
    //
    //        x = [sender tag];
    //        xStrMut = [NSMutableString stringWithFormat:(@"%g"), x];
    //    }
    //
    //    else{
    //
    //        x = [sender tag];
    //        if ([sender tag]== 10) {
    //
    //            [xStrMut appendString:@"0"];
    //        }
    //        else {
    //
    //            [xStrMut appendString:[NSMutableString stringWithFormat:(@"%g"), x]];
    //        }
    //    }
    




-(IBAction)operation:(id)sender{
    
    switch (butTag) {
        case OP_PLUS :x =  x + y; [self calcScreenLast];
            break;
        case OP_MINUS:x =  y - x; [self calcScreenLast];
            break;
        case OP_MULT :x =  x * y; [self calcScreenLast];
            break;
        case OP_DIV  :x =  y / x; [self calcScreenLast];
            break;
        default:
            break;
    }

    
    //    if (butTag == 1001){x = [xStrMut doubleValue]; x = x + y; [self calcScreenLast];}
    //    if (butTag == 1002){x = [xStrMut doubleValue]; x = y - x; [self calcScreenLast];}
    //    if (butTag == 1003){x = [xStrMut doubleValue]; x = x * y; [self calcScreenLast];}
    //    if (butTag == 1004){x = [xStrMut doubleValue]; x = y / x; [self calcScreenLast];}
    
    
    if (x){
        
        y = x;}
    
    x = 0;
    
    butTag = [sender tag]; //какая кнопка нажата
    
    [self calcScreen];
    
    
}


-(IBAction)inverseSign:(id)sender{
    
    if (x!=0){
        
    x = -x;
    
    xStr = [NSString stringWithFormat:(@"%1.0f"), x];
        [self calcScreen];
    }
    else {
        y = -y;
        
        xStr = [NSString stringWithFormat:(@"%1.0f"), y];
        
          [self calcScreenLast];
    }

}

-(void)calcScreen{
    
    
    //        if (xStr) {
    
    
    
    [displayLabel setText:xStr];
    

    //        }
    
    //    Мой вариант
    //        else{
    //            [displayLabel setText:xStrMut];
    //        }
    
    
}

-(void)calcScreenLast{
    
    [self formatXstr];
    [displayLabel setText:xStr];

    
}

-(IBAction)digitAfterDecimalPoint:(UIStepper *)sender{
    
    DADP = (int)[sender value];
    
    
    [digitAfterDecimalPointLabel setText:[NSString stringWithFormat:@"%1.i", DADP]];
    
}

-(void)formatXstr{
    
    NSNumberFormatter * nf = [[NSNumberFormatter alloc] init];
    
    [nf setMaximumFractionDigits:DADP];
    
    xStr = [nf stringFromNumber:[NSNumber numberWithDouble:x]];
    
}

@end


