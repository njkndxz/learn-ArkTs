import { window } from '@kit.ArkUI';

@Entry
@Component
struct Index {

  windowClass?: window.Window
  // 如何解决DevEco预览器上下白色间距问题及实现全屏沉浸式体验, 可以通过调用鸿蒙的API来修复这个问题
  // this.windowClass.setWindowLayoutFullScreen(true) 这段代码会在页面加载时获取最后一个窗口并将其设为全屏模式，从而消除上下白色间距。
  async setFullScreen(flag: boolean) {
    if (!this.windowClass) {
      this.windowClass = await window.getLastWindow(getContext(this))
    }
    this.windowClass.setWindowLayoutFullScreen(flag)
  }

  onPageShow(): void {
    this.setFullScreen(true)
  }

  onPageHide(): void {
    this.setFullScreen(false)
  }

  @State count: number = 0

  build() {
    Column() {
      Column() {
        // 底部菜单
        Row({space: 10}) {
          // 左侧菜单
          Row() {
            Column({space: 5}) {
              Image($r('app.media.ic_dianpu'))
                .width(20)
              Text('店铺')
                .fontSize(10)
                .fontColor('#262626')
            }
            Column({space: 5}) {
              Image($r('app.media.ic_kefu'))
                .width(20)
                .fillColor('#666')
              Text('客服')
                .fontSize(10)
                .fontColor('#262626')
            }
            Column({space: 5}) {
              Image($r('app.media.ic_cart2'))
                .width(20)
                .fillColor('#666')
              Text('购物车')
                .fontSize(10)
                .fontColor('#262626')
            }
          }
          .layoutWeight(1)
          .justifyContent(FlexAlign.SpaceBetween)

          if(this.count > 0) {
            // 右侧按钮 -- 可以购买
            Row({space: 5}) {
              Button('加入购物车')
                .width(105)
                .height(40)
                .backgroundColor('#ffcc00')
                .fontSize(14)
                .fontWeight(600)
              Button('立即购买')
                .width(105)
                .height(40)
                .backgroundColor('#f92c1b')
                .fontSize(14)
                .fontWeight(600)
            }
          }else {
            // 右侧按钮 -- 不能购买
            Row() {
              Button('查看类似商品')
                .width(170)
                .height(40)
                .backgroundColor('#ffcc00')
                .fontSize(14)
                .fontWeight(600)
            }
          }




        }
        .width('100%')
        .height(60)
        .backgroundColor('#f7f7f7')
        .padding({left: 20, right: 10})

        if(this.count <= 0) {
          // 消息提示：库存 <= 0 显示，否则隐藏
          Row() {
            // 左侧
            Row({ space: 5 }){
              Image($r('app.media.ic_lingdang'))
                .width(12)
                .fillColor('#de6a1c')
              Text('该商品暂时没有库存，看看相似商品吧')
                .fontSize(10)
                .fontColor('#de6a1c')
            }
            // 右侧
            Image($r('app.media.ic_shangjiantou'))
              .width(15)
              .padding(3)
              .fillColor('#d0662c')
              .backgroundColor('rgba(0,0,0,0.1)')
              .borderRadius(8)
          }
          .width('100%')
          .height(36)
          .backgroundColor('#fbf9da')
          .position({x: 0, y: '-36'})
          .padding({left: 20, right: 20})
          .justifyContent(FlexAlign.SpaceBetween)
        }


      }
      .position({x:0,y:'100%'})
      .translate({y: '-100%'})
    }
    .width('100%')
    .height('100%')
    .padding({bottom:20})
    .backgroundColor('#f2f2f2')
  }

}