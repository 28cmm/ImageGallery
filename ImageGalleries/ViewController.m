//
//  ViewController.m
//  ImageGalleries
//
//  Created by Yilei Huang on 2019-01-21.
//  Copyright © 2019 Joshua Fanng. All rights reserved.
//

#import "ViewController.h"
#import "ImageDetailViewController.h"
@interface ViewController ()<UIScrollViewDelegate>
@property UIScrollView *scrollView;
@property UITapGestureRecognizer *tapGesture;
@property UIImageView *imageView1;
@property UIImageView *imageView2;
@property UIImageView *imageView3;
@property UIPageControl *pageControl;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.scrollView=[[UIScrollView alloc]initWithFrame:self.view.frame];
    [self.view addSubview:self.scrollView];
    
    
    
    
    self.scrollView.pagingEnabled = YES;
    self.scrollView.delegate = self;
    
    [self createImage];
    [self layOut];
    self.pageControl =[UIPageControl new];
    self.pageControl.frame = self.view.frame;
    //self.pageControl.currentPage=0;
    self.pageControl.numberOfPages=3;
    [self.scrollView addSubview:self.pageControl];

    
    self.tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(viewTap:)];
    [self.scrollView addGestureRecognizer:self.tapGesture];
}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    int page = scrollView.contentOffset.x/self.scrollView.frame.size.width;
    self.pageControl.currentPage = page;
    
}
-(void)viewTap:(UITapGestureRecognizer*)sender{
    if(sender.state == UIGestureRecognizerStateEnded){
       // ImageDetailViewController *imageDetail = [ImageDetailViewController new];
//        imageDetail.imageName =
        
    
        [self performSegueWithIdentifier:@"showDetail" sender:self];
        
    }
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UITapGestureRecognizer*)sender{
    ImageDetailViewController *detail =  segue.destinationViewController;
    int side = self.scrollView.contentOffset.x / self.scrollView.frame.size.width;
    NSLog(@"%i",side);
    [detail showDetail:side];
    
}

-(void)createImage{
    self.imageView1 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Lighthouse-in-Field.jpg"]];
    self.imageView2 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Lighthouse-night"]];
    self.imageView3 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Lighthouse-zoomed"]];
    [self.scrollView addSubview:self.imageView1];
    [self.scrollView addSubview:self.imageView2];
    [self.scrollView addSubview:self.imageView3];
    
    self.imageView1.contentMode = UIViewContentModeScaleAspectFill;
    self.imageView2.contentMode = UIViewContentModeScaleAspectFill;
    self.imageView3.contentMode = UIViewContentModeScaleAspectFill;
    
    self.imageView1.clipsToBounds = YES;
     self.imageView2.clipsToBounds = YES;
     self.imageView3.clipsToBounds = YES;
}

-(void)layOut{
    self.imageView1.translatesAutoresizingMaskIntoConstraints = NO;
    self.imageView2.translatesAutoresizingMaskIntoConstraints = NO;
    self.imageView3.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.imageView1.topAnchor constraintEqualToAnchor:self.scrollView.topAnchor].active=YES;
    [self.imageView2.topAnchor constraintEqualToAnchor:self.scrollView.topAnchor].active=YES;
    [self.imageView3.topAnchor constraintEqualToAnchor:self.scrollView.topAnchor].active=YES;
    [self.imageView1.bottomAnchor constraintEqualToAnchor:self.scrollView.bottomAnchor].active=YES;
    [self.imageView2.bottomAnchor constraintEqualToAnchor:self.scrollView.bottomAnchor].active=YES;
    [self.imageView3.bottomAnchor constraintEqualToAnchor:self.scrollView.bottomAnchor].active=YES;
    
    [self.imageView1.leadingAnchor constraintEqualToAnchor:self.scrollView.leadingAnchor].active=YES;
    [self.imageView3.trailingAnchor constraintEqualToAnchor:self.scrollView.trailingAnchor].active=YES;
    
    [self.imageView2.leadingAnchor constraintEqualToAnchor:self.imageView1.trailingAnchor].active=YES;
    [self.imageView2.trailingAnchor constraintEqualToAnchor:self.imageView3.leadingAnchor].active=YES;
    
    [self.imageView1.heightAnchor constraintEqualToAnchor:self.view.heightAnchor].active=YES;
    [self.imageView2.heightAnchor constraintEqualToAnchor:self.view.heightAnchor].active=YES;
    [self.imageView3.heightAnchor constraintEqualToAnchor:self.view.heightAnchor].active=YES;
    
    [self.imageView1.widthAnchor constraintEqualToAnchor:self.view.widthAnchor].active=YES;
    [self.imageView2.widthAnchor constraintEqualToAnchor:self.view.widthAnchor].active=YES;
    [self.imageView3.widthAnchor constraintEqualToAnchor:self.view.widthAnchor].active=YES;
}
    
    // Do any additional setup after loading the view, typically from a nib.



@end
