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

  // 组件内的状态变量
  @State count: number = 1
  @State oldPrice: number = 40.4
  @State newPrice: number = 10.4

  build() {
    Column() {
      Column() {
        // 产品
        Row({ space: 10}){
          // 图片
          Image($r('app.media.product1'))
            .width(100)
            .borderRadius(8)
          // 文字
          Column({space: 10}) {
            Column({ space: 6}) {
              Text('冲销量1000ml缤纷八果水果捞')
                .lineHeight(20)
                .fontSize(14)
              Text('含1份折扣商品')
                .fontSize(12)
                .fontColor('#7f7f7f')
            }
            .width('100%')
            .alignItems(HorizontalAlign.Start)
            Row(){
              // 价格
              Row({ space: 5}) {
                Text() {
                  Span('￥')
                    .fontSize(14)
                  Span(this.newPrice.toFixed(2))
                    .fontSize(18)
                }
                .fontColor('#ff4000')
                Text() {
                  Span('￥')
                  Span(this.oldPrice.toFixed(2))
                }
                .fontSize(14)
                .fontColor('#999')
                .decoration({type: TextDecorationType.LineThrough, color: '#999'})
              }
              // 加减
              Row() {
                Text('-')
                  .width(22)
                  .height(22)
                  .border({width:1, color: '#e1e1e1', radius: {topLeft: 5, bottomLeft: 5}})
                  .textAlign(TextAlign.Center)
                  .fontWeight(700)
                  .onClick(() => {
                    if(this.count === 0) {
                      return
                    }
                    this.count--
                  })
                Text(this.count.toString())
                  .height(22)
                  .border({width: { top:1, bottom: 1 }, color: '#e1e1e1'})
                  .padding({left: 10, right: 10})
                  .fontSize(14)
                Text('+')
                  .width(22)
                  .height(22)
                  .border({width:1, color: '#e1e1e1', radius: {topRight: 5, bottomRight: 5}})
                  .textAlign(TextAlign.Center)
                  .fontWeight(700)
                  .onClick(() => {
                    this.count++
                  })
              }
            }
            .width('100%')
            .justifyContent(FlexAlign.SpaceBetween)
          }
          .height(75)
          .layoutWeight(1)
          .justifyContent(FlexAlign.SpaceBetween)
        }
        .width('100%')
        .alignItems(VerticalAlign.Top)
        .padding(20)

        // 结算
        Row({ space: 10 }){
          // 价格
          Column({space: 5}) {
            Text() {
              Span(`已选 ${this.count} 件，`)
                .fontColor('#848484')
              Span('合计:')
              Span('￥')
                .fontColor('#fd4104')
              Span((this.count * this.newPrice).toFixed(2))
                .fontColor('#fd4104')
                .fontSize(16)
            }
            .fontSize(14)
            Text('共减￥' + (this.count * (this.oldPrice - this.newPrice)).toFixed(2))
              .fontColor('#fd4104')
              .fontSize(12)
          }
          .alignItems(HorizontalAlign.End)
          // 结算按钮
          Button('结算外卖')
            .width(110)
            .height(40)
            .backgroundColor('#fed70e')
            .fontColor('#564200')
            .fontSize(16)
            .fontWeight(600)
        }
        .width('100%')
        .height(70)
        .backgroundColor('#fff')
        .position({x:0, y: '100%'})
        .translate({y: '-100%'})
        .padding({ left: 20, right: 20 })
        .justifyContent(FlexAlign.End)
      }
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#f3f3f3')
  }

}