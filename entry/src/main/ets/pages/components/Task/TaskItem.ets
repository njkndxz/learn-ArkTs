import { TaskInfo } from "../../../viewModel/TaskInfo"


@Styles function card() {
  .width('95%')
  .padding(20)
  .borderRadius(15)
  .backgroundColor(Color.White)
  .shadow({ radius: 6, color: '#1F000000', offsetX: 2, offsetY: 4 })
}

@Extend(Text) function finishText() {
  .decoration({
    type: TextDecorationType.LineThrough
  })
  .fontColor('#B1B2B1')
}

@Component
export struct TaskItem {

  @ObjectLink item: TaskInfo
  @Prop handleUpdate: (id: number, finished: boolean) => void



  build() {
    Row() {
      if(this.item.finished) {
        Text(this.item.name)
          .finishText()
      }else {
        Text(this.item.name)
      }
      Checkbox()
        .select(this.item.finished)
        .onChange((val) => {
          this.handleUpdate(this.item.id, val)
          this.item.finished = val
        })
    }
    .card()
    .justifyContent(FlexAlign.SpaceBetween)
  }
}