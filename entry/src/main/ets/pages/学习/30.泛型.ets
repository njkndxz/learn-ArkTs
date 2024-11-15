import { window } from '@kit.ArkUI';

// 泛型： 类型可以作为参数传递，类型是可变的
function fn<T>(param: T): T {
  return param
}
fn<string>('aaa')
fn<number>(12)
fn<boolean>(true)
fn<number[]>([1, 2, 3])

// 会默认根据传参进行类型推断，动态配置T类型参数的值
fn('bbb')

// 练习1， 定义函数，参数是数组类型不定，返回数组长度
function getLens<T>(arr: T[]): number {
  return arr.length
}
getLens<number>([1, 2, 3])

// 练习2, 定义函数，参数是数组类型不定，返回数组最后一项
function getPop<T>(arr: T[]): T {
  return arr[arr.length - 1]
}
getPop<number>([1, 2, 3])



// 泛型约束: 给传递的类型参数，添加限制
interface ILength {
  length: number
}
function fn1<T extends ILength>(param: T) {
  return param.length
}
fn1<string>('aaa')
fn1<number[]>([1, 2, 3])

class Desk {
  length = 2
}

let d = new Desk()
fn1<Desk>(d)

// 多个泛型变量 => 传递多个类型参数
function fn2<T1, T2>(param1: T1, param2: T2) {
  console.log('参数1', param1)
  console.log('参数2', param2)
}
fn2<string, number>('aaa', 12)



// 泛型接口
interface IdFunc<T> {
  // 约定有两个方法(id类型不定，string number)
  // 1. 传入id值，返回id值
  // 2.返回一个ids数组
  id: (value: T) => T
  ids: () => T[]
}

let obj: IdFunc<number> = {
  id(value: number) {
    return value
  },
  ids() {
    return [1, 2, 3]
  }
}

// 泛型类
class Person<T> {
  id: T

  constructor(id: T) {
    this.id = id
  }

  getId(): T {
    return this.id
  }
}

let p1: Person<number> = new Person<number>(10)
let p2: Person<string> = new Person<string>('10')




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

  build() {
  }

}