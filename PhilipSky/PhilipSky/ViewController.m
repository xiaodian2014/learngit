//
//  ViewController.m
//  PhilipSky
//
//  Created by herry on 28/05/2016.
//  Copyright © 2016 herry. All rights reserved.
//

#import "ViewController.h"

//获取屏幕尺寸
#define SCREENWIDTH [UIScreen mainScreen].bounds.size.width
#define SCREENHEIGHT [UIScreen mainScreen].bounds.size.height

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor blackColor];
    
    
    WKWebView *web = [[WKWebView alloc] initWithFrame:CGRectMake(0,0, SCREENWIDTH, SCREENHEIGHT)];
    web.UIDelegate = self;
    web.navigationDelegate = self;
    [self.view addSubview:web];
    
    [web loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.365ftx.com"]]];
    
    
    
    active=[[UIActivityIndicatorView alloc]initWithFrame:CGRectMake((SCREENWIDTH-80)/2,(SCREENHEIGHT-80)/2, 80, 80)];
    active.activityIndicatorViewStyle=UIActivityIndicatorViewStyleWhiteLarge;
    active.backgroundColor = [UIColor colorWithWhite:0 alpha:0.8];
    active.layer.cornerRadius = 5;
    active.color=[UIColor whiteColor];
    [self.view addSubview:active];
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}


#pragma mark - WKNavigationDelegate

- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation {
    [active startAnimating];
}

- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation {
    
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    [active stopAnimating];
}

- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation withError:(NSError *)error {
    NSLog(@"%@",error);
}

// 从web界面中接收到一个脚本时调用
- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message {
    
    NSLog(@"%@", message);
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
