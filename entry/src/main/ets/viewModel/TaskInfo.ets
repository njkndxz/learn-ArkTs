@Observed
export class TaskInfo {
  id: number
  // 任务名称
  name: string
  // 任务状态：是否完成
  finished: boolean

  constructor(id: number, name: string, finished: boolean = false) {
    this.id = id
    this.name = name
    this.finished = finished
  }
}

export interface TaskInfoType {
  id: number
  // 任务名称
  name: string
  // 任务状态：是否完成
  finished: boolean
}