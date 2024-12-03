import { TaskInfo } from "../../../viewModel/TaskInfo"
import { TaskItem } from "./TaskItem"
import { promptAction } from "@kit.ArkUI"
import TaskModel from "../../../model/TaskModel"


// 自定义对话框
@CustomDialog
struct AddDialog {

  controller: CustomDialogController = {
    open: (): void => {},
    close: (): void => {}
  }
  // 函数要加private
  private cancel: () => void = () => {}
  private confirm: (name: string) => void = () => {}
  name: string = ''

  build() {
    Column({space: 20}) {
      TextInput({ placeholder: '请输入任务' })
        .onChange((val) => {
          this.name = val
        })
      Row() {
        Button('确认')
          .onClick(() => {
            if(this.name.trim() === '') {
              promptAction.showToast({
                message: '请输入任务名',
                duration: 3000,
                bottom: 300
              })
              return
            }
            this.controller?.close()
            this.confirm(this.name)
          })

        Button('取消')
          .onClick(() => {
            this.controller?.close()
            this.cancel()
          })
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceEvenly)
    }
    .width('100%')
    .padding(20)
  }
}

@CustomDialog
struct DeleteDialog {

  controller: CustomDialogController = {
    open: (): void => {},
    close: (): void => {}
  }
  private cancel: () => void = () => {}
  private confirm: () => void = () => {}

  build() {
    Column({ space: 10 }) {
      Text('是否要删除该任务')
      Row() {
        Button('确认')
          .onClick(() => {
            this.confirm()
            this.controller?.close()
          })
        Button('取消')
          .backgroundColor(Color.Grey)
          .onClick(() => {
            this.cancel()
            this.controller?.close()
          })
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceEvenly)
    }
  }
}


@Component
export struct TaskList {

  // 使用自定义对话框
  addDialog: CustomDialogController = new CustomDialogController({
    builder: AddDialog({
      cancel: this.onCancel,
      confirm: this.onConfirm
    })
  })

  deleteDialog: CustomDialogController = new CustomDialogController({
    builder: DeleteDialog({
      cancel: this.onDelCancel,
      confirm: this.onDelConfirm
    })
  })

  @Link finishTask: number
  @Link totalTask: number
  @State tasks: TaskInfo[] = []
  delId: number = 0
  delIndex: number = 0

  aboutToAppear(): void {
    TaskModel.getTaskList()
      .then(tasks => {
        if (tasks) {
          this.tasks = tasks
          this.handleTaskChange()
        }
      })
  }

  onDelCancel() {
    this.deleteDialog.close()
  }

  onDelConfirm() {
    TaskModel.deleteTaskById(this.delId)
      ?.then(() => {
      this.tasks.splice(this.delIndex, 1)
      this.handleTaskChange()
      this.deleteDialog.close()
    })
  }

  onCancel() {
    this.addDialog.close()
  }

  handleTaskChange() {
    this.totalTask = this.tasks.length
    this.finishTask = this.tasks.filter((item) => (item.finished)).length
  }

  onConfirm(name: string) {
    // 1.新增任务
    TaskModel.addTask(name)
      .then(id => {
        // 回显到数组页面
        this.tasks.push(new TaskInfo(id, name))
        // 2.更新任务完成状态
        this.handleTaskChange()
        // 3.关闭对话框
        this.addDialog.close()
      })
      .catch((error: Error) => {
        console.error('err=>', error)
        promptAction.showToast({
          message: '新增任务失败：' + name,
          alignment: Alignment.Center
        })
      })
  }

  async handleUpdate(id: number, finished: boolean) {
    try {
      const res = TaskModel.updateTaskStatus(id, finished)
      if(res) {
        this.handleTaskChange()
      }
    } catch (e) {
      console.error('更新任务失败：', JSON.stringify(e))
    }
  }

  @Builder
  DeleteButton(id: number, index: number) {
    Button() {
      Image($r('app.media.ic_gallery_create'))
        .fillColor(Color.White)
        .width(20)
    }
    .width(40)
    .height(40)
    .type(ButtonType.Circle)
    .backgroundColor(Color.Red)
    .margin(5)
    .onClick(() => {
        this.delId = id
        this.delIndex = index
        this.deleteDialog.open()
    })
  }

  build() {
    Column() {
      Button('新增任务')
        .width(200)
        .margin({bottom: 10})
        .onClick(() => {
          this.addDialog.open()
        })

      List({space: 10}) {
        ForEach(this.tasks, (item: TaskInfo, index: number) => {
          ListItem() {
            TaskItem({ item: item, handleUpdate: this.handleUpdate })
          }
          .swipeAction({ end: this.DeleteButton(item.id, index) })
        })
      }
      .layoutWeight(1)
      .width('100%')
      .alignListItem(ListItemAlign.Center)
    }
  }
}

