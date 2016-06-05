//
//  AppDelegate.m
//  ios-prework-objc-assessment
//
//  Created by Joel Bell on 5/23/16.
//  Copyright © 2016 Joel Bell. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NSArray *numbersArray = [self generateArrayOfNumbers];
    NSArray *lettersArray = [self generateArrayOfLetters];
    NSDictionary *alphabetDictionary = [self generateNumbersAndLettersDictionaryWithNumbers:numbersArray
                                                                                    letters:lettersArray];
    
    numbersArray = [alphabetDictionary allKeys];
    
    NSMutableArray *mutableLettersArray = [lettersArray mutableCopy];
    [mutableLettersArray removeAllObjects];
    
    for (NSString *key in numbersArray) {
        [mutableLettersArray addObject:alphabetDictionary[key]];
    }
    
    NSSortDescriptor *sortAsc = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES];
    numbersArray = [numbersArray sortedArrayUsingDescriptors:@[sortAsc]];
    [mutableLettersArray sortUsingDescriptors:@[sortAsc]];
    
    NSLog(@"%@\n%@", numbersArray, mutableLettersArray);
    
    return YES;
}

- (NSArray *)generateArrayOfNumbers {
    NSMutableArray *numbers = [NSMutableArray array];
    for (NSUInteger i = 1; i <= 26; i++) {
        [numbers addObject:@(i)];
    }
    
    return numbers;
}

- (NSArray *)generateArrayOfLetters {
    NSMutableArray *letters = [NSMutableArray array];
    char character = 'a';
    [letters addObject:[NSString stringWithFormat:@"%c", character]];
    
    for (NSUInteger i = 1; i < 26; i++) {
        character++;
        [letters addObject:[NSString stringWithFormat:@"%c", character]];
    }
    
    return letters;
}

- (NSDictionary *)generateNumbersAndLettersDictionaryWithNumbers:(NSArray *)numbers letters:(NSArray *)letters {
    NSMutableDictionary *alphabetDict = [NSMutableDictionary dictionary];
    for (NSUInteger i = 0; i < letters.count; i++) {
        [alphabetDict setObject:letters[i] forKey:numbers[i]];
    }
    
    return alphabetDict;
}

@end
