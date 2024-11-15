import { window } from '@kit.ArkUI';


interface ImageCount {
  url: string
  count: number
}

interface MaskObj {
  opacity: number
  zIndex: number
}

interface MaskImg {
  x: number
  y: number
}

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

  @State images: ImageCount[] = this.initImages()

  initImages() {
    const arr: ImageCount[] = []
    for (let i = 0; i < 6; i++) {
      const obj: ImageCount = {
        url: `app.media.bg_0${i}`,
        count: 1
      }
      arr.push(obj)
    }
    return arr
  }

  // 控制遮罩的显隐
  @State maskObj: MaskObj = {
    opacity: 0,
    zIndex: -1
  }

  //控制图片缩放
  @State maskImg: MaskImg = {
    x: 0,
    y: 0
  }

  // 随机序号
  @State randomIndex: number = -1

  // 控制大奖遮罩
  @State isGet: boolean = false



  build() {
    Stack() {
      // 初始化布局
      Column() {
        // Grid布局
        Grid() {
          ForEach(this.images, (item: ImageCount, index: number) => {
            GridItem() {
              //角标组件
              Badge({
                count: item.count,
                position: BadgePosition.RightTop,
                style: {
                  badgeSize: 16,
                  fontSize: 12,
                  badgeColor: Color.Red
                }
              }) {
                Image($r(item.url))
                  .width(80)
              }
            }
          })
        }
        .columnsTemplate('1fr 1fr 1fr')
        .rowsTemplate('1fr 1fr')
        // 控制间距
        .columnsGap(5)
        .rowsGap(5)
        .width('100%')
        .height(300)
        .margin({
          top: 100
        })

        Button('立即抽卡')
          .width(200)
          .backgroundColor('#fff560bc')
          .margin({
            top: 50
          })
          .onClick(() => {
            // 每次收完卡片，需要进行简单的检索，判断是否集齐
            this.isGet = !this.images.find((item: ImageCount) => (item.count === 0))
            // 利用Math.random获取 [0, 6) 随机数 范围就是0-5
            this.randomIndex = Math.floor(Math.random() * 6)
            // 点击时修改遮罩参数
            this.maskObj = {
              opacity: 1,
              zIndex: 99
            }
            // 点击时图片缩放
            this.maskImg = {
              x: 1,
              y: 1
            }
          })
      }
      .width('100%')
      .height('100%')
      .padding(10)

      // 抽卡遮罩层
      Column({ space: 30 }) {
        Text(this.isGet ? '恭喜获得大奖' : '获得生肖卡')
          .fontColor('#f5ebcf')
          .fontSize(25)
          .fontWeight(FontWeight.Bold)

        Image($r(this.isGet ? 'app.media.position_moco' : `app.media.img_0${this.randomIndex}`))
          .width(200)
            //控制元素缩放
          .scale(this.maskImg)
          .animation({
            duration: 500
          })

        Button(this.isGet ? '再来一次' : '开心收下')
          .width(200)
          .height(50)
          .backgroundColor(Color.Transparent)
          .border({
            width: 2,
            color: '#fff9e0'
          })
          .onClick(() => {
            // 控制遮罩隐藏
            this.maskObj = {
              opacity: 0,
              zIndex: -1
            }
            // 点击时图片缩放
            this.maskImg = {
              x: 0,
              y: 0
            }

            if(this.isGet) {
              this.images = this.initImages()
              this.isGet = false
              return
            }

            // 收下卡片放在对应的地方，对象数组的情况需要更新，需要修改替换整个对象
            this.images[this.randomIndex] = {
              url: `app.media.img_0${this.randomIndex}`,
              count: this.images[this.randomIndex].count + 1
            }
          })
      }
      .justifyContent(FlexAlign.Center)
      .width('100%')
      .height('100%')
      .backgroundColor('#cc000000')
      // 设置透明度
      .opacity(this.maskObj.opacity)
      .zIndex(this.maskObj.zIndex)
      // 动画，当元素有状态改变可以添加动画
      .animation({
        duration: 200
      })


      if(this.isGet) {
        // 抽大奖遮罩层
        Column({ space: 30 }) {
          Text('恭喜获得手机一部')
            .fontColor('#f5ebcf')
            .fontSize(25)
            .fontWeight(FontWeight.Bold)

          Image($r('app.media.position_moco'))
            .width(200)
              //控制元素缩放
            .scale(this.maskImg)
            .animation({
              duration: 500
            })

          Button('再来一次')
            .width(200)
            .height(50)
            .backgroundColor(Color.Transparent)
            .border({
              width: 2,
              color: '#fff9e0'
            })
            .onClick(() => {
              // 控制遮罩隐藏
              this.maskObj = {
                opacity: 0,
                zIndex: -1
              }
              // 点击时图片缩放
              this.maskImg = {
                x: 0,
                y: 0
              }
            })
        }
        .justifyContent(FlexAlign.Center)
        .width('100%')
        .height('100%')
        .backgroundColor('#cc000000')
        // 设置透明度
        .opacity(this.maskObj.opacity)
        .zIndex(this.maskObj.zIndex)
        // 动画，当元素有状态改变可以添加动画
        .animation({
          duration: 200
        })
      }

    }
  }

}