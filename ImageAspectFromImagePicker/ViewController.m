//
//  ViewController.m
//  ImageAspectFromImagePicker
//
//  Created by Reinier Melian on 07/06/2017.
//  Copyright © 2017 Reinier Melian. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UINavigationControllerDelegate,UIImagePickerControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imageProfile;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageConstraintHeigth;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (IBAction)selectImage:(id)sender {
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:picker animated:YES completion:NULL];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(nullable NSDictionary<NSString *,id> *)editingInfo{
    
    float aspectRatio = image.size.height/image.size.width;
    self.imageProfile.contentMode = UIViewContentModeScaleAspectFit;
    self.imageProfile.image = image;
    //this if you need adjust heigth according to width
    [self.imageConstraintHeigth setConstant: self.imageProfile.frame.size.width * aspectRatio];

    [picker dismissViewControllerAnimated:YES completion:nil];
}


@end
