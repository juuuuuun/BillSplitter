//
//  ViewController.m
//  BillSplitter
//
//  Created by Jun Oh on 2019-01-19.
//  Copyright © 2019 Jun Oh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *billAmountTextField;
@property (weak, nonatomic) IBOutlet UISlider *numberOfPeopleSlider;
@property (weak, nonatomic) IBOutlet UILabel *splitAmountLabel;
@property (weak, nonatomic) IBOutlet UILabel *numberOfPeopleLabel;
@property (weak, nonatomic) IBOutlet UILabel *withTipLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)numberOfPeopleSliderValueChanged:(UISlider *)sender {
    self.numberOfPeopleLabel.text = [NSString stringWithFormat:@"Number of People: %i", [NSDecimalNumber decimalNumberWithDecimal:[NSNumber numberWithFloat:self.numberOfPeopleSlider.value].decimalValue].intValue];
    [self calculateAmount];
}
- (IBAction)billAmountChanged:(UITextField *)sender {
    [self calculateAmount];
}

- (void) calculateAmount {
    NSNumberFormatter* numberFormatter = [[NSNumberFormatter alloc] init];
    numberFormatter.generatesDecimalNumbers = YES;
    NSNumber* billAmount = [numberFormatter numberFromString:self.billAmountTextField.text];
    NSDecimalNumber* numberOfPeople = [NSDecimalNumber decimalNumberWithDecimal:[NSNumber numberWithFloat:self.numberOfPeopleSlider.value].decimalValue];
    self.splitAmountLabel.text = [NSString stringWithFormat:@"$%.2f", billAmount.floatValue / numberOfPeople.intValue];
    self.withTipLabel.text = [NSString stringWithFormat:@"With Tip (15%%): $%.2f", billAmount.floatValue / numberOfPeople.intValue * 0.15];
    
}

- (IBAction)calculateSplitAmount:(UIButton *)sender {
    [self calculateAmount];
    
    
}

@end
