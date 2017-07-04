//
//  ViewController.m
//  AnQuanBaoV2
//
//  Created by yyfwptz on 2017/6/30.
//  Copyright © 2017年 yyfwptz. All rights reserved.
//

#import "ViewController.h"
#import "MyViewController.h"
#import "LoginViewController.h"
@interface ViewController (){
    CallPoliceView *cp;
    CompleteView *complete;
    BMKGeoCodeSearch* _geocodesearch;
    CLLocationDegrees latitude;
    CLLocationDegrees longitude;
    bool isGeoSearch;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [super viewDidLoad];
    _mapView = [[BMKMapView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    [self.view addSubview:_mapView];
    //    CDVViewController *cdvController = [[CDVViewController alloc]init];
    //    [self.navigationController pushViewController:cdvController animated:YES];
    
    _locService = [[BMKLocationService alloc] init];
    _locService.delegate = self;
    _locService.distanceFilter = 10.0f;
    [_locService startUserLocationService];
    _mapView.showsUserLocation = NO;
    _mapView.userTrackingMode = BMKUserTrackingModeNone;
    _mapView.showsUserLocation = YES;
    _mapView.delegate = self;
    
    cp = [[CallPoliceView alloc] initWithFrame:CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 290)];
    cp.frame = CGRectMake(16, [UIScreen mainScreen].bounds.size.height - 145, [UIScreen mainScreen].bounds.size.width - 32, 145);
    cp.delegate = self;
    [self.view addSubview:cp];
    
    complete = [[CompleteView alloc] initWithFrame:CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 290)];
    complete.frame = CGRectMake(16, [UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width - 32, 145);
    [self.view addSubview:complete];
    [complete setHidden:YES];
    //    NSDictionary *views = NSDictionaryOfVariableBindings(cp);
    //    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[cp]-|"options:0metrics:nilviews:views]];
    
    
    //    [self isAnswered];
    
    
//        _geocodesearch = [[BMKGeoCodeSearch alloc]init];
    
    
    BMKLocationViewDisplayParam *displayParam = [[BMKLocationViewDisplayParam alloc] init];
    displayParam.locationViewOffsetX = 0;
    displayParam.locationViewOffsetY = 0;
    displayParam.isAccuracyCircleShow = NO;
    displayParam.locationViewImgName = @"location";
    [_mapView updateLocationViewWithParam:displayParam];
    
    
    [_annotation setImage:[UIImage imageNamed:@"annotation"]];
    [self.view addSubview:_annotation];

    _annotationLabel.text = @"我当前的位置";
//    _annotationLabel.font = [UIFont fontWithName:@"" size:14];
    [self.view addSubview:_annotationLabel];
    _mapView.scrollEnabled = NO;
    /////////////////////
    //navigationbar 还没做
    /////////////////////
    CGFloat navBarHeight = 64.0f;
    CGRect frame = CGRectMake(0.0f, 0.0f, [UIScreen mainScreen].bounds.size.width, navBarHeight);
    [_navigationbar setFrame:frame];
//    [_navigationbar setTag:@"安全宝"];
    [self.view addSubview:_navigationbar];
    
    
    UIImage *selectedImage=[UIImage imageNamed: @"user1"];
    selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc]initWithImage:selectedImage style:UIBarButtonItemStylePlain target:self action:@selector(mine:)];
    UINavigationItem *item = [[UINavigationItem alloc] initWithTitle:@"安全宝"];
    item.leftBarButtonItem = rightButton;
    item.hidesBackButton = YES;
    rightButton.tintColor=[UIColor redColor];
    [_navigationbar pushNavigationItem:item animated:NO];
    [self.view addSubview:_navigationbar];
//    [_hidebutton addTarget:self action:@selector(mine:) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:_hidebutton];
    
}

-(void)mine:(id)sender{
    MyViewController *vc = [MyViewController alloc];
//    [self presentViewController:vc animated:YES completion:nil];
    LoginViewController *lvc = [LoginViewController alloc];
    [self presentViewController:lvc animated:YES completion:nil];
}

-(void)slideUp {
    [UIView beginAnimations:@"" context:nil];
    [UIView setAnimationDuration:0.2];
    [UIView setAnimationDelegate:self];
    complete.frame= CGRectMake(16, [UIScreen mainScreen].bounds.size.height - 145, [UIScreen mainScreen].bounds.size.width - 32, 145);
    [UIView commitAnimations];
}

-(void)slideDown{
    [UIView beginAnimations:@"" context:nil];
    [UIView setAnimationDuration:0.2];
    [UIView setAnimationDelegate:self];
    cp.frame= CGRectMake(16, [UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width - 32, 145);
    [UIView commitAnimations];
}

- (id)getClassObjectFromNib:(Class)class
{
    NSString *nibName = NSStringFromClass(class);
    NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:nibName owner:nil options:nil];
    for (id anObject in topLevelObjects){
        if([anObject isKindOfClass:class]){
            return anObject;
        }
    }
    
    return nil;
}

- (CallPoliceView *)cpView
{
    if (cp == nil) {
        cp = [self getClassObjectFromNib:[CallPoliceView class]];
    }
    return cp;
}

- (void)mapView:(BMKMapView *)mapView regionDidChangeAnimated:(BOOL)animated {
    CLLocationCoordinate2D centerCoordinate = mapView.region.center;
    isGeoSearch = false;
    CLLocationCoordinate2D pt = (CLLocationCoordinate2D){0, 0};
    NSLog(@"sd:%f", centerCoordinate.latitude);
    pt = (CLLocationCoordinate2D){centerCoordinate.latitude, centerCoordinate.longitude};
    BMKReverseGeoCodeOption *reverseGeocodeSearchOption = [[BMKReverseGeoCodeOption alloc]init];
    reverseGeocodeSearchOption.reverseGeoPoint = pt;
    BOOL flag = [_geocodesearch reverseGeoCode:reverseGeocodeSearchOption];
    if(flag)
    {
        NSLog(@"反geo检索发送成功");
    }
    else
    {
        NSLog(@"反geo检索发送失败");
    }
    
}


-(void) onGetReverseGeoCodeResult:(BMKGeoCodeSearch *)searcher result:(BMKReverseGeoCodeResult *)result errorCode:(BMKSearchErrorCode)error
{
    NSArray* array = [NSArray arrayWithArray:_mapView.annotations];
    [_mapView removeAnnotations:array];
    array = [NSArray arrayWithArray:_mapView.overlays];
    [_mapView removeOverlays:array];
    if (error == 0) {
        BMKPointAnnotation* item = [[BMKPointAnnotation alloc]init];
        //        item.coordinate = result.location;
        //        item.title = result.address;
        //        [_mapView addAnnotation:item];
        _mapView.centerCoordinate = result.location;
        NSString* titleStr;
        NSString* showmeg;
        titleStr = @"反向地理编码";
        showmeg = [NSString stringWithFormat:@"%@",result.poiList];
        NSLog(@"showmsg:%@",showmeg);
    }
}


-(void)callPolice{
    //post crime scene location
    
    NSURL *url = [NSURL URLWithString:@"http://10.10.90.39:3000/location"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:0 timeoutInterval:2.0f];
    request.HTTPMethod = @"POST";
    NSString *la = [@"distance=100&lat=" stringByAppendingString:[NSString stringWithFormat:@"%lf",latitude]];
    NSString *lo = [@"&lon=" stringByAppendingString:[NSString stringWithFormat:@"%lf",longitude]];
    request.HTTPBody = [[la stringByAppendingString:lo] dataUsingEncoding:NSUTF8StringEncoding];
    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"crime scene location:%@",[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
    }] resume];
    [self slideDown];
    int64_t delayInSeconds = 0.5;      // 延迟的时间
    /*
     *@parameter 1,时间参照，从此刻开始计时
     *@parameter 2,延时多久，此处为秒级，还有纳秒等。10ull * NSEC_PER_MSEC
     */
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        // do something
        [complete setHidden:NO];
        [self slideUp];
        _annotationLabel.textAlignment = UITextAlignmentCenter;
        _annotationLabel.text = @"已安排警力";
    });
    
    
}

- (void)didUpdateBMKUserLocation:(BMKUserLocation *)userLocation
{
    
    NSLog(@"didUpdateUserLocation lat %f,long %f",userLocation.location.coordinate.latitude,userLocation.location.coordinate.longitude);
    latitude = userLocation.location.coordinate.latitude;
    longitude = userLocation.location.coordinate.longitude;
    [_mapView updateLocationData:userLocation];
    _mapView.centerCoordinate = userLocation.location.coordinate;
    [_mapView setZoomLevel:17];
    [_locService stopUserLocationService];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void)viewWillAppear:(BOOL)animated {
    [_mapView viewWillAppear];
    _mapView.delegate = self; // 此处记得不用的时候需要置nil，否则影响内存的释放
    _locService.delegate = self;
    _geocodesearch.delegate = self;
}

-(void)viewWillDisappear:(BOOL)animated {
    [_mapView viewWillDisappear];
    _mapView.delegate = nil; // 不用时，置nil
    _locService.delegate = nil;
    _geocodesearch.delegate = nil;
}

- (void)didUpdateUserHeading:(BMKUserLocation *)userLocation {
    [_mapView updateLocationData:userLocation];
    
}

- (void)dealloc {
    if (_mapView) {
        _mapView = nil;
    }
    if (_geocodesearch != nil) {
        _geocodesearch = nil;
    }
    
}


@end
