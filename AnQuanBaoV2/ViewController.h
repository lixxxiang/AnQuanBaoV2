//
//  ViewController.h
//  AnQuanBaoV2
//
//  Created by yyfwptz on 2017/6/30.
//  Copyright © 2017年 yyfwptz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <BaiduMapAPI_Map/BMKMapComponent.h>
#import <BaiduMapAPI_Location/BMKLocationComponent.h>
#import <BaiduMapAPI_Utils/BMKUtilsComponent.h>
#import <BaiduMapAPI_Search/BMKSearchComponent.h>
#import "CallPoliceView.h"
#import "CompleteView.h"
#import "ArrangePoliceView.h"
#import "FailedPoliceView.h"

@interface ViewController : UIViewController<BMKGeoCodeSearchDelegate, BMKMapViewDelegate, BMKLocationServiceDelegate, cpDelegate, agDelegate, fDelegate>
{
    BMKMapView *_mapView;
    BMKLocationService *_locService;
}

@property (strong, nonatomic) IBOutlet UIImageView *annotation;
@property (strong, nonatomic) IBOutlet UILabel *annotationLabel;
//@property (strong, nonatomic) IBOutlet UINavigationBar *navigationbar;
@property (strong, nonatomic) IBOutlet UIButton *userBtn;


@end

