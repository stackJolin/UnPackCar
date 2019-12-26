//
//  OSXBaseView.m
//  OSXUIKit
//
//  Created by houlin on 2019/12/25.
//

#import "OSXBaseView.h"

@implementation OSXBaseView

- (instancetype)initWithFrame:(NSRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self bindView];
        [self bindData];
        [self bindLayout];
        [self bindAction];
    }
    return self;
}

- (void)bindView {
    
}

- (void)bindData {
    
}

- (void)bindLayout {
    
}

- (void)bindAction {
    
}

- (BOOL)isFlipped {
    return true;
}

@end
