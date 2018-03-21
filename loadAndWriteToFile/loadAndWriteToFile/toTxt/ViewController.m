//
//  ViewController.m
//  loadAndWriteToFile
//
//  Created by Mateusz Chojnacki on 3/21/18.
//  Copyright © 2018 Mateusz Chojnacki. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (IBAction)saveBTN:(id)sender {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:@"file.txt"];
    
    NSString *str = self.textField.text;
    [str writeToFile:filePath atomically:TRUE encoding:NSUTF8StringEncoding error:NULL];
    
    
}
- (IBAction)loadBTN:(id)sender {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:@"file.txt"];
    NSString *str = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:NULL];
    
    
    self.label.text = str;
}


@end
