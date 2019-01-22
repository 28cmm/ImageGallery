//
//  ImageDetailViewController.h
//  ImageGalleries
//
//  Created by Yilei Huang on 2019-01-21.
//  Copyright © 2019 Joshua Fanng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ImageDetailViewController : UIViewController
@property NSString *imageName;
@property NSArray *pic;
-(void)showDetail:(int)input;

@end

NS_ASSUME_NONNULL_END
