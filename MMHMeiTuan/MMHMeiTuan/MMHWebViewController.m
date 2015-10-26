//
//  MMHWebViewController.m
//  MMHMeiTuan
//
//  Created by 茆明辉 on 15/10/26.
//  Copyright © 2015年 com.nyist. All rights reserved.
//

#import "MMHWebViewController.h"

@interface MMHWebViewController () <UIWebViewDelegate>
{
    UILabel *_titleLabel;
    int _isFirstIn;
    UIActivityIndicatorView *_activityView; //轮播显示器
}

@end

@implementation MMHWebViewController

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.hidesBottomBarWhenPushed = YES; //隐藏TabBar
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    _isFirstIn = 0;
    [self setNav];
    [self initViews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setNav{
    //返回
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(0, 0, 23, 23);
    [backBtn setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(OnBackBtn:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:backBtn];
}

-(void)initViews{
    self.webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT-64)];
    self.webView.delegate = self;
    self.webView.scalesPageToFit = YES; //禁止放大
    [self.view addSubview:self.webView];
    
    NSLog(@"WebView URL:%@",self.urlStr);
    NSString *urlStr = [self.urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:urlStr]];
    [self.webView loadRequest:request];
    
    _activityView = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(SCREENWIDTH/2-15, SCREENHEIGHT/2-15, 30, 30)];
    _activityView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
    _activityView.hidesWhenStopped = YES;   //停止隐藏
    [self.view addSubview:_activityView];
    [self.view bringSubviewToFront:_activityView];
    
}

-(void)OnBackBtn:(UIButton *)sender{
    NSLog(@"_isFirstIn:@%d",_isFirstIn);
    if (_isFirstIn <= 1) {
        [self.navigationController popToRootViewControllerAnimated:YES];
    }else{
        _isFirstIn =  _isFirstIn - 2;
        [self.webView goBack];
    }
}

#pragma mark - UIWebViewDelegate
-(void)webViewDidStartLoad:(UIWebView *)webView{
    NSLog(@"开始加载webView");
}

-(void)webViewDidFinishLoad:(UIWebView *)webView{
    NSLog(@"加载webView完成");
    NSString *theTitle = [webView stringByEvaluatingJavaScriptFromString:@"document.title"];
    self.title = theTitle;
    [_activityView stopAnimating];
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    NSLog(@"加载webview");
}

-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    [_activityView startAnimating];
    _isFirstIn++;
    
    NSLog(@"In:%d",_isFirstIn);
    return YES;
}



@end
