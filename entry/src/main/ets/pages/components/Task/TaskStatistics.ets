
@Styles function card() {
  .width('95%')
  .padding(20)
  .borderRadius(15)
  .backgroundColor(Color.White)
  .shadow({ radius: 6, color: '#1F000000', offsetX: 2, offsetY: 4 })
}

@Component
export struct TaskStatistics {

  @Prop finishTask: number
  @Prop totalTask: number

  build() {
    Row() {
      Text('任务进度')
        .fontSize(30)
        .fontWeight(FontWeight.Bold)
      Stack() {
        Progress({
          value: this.finishTask,    // 设置当前进度
          total: this.totalTask,
          type: ProgressType.Ring // 设置进度条的样式为环形刻度样式
        })
          .width(100)
        Row() {
          Text(this.finishTask.toString())
            .fontSize(24)
            .fontColor('#36D')
          Text(' / ' + this.totalTask.toString())
            .fontSize(24)
        }
      }
    }
    .card()
    .margin({top: 5, bottom: 10})
    .justifyContent(FlexAlign.SpaceEvenly)
  }
}