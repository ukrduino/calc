//
//  ViewController.h
//  calc
//
//  Created by sergey on 09.07.14.
//  Copyright (c) 2014 Sergey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    
    IBOutlet UILabel *displayLabel;
    double x; // вводится с клавиатуры
    double y; // сюда переносится пред знач из х
    NSInteger butTag; // для получения идентификатора нажатой кнопки (tag)
    NSMutableString *xStrMut;
    NSString *xStr;
    int DADP; // Digit After Decimal Point
    
    IBOutlet UIStepper *digitAfterDecimalPointStepper;
    
    IBOutlet UILabel *digitAfterDecimalPointLabel;
    
}
-(IBAction)clear:(id)sender;

-(IBAction)clearAll:(id)sender;

-(IBAction)digit:(id)sender;

-(IBAction)operation:(id)sender;

-(IBAction)inverseSign:(id)sender;

-(IBAction)digitAfterDecimalPoint:(id)sender;




@end

