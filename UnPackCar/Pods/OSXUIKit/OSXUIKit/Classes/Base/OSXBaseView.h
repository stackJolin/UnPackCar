//
//  OSXBaseView.h
//  OSXUIKit
//
//  Created by houlin on 2019/12/25.
//

#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface OSXBaseView : NSView

- (void)bindView;
- (void)bindData;
- (void)bindLayout;
- (void)bindAction;

@end

NS_ASSUME_NONNULL_END
