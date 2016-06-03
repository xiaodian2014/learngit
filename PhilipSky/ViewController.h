//
//  ViewController.h
//  PhilipSky
//
//  Created by herry on 28/05/2016.
//  Copyright © 2016 herry. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>


@interface ViewController : UIViewController<WKNavigationDelegate, WKUIDelegate>{
    UIActivityIndicatorView *active;
}


@end

