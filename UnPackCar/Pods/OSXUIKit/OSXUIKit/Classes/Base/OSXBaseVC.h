//
//  OSXBaseVC.h
//  CocoaLumberjack
//
//  Created by houlin on 2019/12/26.
//

#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface OSXBaseVC : NSViewController

- (void)bindView;
- (void)bindData;
- (void)bindLayout;
- (void)bindAction;

@end

NS_ASSUME_NONNULL_END
