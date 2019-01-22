//
//  ImageDetailViewController.m
//  ImageGalleries
//
//  Created by Yilei Huang on 2019-01-21.
//  Copyright © 2019 Joshua Fanng. All rights reserved.
//

#import "ImageDetailViewController.h"

@interface ImageDetailViewController ()<UIScrollViewDelegate>
@property UIScrollView *scrollView;
@property UIImageView *imageView1;
@property UITapGestureRecognizer *tapGesture;
@end

@implementation ImageDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.pic =@[@"Lighthouse-in-Field.jpg",@"Lighthouse-night",@"Lighthouse-zoomed"];
    // Do any additional setup after loading the view.
    self.scrollView=[[UIScrollView alloc]initWithFrame:self.view.frame];
    [self.view addSubview:self.scrollView];
    
    self.scrollView.pagingEnabled = YES;
    self.scrollView.delegate = self;
    
    self.scrollView.minimumZoomScale = 0.5;
    self.scrollView.maximumZoomScale =3.0;
    
    
    [self createImage];
    [self layOut];
    self.tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(viewTap:)];
    [self.scrollView addGestureRecognizer:self.tapGesture];
    //[self performSelector:@selector(showDetail) withObject:nil afterDelay:5.0];
}
-(void)showDetail:(int)input{
    self.pic =@[@"Lighthouse-in-Field.jpg",@"Lighthouse-night",@"Lighthouse-zoomed"];
    NSString *picPicture = [NSString stringWithFormat:@"%@",self.pic[input]];
    self.imageName = picPicture;
//    self.imageView1.image = [UIImage imageNamed:picPicture];
}

//-(void)viewTap:(UITapGestureRecognizer *)sender{
//    CGPoint oldScale = sender.scale;
//    
//    
//    
//    
//}

-(void)createImage{
//    self.imageView1 = [UIImageView new];
     self.imageView1 =[[UIImageView alloc]initWithImage:[UIImage imageNamed:self.imageName]];
    [self.scrollView addSubview:self.imageView1];
   
    
    self.imageView1.contentMode = UIViewContentModeScaleAspectFill;
   
    
    self.imageView1.clipsToBounds = YES;
   
}
-(void)layOut{
    self.imageView1.translatesAutoresizingMaskIntoConstraints = NO;
    [self.imageView1.topAnchor constraintEqualToAnchor:self.scrollView.topAnchor].active=YES;
    [self.imageView1.bottomAnchor constraintEqualToAnchor:self.scrollView.bottomAnchor].active=YES;
    [self.imageView1.trailingAnchor constraintEqualToAnchor:self.scrollView.trailingAnchor].active =YES;
    [self.imageView1.leadingAnchor constraintEqualToAnchor:self.scrollView.leadingAnchor].active =YES;
}

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return self.imageView1;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
