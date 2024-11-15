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

  titles: string[] = [
    '首页','关注','热门','军事','体育',
    '八卦','数码','财经','美食','旅行'
  ]

  build() {
    Column({ space: 10 }) {
      // 外层顶级容器，使用参数调整位置
      Tabs({ barPosition: BarPosition.End }) {
        ForEach(this.titles, (item: string, index) => {
          // 内容区,只能有一个子组件
          TabContent() {
            Text(`${item}内容`)
          }
          // 配置导航
          .tabBar(item)
        })
      }
      // 设置滚动导航
      .barMode(BarMode.Scrollable)
      // 调整导航水平或垂直
      .vertical(false)
      // 是否允许滑动屏幕切换
      .scrollable(true)
      // 切换动画时间
      .animationDuration(300)


    }
    .padding(10)
  }

}