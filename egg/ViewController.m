//
//  ViewController.m
//  egg
//
//  Created by USER on 2015/03/07.
//  Copyright (c) 2015年 USER. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    int count;
    UILabel *mylbl;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //初期化
    count = 100000;
    
    //eggという画像ファイルでイメージビューを初期化してimageViewという名前で作成します。
    UIImageView *imageView =
    [[UIImageView alloc]
     initWithImage:
     [UIImage imageNamed:@"egg1"]];
    //imageViewの枠の大きさを定義します。
    imageView.frame = CGRectMake(0, 0, 180, 200);
    //imageViewの中心位置を定義します（画面中心より下方向に100ピクセル下げる)
    imageView.center = CGPointMake(self.view.center.x, self.view.center.y + 100);
    //縮小
    imageView.transform = CGAffineTransformMakeScale(0.8, 0.8);
    
    
    imageView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGesture =
    [[UITapGestureRecognizer alloc]
     initWithTarget:self
     action:@selector(tappedImage:)];
    [imageView addGestureRecognizer:tapGesture];
    
    //imageViewをビューに貼り付けます。
    [self.view addSubview:imageView];

    
    
    
    
    
    //文字を表示するラベルUILabelのlbl変数を作成して、初期化します。
    mylbl = [[UILabel alloc]init];
    //lblの枠の大きさを定義します。
    mylbl.frame = CGRectMake(0, 0, 200, 100);
    //lblの枠の中心位置を
    mylbl.center = self.view.center;
    //lbl枠内のテキストの相対位置を定義します（中心）
    mylbl.textAlignment = NSTextAlignmentCenter;
    //lblのテキストの文字の大きさを定義します。
    mylbl.font = [UIFont systemFontOfSize:34.f];
    //lblのテキストの内容を定義します。
    mylbl.text = @"";
    //lblのテキストの色を定義します。
    [mylbl setTextColor:[UIColor blackColor]];
    //lblをビューに貼り付けます。
    [self.view addSubview:mylbl];
    
    
//    // 変換対象のNSNumber
//    NSNumber *number = [NSNumber stringWithFormat : @"%d",count];
//    // NSNumberFormatterを生成
//    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
//    // NSNumberを3桁区切りに変換
//    formatter.numberStyle = NSNumberFormatterDecimalStyle;
//    NSString *formattedNumber = [formatter stringFromNumber:number];
    
    
    NSNumberFormatter *formatter =
    [[NSNumberFormatter alloc]init];
    NSString *groupingSeparator =
    [[NSLocale currentLocale]
     objectForKey:NSLocaleGroupingSeparator];
    [formatter setGroupingSeparator:groupingSeparator];
    //3桁ずつ何かする
    [formatter setGroupingSize:3];
    //小数点を入れない
    [formatter setAlwaysShowsDecimalSeparator:NO];
    //カンマ区切りを入れる
    [formatter setUsesGroupingSeparator:YES];
    NSString *formattedString =
    [formatter stringFromNumber:
     [NSNumber numberWithInteger:count]];
    
    
    //文字の装飾
//    NSString *str = [NSString stringWithFormat : @"%d",count];
    NSString *str = formattedString;
    NSMutableAttributedString *attrStr;
    attrStr = [[NSMutableAttributedString alloc] initWithString:str];
    // フォント
    [attrStr addAttribute:NSFontAttributeName
                    value:[UIFont fontWithName:@"DBLCDTempBlack" size:35.]
                    range:NSMakeRange(0, [attrStr length])];
    
//    インスタンス.font = [UIFont fontWithName:@”フォント名” size:20];
    
    // NSShadowオブジェクト
    NSShadow *shadow = [[NSShadow alloc] init];
    [shadow setShadowColor:[UIColor colorWithRed:0. green:0. blue:0. alpha:1.]];
    [shadow setShadowBlurRadius:4.0];
    [shadow setShadowOffset:CGSizeMake(2, 2)];
    
    // 影
    [attrStr addAttribute:NSShadowAttributeName
                    value:shadow
                    range:NSMakeRange(0, [attrStr length])];
    
    // 文字色
    [attrStr addAttribute:NSForegroundColorAttributeName
                    value:[UIColor colorWithRed:12. green:0. blue:20. alpha:1.0]
                    range:NSMakeRange(0, [attrStr length])];
    [mylbl setAttributedText:attrStr];
    
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





-(void)tappedImage:(id)sender{
    NSLog(@"たまごがタップされました");
    
    [self moveToLeft:(id)sender];
    [self vibration:(id)sender];
    
    
    count--;
    
    
    if(count == 0)
    {
        
        // 削除する
        for (UIView *view in [self.view subviews])
        {
           [view removeFromSuperview];
         }
        
        //eggという画像ファイルでイメージビューを初期化してimageViewという名前で作成します。
        UIImageView *imageView =
        [[UIImageView alloc]
         initWithImage:
         [UIImage imageNamed:@"hiyoko.png"]];
        //imageViewの枠の大きさを定義します。
        imageView.frame = CGRectMake(0, 0, 180, 200);
        //imageViewの中心位置を定義します（画面中心より下方向に100ピクセル下げる)
        imageView.center = CGPointMake(self.view.center.x, self.view.center.y + 100);
        //縮小
        imageView.transform = CGAffineTransformMakeScale(0.8, 0.8);
        
        
        imageView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tapGesture =
        [[UITapGestureRecognizer alloc]
         initWithTarget:self
         action:@selector(tappedImage:)];
        [imageView addGestureRecognizer:tapGesture];
        
        //imageViewをビューに貼り付けます。
        [self.view addSubview:imageView];
    
    
    
    
    }
    
    NSNumberFormatter *formatter =
    [[NSNumberFormatter alloc]init];
    NSString *groupingSeparator =
    [[NSLocale currentLocale]
     objectForKey:NSLocaleGroupingSeparator];
    [formatter setGroupingSeparator:groupingSeparator];
    //3桁ずつ何かする
    [formatter setGroupingSize:3];
    //小数点を入れない
    [formatter setAlwaysShowsDecimalSeparator:NO];
    //カンマ区切りを入れる
    [formatter setUsesGroupingSeparator:YES];
    NSString *formattedString =
    [formatter stringFromNumber:
     [NSNumber numberWithInteger:count]];
    
    
    
    //文字の装飾
    NSString *str = formattedString;
    NSMutableAttributedString *attrStr;
    attrStr = [[NSMutableAttributedString alloc] initWithString:str];
    // フォント
    [attrStr addAttribute:NSFontAttributeName
                    value:[UIFont fontWithName:@"DBLCDTempBlack" size:35.]
                    range:NSMakeRange(0, [attrStr length])];
    
   
    // NSShadowオブジェクト
    NSShadow *shadow = [[NSShadow alloc] init];
    [shadow setShadowColor:[UIColor colorWithRed:0. green:0. blue:0. alpha:1.]];
    [shadow setShadowBlurRadius:4.0];
    [shadow setShadowOffset:CGSizeMake(2, 2)];
    
    // 影
    [attrStr addAttribute:NSShadowAttributeName
                    value:shadow
                    range:NSMakeRange(0, [attrStr length])];
    
    // 文字色
    [attrStr addAttribute:NSForegroundColorAttributeName
                    value:[UIColor colorWithRed:12. green:0. blue:20. alpha:1.0]
                    range:NSMakeRange(0, [attrStr length])];
    
    [mylbl setAttributedText:attrStr];
        
    
}




-(void)vibration:(id)sender{
    
    if(count > 0)
    {
        
        UITapGestureRecognizer *tapGesture = (UITapGestureRecognizer *)sender;
        //タップされた画像変数を取得します。
        UIImageView *imv = (UIImageView *)tapGesture.view;
        //中心位置を取得します。
        CGPoint pntCenter = imv.center;
        
        //positionというアニメーションを定義します。
        CABasicAnimation *animation =
        [CABasicAnimation animationWithKeyPath:@"position"];
        //アニメーション時間を0.05秒に設定します。
        [animation setDuration:0.05];
        //アニメーションを４回繰り返します。
        [animation setRepeatCount:4];
        //アニメーションが終わったら元に戻る設定をします。
        [animation setAutoreverses:YES];
        //アニメーションの開始位置を設定します。
        [animation setFromValue:[NSValue valueWithCGPoint:
                                 CGPointMake(pntCenter.x - 30.0f, pntCenter.y)]];
        //アニメーションの終了位置を設定します。
        [animation setToValue:[NSValue valueWithCGPoint:
                               CGPointMake(pntCenter.x + 30.0f, pntCenter.y)]];
        //画像変数にアニメーションを適用します。
        [[imv layer] addAnimation:animation forKey:@"position"];
    }
}


-(void)moveToLeft:(id)sender{
    
    if(count > 0)
    {
        
        UITapGestureRecognizer *tapGesture = (UITapGestureRecognizer *)sender;
        //タップされた画像変数を取得します。
        UIImageView *imv = (UIImageView *)tapGesture.view;
        //中心位置を取得します。
        CGPoint pntCenter = imv.center;
        //アニメーションの実行
        [UIView
         animateWithDuration:.2f//0.2秒間隔で実行する
         animations:^{
             //右に10px移動させます。
             imv.center =
             CGPointMake(pntCenter.x + 10, pntCenter.y);
             
             // 画像を2倍に拡大
             imv.transform = CGAffineTransformMakeScale(1.2, 1.2);
         }
         
         completion:^(BOOL isFinished){
             if(isFinished){
                 //完了したら中心位置に戻します
                 imv.center = pntCenter;
                 imv.transform = CGAffineTransformMakeScale(0.8, 0.8);
             }
         }];
        
    }
}


@end
