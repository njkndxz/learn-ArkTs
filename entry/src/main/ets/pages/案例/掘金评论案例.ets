import { window } from '@kit.ArkUI'
import font from '@ohos.font'
import InfoTop from '../components/InfoTop'
import InfoContent from '../components/InfoContent'
import InfoBottom from '../components/InfoBottom'
import { CommentData, createListRange } from '../modal/CommentData'

@Entry
@Component
struct Index {

  // 一加载页面就注册font
  aboutToAppear(): void {
    // 会在组件加载时自动调用执行(生命周期函数)
    // 注册字体
    font.registerFont({
      familyName: 'myFont',
      familySrc: '/fonts/iconfont.ttf'
    })
    // 默认排序
    this.handleSort(0)
  }

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

  @State commentList: CommentData[] = createListRange()
  // 提交评论
  handleSubmit(content: string) {
    const newItem: CommentData = new CommentData(
      `https://fastly.picsum.photos/id/770/600/600.jpg?hmac=tuK9EHg1ifTU3xKAiZj2nHSdWy4mk7enhylgOc2BW7E`,
      "我",
      new Date().getTime(),
      6 ,
      0,
      content,
      false
    )
    this.commentList = [newItem, ...this.commentList]
  }

  // 排序
  handleSort(type: number) {
    this.commentList.sort((a, b) => (type === 0 ? b.time - a.time : b.likeNum - a.likeNum))
  }

  build() {
    Column(){
      InfoTop({
        onSortComment: (type: number): void => this.handleSort(type)
      })
      InfoContent({
        commentList: this.commentList
      })
      InfoBottom({
        onSubmitComment: (content: string): void => this.handleSubmit(content)
      })
    }
    .width('100%')
    .padding(10)
  }
}