//
//  JsonViewController.m
//  loadAndWriteToFile
//
//  Created by Mateusz Chojnacki on 3/21/18.
//  Copyright © 2018 Mateusz Chojnacki. All rights reserved.
//

#import "JsonViewController.h"

@interface JsonViewController ()

@end

@implementation JsonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)SaveBTN:(id)sender {
    NSString* filePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString* fileName = @"bookmark.json";
    NSString* fileAtPath = [filePath stringByAppendingPathComponent:fileName];
    
    
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:fileAtPath]) {
        [[NSFileManager defaultManager] createFileAtPath:fileAtPath contents:nil attributes:nil];
    }
    
    NSString *jsonString = @"{\"ID\":{\"Content\":268,\"type\":\"text\"},\"ContractTemplateID\":{\"Content\":65,\"type\":\"text\"}}";
    
    // The main act...
//    [[self.textField.text dataUsingEncoding:NSUTF8StringEncoding] writeToFile:fileAtPath atomically:NO];
    // jsonString
    [[jsonString dataUsingEncoding:NSUTF8StringEncoding] writeToFile:fileAtPath atomically:NO];
    
}
- (IBAction)LoadBTN:(id)sender {
    // Build the path...
    NSString* filePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString* fileName = @"bookmark.json";
    NSString* fileAtPath = [filePath stringByAppendingPathComponent:fileName];
    
    // The main act...
    NSString *stringValue = [[NSString alloc] initWithData:[NSData dataWithContentsOfFile:fileAtPath] encoding:NSUTF8StringEncoding];
    self.label.text = stringValue;
    
    NSLog(@"%@",[[NSString alloc] initWithData:[NSData dataWithContentsOfFile:fileAtPath] encoding:NSUTF8StringEncoding]);
    
    NSData *data = [stringValue dataUsingEncoding:NSUTF8StringEncoding];
    id json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    
    NSLog(@"%@",json);
    
}


@end
