import { TaskList } from './components/Task/TaskList';
import { TaskStatistics } from './components/Task/TaskStatistics';


@Entry
@Component
struct Index {

  @State totalTask: number = 0
  @State finishTask: number = 0

  build() {
    Column({ space: 10 }) {
      // 任务进度
      TaskStatistics({
        totalTask: this.totalTask,
        finishTask: this.finishTask
      })
      // 任务列表
      TaskList({
        totalTask: this.totalTask,
        finishTask: this.finishTask
      })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#ffeeeeee')
  }
}