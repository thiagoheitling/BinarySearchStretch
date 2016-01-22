//
//  main.m
//  BinarySearchStretch
//
//  Created by Thiago Heitling on 2016-01-17.
//  Copyright © 2016 Thiago Heitling. All rights reserved.
//

#import <Foundation/Foundation.h>

NSArray *binarySearchStretch(int inputTarget, NSArray *inputSortedArray) {
    
    NSArray *sortedArray = inputSortedArray;
    NSArray *targetIndexAndNumberOfAppearances = [[NSArray alloc]init];

    int target = inputTarget;
    int min = 0;
    int max = (int)[sortedArray count];
    int midPointIndex;
    int appearances = 0;
    int result;
    
    while((min + 1) < max) {
        midPointIndex = (min + max)/2;
        if (target < [[sortedArray objectAtIndex:midPointIndex]intValue]) {
            max = midPointIndex;
        }
        else {
            min = midPointIndex;
        }
    }
    
    if (target == [sortedArray[min]intValue]) {
        int i = min;
        while (target == [[sortedArray objectAtIndex:i]intValue]) {
            appearances++;
            i--;
        }
        result = min - appearances + 1;
    }
    else {
        result = 0;
        appearances = -1;
    }
 
    targetIndexAndNumberOfAppearances = @[[NSNumber numberWithInt:result], [NSNumber numberWithInt:appearances]];
    NSLog(@"{%@, %@}", targetIndexAndNumberOfAppearances[0], targetIndexAndNumberOfAppearances[1]);
    
    return targetIndexAndNumberOfAppearances;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        int target = 8;
        NSArray *sortedArray = @[@5, @7, @8, @8, @10, @10, @11, @11, @11, @14];
        binarySearchStretch(target, sortedArray);
        
        return 0;
    }
}
